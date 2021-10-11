import 'package:dart_bluez/bluez/bus_object.dart';
import 'package:dbus/dbus.dart';
import 'package:dart_bluez/bluez/dbus_client_singleton.dart';
import 'package:dart_bluez/bluez/bluez_common.dart';

class BluezObject extends BusObject {
  BluezObject(String path, String interface) : super(path, interface) {
    object = DBusRemoteObject(DbusClientSingleton().client,
        name: 'org.bluez', path: DBusObjectPath(path));
  }

  late DBusRemoteObject object;

  @override
  Future<String> getPropertyString(String property) async {
    final result = await object.getProperty(
        kBluezObjectPrefix + '.' + busInterface, property);
    return (result as DBusString).value;
  }

  @override
  Future<bool> getPropertyBool(String property) async {
    final result = await object.getProperty(
        kBluezObjectPrefix + '.' + busInterface, property);
    return (result as DBusBoolean).value;
  }

  @override
  Future<List<int>> getPropertyBytes(String property) async {
    final result = await object.getProperty(
        kBluezObjectPrefix + '.' + busInterface, property,
        signature: DBusSignature('ay'));
    final val = (result as DBusArray).children as List<DBusByte>;
    final bytes = <int>[];
    for (var b in val) {
      bytes.add(b.value);
    }
    return bytes;
  }

  @override
  Future<void> call(String method,
      {List<int> data = const [],
      String? replySignature,
      bool expectReply = true}) async {
    final typed = <DBusValue>[];
    for (int byte in data) {
      typed.add(DBusByte(byte));
    }
    await object.callMethod(
        kBluezObjectPrefix + '.' + busInterface, method, typed,
        noReplyExpected: !expectReply,
        replySignature:
            replySignature == null ? null : DBusSignature(replySignature));
  }
}

class BluezObjectFactory implements BusObjectFactory {
  @override
  BusObject busObject(String path, String interface) =>
      BluezObject(path, interface);
}

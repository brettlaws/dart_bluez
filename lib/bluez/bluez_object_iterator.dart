import 'package:dart_bluez/bluez/object_iterator.dart';
import 'package:dbus/dbus.dart';
import 'package:dart_bluez/bluez/bluez_common.dart';
import 'package:dart_bluez/bluez/dbus_client_singleton.dart';
import 'package:dart_bluez/string_checker.dart';

class BluezObjectIterator implements ObjectIterator {
  DBusClient get client => DbusClientSingleton().client;

  @override
  void iterateBluezObjects(
      List<bool Function(String)> conditions, Function(String) callback) async {
    final managedObjects = await _getBluezObjects();
    managedObjects.forEach((k, v) async {
      final path = k as DBusObjectPath;
      if (StringChecker.checkString(path.value, conditions)) {
        callback(path.value);
      }
    });
  }

  Future<Map<DBusValue, DBusValue>> _getBluezObjects() async {
    final DBusMethodSuccessResponse s = await client.callMethod(
        destination: kBluezObjectPrefix,
        path: DBusObjectPath('/'),
        name: 'GetManagedObjects',
        interface: kFreeDesktopObjectPrefix + '.ObjectManager',
        replySignature: DBusSignature('a{oa{sa{sv}}}'));
    final List<DBusValue> l = s.values;
    return (l.first as DBusDict).children;
  }
}

class BluezObjectIteratorFactory extends ObjectIteratorFactory {
  @override
  ObjectIterator objectIterator() => BluezObjectIterator();
}

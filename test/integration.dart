import 'package:dart_bluez/api/adapter_interface.dart';
import 'package:dart_bluez/api/adapter_manager_interface.dart';
import 'package:dart_bluez/bluez/bluez.dart';
import 'package:dbus/dbus.dart';

Future<void> deployFakeBluez() async {
  ;
}

void test() async {
  await deployFakeBluez();
  final AdapterManagerInterface bluetooth = Bluez();
  final List<AdapterInterface> adapters = await bluetooth.adapters;
  for (var adapter in adapters) {
    final devices = await adapter.scan(Duration(seconds: 5));
    for (var device in devices) {
      final deviceName = await device.name;
      if (deviceName.toLowerCase().contains('900n'.toLowerCase())) {
        await device.connect();
        await Future.delayed(Duration(seconds: 4));
        final services = await device.services;
        for (var service in services) {
          final characteristics = await service.characteristics;
        }
      }
    }
  }
}

class TestObject extends DBusObject {
  var callCount = 0;

  TestObject() : super(DBusObjectPath('/com/canonical/DBusDart'));

  @override
  List<DBusIntrospectInterface> introspect() {
    final testMethod = DBusIntrospectMethod('Test');
    final countProperty = DBusIntrospectProperty('Count', DBusSignature('x'),
        access: DBusPropertyAccess.read);
    return [
      DBusIntrospectInterface('com.canonical.DBusDart',
          methods: [testMethod], properties: [countProperty])
    ];
  }

  @override
  Future<DBusMethodResponse> handleMethodCall(DBusMethodCall methodCall) async {
    if (methodCall.interface != 'com.canonical.DBusDart') {
      return DBusMethodErrorResponse.unknownInterface();
    }

    if (methodCall.name == 'Test') {
      callCount++;
      return DBusMethodSuccessResponse([DBusString('Hello World!')]);
    } else {
      return DBusMethodErrorResponse.unknownMethod();
    }
  }

  @override
  Future<DBusMethodResponse> getProperty(String interface, String name) async {
    if (interface != 'com.canonical.DBusDart') {
      return DBusMethodErrorResponse.unknownInterface();
    }

    if (name == 'Count') {
      return DBusGetPropertyResponse(DBusInt64(callCount));
    } else {
      return DBusMethodErrorResponse.unknownProperty();
    }
  }

  @override
  Future<DBusMethodResponse> setProperty(
      String interface, String name, DBusValue value) async {
    if (interface != 'com.canonical.DBusDart') {
      return DBusMethodErrorResponse.unknownInterface();
    }

    if (name == 'Count') {
      return DBusMethodErrorResponse.propertyReadOnly();
    } else {
      return DBusMethodErrorResponse.unknownProperty();
    }
  }

  @override
  Future<DBusMethodResponse> getAllProperties(String interface) async {
    if (interface != 'com.canonical.DBusDart') {
      return DBusMethodErrorResponse.unknownInterface();
    }

    return DBusGetAllPropertiesResponse({'Count': DBusInt64(callCount)});
  }
}

void runDBus() async {
  var client = DBusClient.session();
  await client.requestName('com.canonical.DBusDart');
  await client.registerObject(TestObject());
}

main(List<String> args) async {}

import 'dart:developer';
import 'package:dart_bluez/api/device_interface.dart';
import 'package:dart_bluez/api/service_interface.dart';
import 'package:dart_bluez/bluez/bus_object.dart';
import 'package:dart_bluez/model/bluetooth_error.dart';
import 'package:dart_bluez/model/bluetooth_result.dart';
import 'package:dart_bluez/config.dart';
import 'bluez_service.dart';

class BluezDevice implements DeviceInterface {
  BluezDevice(this.object);

  final BusObject object;

  @override
  Future<List<ServiceInterface>> get services async {
    final services = <ServiceInterface>[];
    if (await connected) {
      objectManagerFactory.objectManager().iterateBluezObjects(
          [(s) => s.contains('${object.path}/service')],
          (path) => services.add(
              BluezService(busObjectFactory.busObject(path, 'GattService1'))));
    }
    return services;
  }

  @override
  Future<bool> get connected async {
    return await object.getPropertyBool('Connected');
  }

  @override
  Future<String> get macAddress async {
    return await object.getPropertyString('Address');
  }

  @override
  Future<String> get name async {
    try {
      final result = await object.getPropertyString('Name');
      return result;
    } catch (e) {
      log(BluetoothError(e.toString()).toString());
    }
    return 'n/a';
  }

  @override
  Future<BluetoothResult> connect() async {
    object.call('Connect', expectReply: false);
    return BluetoothResult.success;
  }

  @override
  Future<BluetoothResult> disconnect() async {
    object.call('Disconnect', expectReply: false);
    return BluetoothResult.success;
  }
}

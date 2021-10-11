import 'dart:developer';
import 'package:dart_bluez/api/bluetooth_device.dart';
import 'package:dart_bluez/api/bluetooth_error.dart';
import 'package:dart_bluez/api/bluetooth_result.dart';
import 'package:dart_bluez/api/bluetooth_service.dart';
import 'package:dart_bluez/bluez/bluez_object.dart';
import 'package:dart_bluez/config.dart';
import 'bluez_service.dart';

class BluezDevice extends BluezObject implements BluetoothDevice {
  BluezDevice(String path) : super(path);

  @override
  String get busInterface => 'Device1';

  @override
  Future<List<BluetoothService>> get services async {
    final services = <BluetoothService>[];
    if (await connected) {
      objectManagerFactory.objectManager().iterateBluezObjects(
          [(s) => s.contains('${object.path.value}/service')],
          (path) => services.add(BluezService(path)));
    }
    return services;
  }

  @override
  Future<bool> get connected async {
    return await getPropertyBool('Connected');
  }

  @override
  Future<String> get macAddress async {
    return await getPropertyString('Address');
  }

  @override
  Future<String> get name async {
    try {
      final result = await getPropertyString('Name');
      return result;
    } catch (e) {
      log(BluetoothError(e.toString()).toString());
    }
    return 'n/a';
  }

  @override
  Future<BluetoothResult> connect() async {
    await call('Connect', expectReply: false);
    return BluetoothResult.success;
  }

  @override
  Future<BluetoothResult> disconnect() async {
    await call('Disconnect', expectReply: false);
    return BluetoothResult.success;
  }
}

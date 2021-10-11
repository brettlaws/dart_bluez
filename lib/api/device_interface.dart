import 'package:dart_bluez/model/bluetooth_result.dart';

import 'service_interface.dart';

abstract class DeviceInterface {
  Future<String> get name;
  Future<String> get macAddress;
  Future<bool> get connected;
  Future<BluetoothResult> connect();
  Future<BluetoothResult> disconnect();
  Future<List<ServiceInterface>> get services;
}

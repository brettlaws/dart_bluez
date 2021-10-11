import 'package:dart_bluez/api/bluetooth_result.dart';
import 'package:dart_bluez/api/device_information.dart';

import 'bluetooth_service.dart';

abstract class BluetoothDevice {
  Future<String> get name;
  Future<String> get macAddress;
  Future<bool> get connected;
  Future<BluetoothResult> connect();
  Future<BluetoothResult> disconnect();
  Future<List<BluetoothService>> get services;
}

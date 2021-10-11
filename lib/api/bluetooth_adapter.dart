import 'package:dart_bluez/api/bluetooth_device.dart';

abstract class BluetoothAdapter {
  Future<String> get name;
  Future<String> get macAddress;
  Future<List<BluetoothDevice>> scan(Duration duration);
}

import 'package:dart_bluez/api/ble_advertisement.dart';
import 'package:dart_bluez/api/bluetooth_result.dart';

abstract class BleAdvertisingManager {
  Future<BluetoothResult> registerAdvertisiment(BleAdvertisement advertisement);
  Future<BluetoothResult> unregisterAdvertisiment(
      BleAdvertisement advertisement);
}

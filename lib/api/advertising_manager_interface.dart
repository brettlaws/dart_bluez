import 'package:dart_bluez/api/advertisement_interface.dart';
import 'package:dart_bluez/model/bluetooth_result.dart';

abstract class AdvertisingManagerInterface {
  Future<BluetoothResult> registerAdvertisiment(
      AdvertisementInterface advertisement);
  Future<BluetoothResult> unregisterAdvertisiment(
      AdvertisementInterface advertisement);
}

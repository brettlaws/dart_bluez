import 'package:dart_bluez/api/gatt_application_interface.dart';
import 'package:dart_bluez/model/bluetooth_result.dart';

abstract class GattManagerInterface {
  Future<BluetoothResult> registerApplication(
      GattApplicationInterface application);
  Future<BluetoothResult> unregisterApplication(
      GattApplicationInterface application);
}

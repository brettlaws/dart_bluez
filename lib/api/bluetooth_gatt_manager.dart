import 'package:dart_bluez/api/gatt_application.dart';

import 'bluetooth_result.dart';

abstract class BluetoothGattManager {
  Future<BluetoothResult> registerApplication(GattApplication application);
  Future<BluetoothResult> unregisterApplication(GattApplication application);
}

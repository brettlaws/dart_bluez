import 'package:dart_bluez/api/bluetooth_profile.dart';

import 'bluetooth_result.dart';

abstract class BluetoothProfileManager {
  Future<BluetoothResult> registerProfile(BluetoothProfile profile);
  Future<BluetoothResult> unregisterProfile(BluetoothProfile profile);
}

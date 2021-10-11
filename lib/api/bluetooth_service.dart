import 'package:dart_bluez/api/bluetooth_uuid.dart';

import 'bluetooth_characteristic.dart';

abstract class BluetoothService {
  Future<BluetoothUuid> get uuid;
  Future<List<BluetoothCharacteristic>> get characteristics;
}

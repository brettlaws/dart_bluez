import 'bluetooth_adapter.dart';

abstract class BluetoothManager {
  Future<List<BluetoothAdapter>> get adapters;
}

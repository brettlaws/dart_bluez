import 'package:dart_bluez/model/bluetooth_uuid.dart';
import 'characteristic_interface.dart';

abstract class ServiceInterface {
  Future<BluetoothUuid> get uuid;
  Future<List<CharacteristicInterface>> get characteristics;
}

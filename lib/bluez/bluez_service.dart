import 'package:dart_bluez/api/characteristic_interface.dart';
import 'package:dart_bluez/api/service_interface.dart';
import 'package:dart_bluez/bluez/bus_object.dart';
import 'package:dart_bluez/model/bluetooth_uuid.dart';
import 'package:dart_bluez/config.dart';
import 'bluez_characteristic.dart';

class BluezService implements ServiceInterface {
  BluezService(this.object);

  final BusObject object;

  @override
  Future<BluetoothUuid> get uuid async {
    final id = await object.getPropertyString('UUID');
    return BluetoothUuid(id);
  }

  @override
  Future<List<CharacteristicInterface>> get characteristics async {
    final characteristics = <CharacteristicInterface>[];
    objectIteratorFactory.objectIterator().iterateBluezObjects(
        [(s) => s.contains('${object.path}/char')],
        (path) => characteristics.add(BluezCharacteristic(
            busObjectFactory.busObject(path, 'GattCharacteristic1'))));
    return characteristics;
  }
}

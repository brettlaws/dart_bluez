import 'package:dart_bluez/api/bluetooth_characteristic.dart';
import 'package:dart_bluez/api/bluetooth_service.dart';
import 'package:dart_bluez/api/bluetooth_uuid.dart';
import 'package:dart_bluez/bluez/bus_object.dart';
import 'package:dart_bluez/config.dart';
import 'bluez_characteristic.dart';

class BluezService implements BluetoothService {
  BluezService(this.object);

  final BusObject object;

  @override
  Future<BluetoothUuid> get uuid async {
    final id = await object.getPropertyString('UUID');
    return BluetoothUuid(id);
  }

  @override
  Future<List<BluetoothCharacteristic>> get characteristics async {
    final characteristics = <BluetoothCharacteristic>[];
    objectManagerFactory.objectManager().iterateBluezObjects(
        [(s) => s.contains('${object.path}/char')],
        (path) => characteristics.add(BluezCharacteristic(
            busObjectFactory.busObject(path, 'GattCharacteristic1'))));
    return characteristics;
  }
}

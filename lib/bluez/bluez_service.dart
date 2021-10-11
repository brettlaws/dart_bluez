import 'package:dart_bluez/api/bluetooth_characteristic.dart';
import 'package:dart_bluez/api/bluetooth_service.dart';
import 'package:dart_bluez/api/bluetooth_uuid.dart';
import 'package:dart_bluez/bluez/bluez_object.dart';
import 'package:dart_bluez/config.dart';
import 'bluez_characteristic.dart';

class BluezService extends BluezObject implements BluetoothService {
  BluezService(String path) : super(path);

  @override
  String get busInterface => 'GattService1';

  @override
  Future<BluetoothUuid> get uuid async {
    final id = await getPropertyString('UUID');
    return BluetoothUuid(id);
  }

  @override
  Future<List<BluetoothCharacteristic>> get characteristics async {
    final characteristics = <BluetoothCharacteristic>[];
    objectManagerFactory.objectManager().iterateBluezObjects(
        [(s) => s.contains('${object.path.value}/char')],
        (path) => characteristics.add(BluezCharacteristic(path)));
    return characteristics;
  }
}

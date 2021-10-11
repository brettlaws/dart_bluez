import 'package:dart_bluez/api/characteristic_interface.dart';
import 'package:dart_bluez/bluez/bus_object.dart';
import 'package:dart_bluez/model/bluetooth_uuid.dart';

class BluezCharacteristic implements CharacteristicInterface {
  BluezCharacteristic(this.object);

  final BusObject object;

  @override
  Future<BluetoothUuid> get uuid async {
    final id = await object.getPropertyString('UUID');
    return BluetoothUuid(id);
  }

  @override
  Future<List<int>> read() async {
    return await object.getPropertyBytes('Value');
  }

  @override
  void write(List<int> value) async {
    object.call('Write', data: value);
  }
}

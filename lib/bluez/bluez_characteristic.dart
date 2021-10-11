import 'package:dart_bluez/api/bluetooth_characteristic.dart';
import 'package:dart_bluez/api/bluetooth_uuid.dart';
import 'package:dart_bluez/bluez/bus_object.dart';

class BluezCharacteristic implements BluetoothCharacteristic {
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

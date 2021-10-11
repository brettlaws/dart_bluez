import 'package:dart_bluez/api/bluetooth_characteristic.dart';
import 'package:dart_bluez/api/bluetooth_uuid.dart';
import 'package:dart_bluez/bluez/bluez_object.dart';

class BluezCharacteristic extends BluezObject
    implements BluetoothCharacteristic {
  BluezCharacteristic(String path) : super(path);

  @override
  String get busInterface => 'GattCharacteristic1';

  @override
  Future<BluetoothUuid> get uuid async {
    final id = await getPropertyString('UUID');
    return BluetoothUuid(id);
  }

  @override
  Future<List<int>> read() async {
    return await getPropertyBytes('Value');
  }

  @override
  void write(List<int> value) async {
    call('Write', data: value);
  }
}

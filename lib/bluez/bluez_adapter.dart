import 'package:dart_bluez/api/bluetooth_adapter.dart';
import 'package:dart_bluez/api/bluetooth_device.dart';
import 'package:dart_bluez/bluez/bluez_object.dart';
import 'package:dart_bluez/config.dart';
import 'bluez_device.dart';

class BluezAdapter extends BluezObject implements BluetoothAdapter {
  BluezAdapter(String path) : super(path);

  @override
  String get busInterface => 'Adapter1';

  @override
  Future<String> get macAddress async {
    return await getPropertyString('Address');
  }

  @override
  Future<String> get name async {
    return await getPropertyString('Name');
  }

  @override
  Future<List<BluetoothDevice>> scan(Duration duration) async {
    final s = <BluetoothDevice>[];
    await call('StartDiscovery', expectReply: false);
    await Future.delayed(
        duration, () async => await call('StopDiscovery', expectReply: false));
    objectManagerFactory.objectManager().iterateBluezObjects([
      (s) => s.contains('${object.path.value}/dev_'),
      (s) =>
          s.substring('${object.path.value}/dev_'.length).contains('/') == false
    ], (path) => s.add(BluezDevice(path)));
    return s;
  }
}

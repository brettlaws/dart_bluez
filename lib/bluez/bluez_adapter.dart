import 'package:dart_bluez/api/adapter_interface.dart';
import 'package:dart_bluez/api/device_interface.dart';
import 'package:dart_bluez/bluez/bus_object.dart';
import 'package:dart_bluez/config.dart';
import 'bluez_device.dart';

class BluezAdapter implements AdapterInterface {
  BluezAdapter(this.object);

  final BusObject object;

  @override
  Future<String> get macAddress async {
    return await object.getPropertyString('Address');
  }

  @override
  Future<String> get name async {
    return await object.getPropertyString('Name');
  }

  @override
  Future<List<DeviceInterface>> scan(Duration duration) async {
    final s = <DeviceInterface>[];
    object.call('StartDiscovery', expectReply: false);
    await Future.delayed(
        duration, () async => object.call('StopDiscovery', expectReply: false));
    objectIteratorFactory.objectIterator().iterateBluezObjects(
        [
          (s) => s.contains('${object.path}/dev_'),
          (s) =>
              s.substring('${object.path}/dev_'.length).contains('/') == false
        ],
        (path) =>
            s.add(BluezDevice(busObjectFactory.busObject(path, 'Device1'))));
    return s;
  }
}

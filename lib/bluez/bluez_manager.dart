import 'package:dart_bluez/api/bluetooth_adapter.dart';
import 'package:dart_bluez/api/bluetooth_manager.dart';
import 'package:dart_bluez/bluez/bluez_common.dart';
import 'package:dart_bluez/bluez/bluez_object_manager.dart';
import '../config.dart';
import 'bluez_adapter.dart';

class BluezManager extends BluezObjectManager implements BluetoothManager {
  BluezManager();

  @override
  Future<List<BluetoothAdapter>> get adapters async {
    final l = <BluezAdapter>[];
    iterateBluezObjects(
        [
          (s) => s.contains(kBluezPathPrefix),
          (s) => s.contains('dev') == false,
        ],
        (path) =>
            l.add(BluezAdapter(busObjectFactory.busObject(path, 'Adapter1'))));
    return l;
  }
}

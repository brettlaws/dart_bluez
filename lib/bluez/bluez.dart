import 'package:dart_bluez/api/adapter_interface.dart';
import 'package:dart_bluez/api/adapter_manager_interface.dart';
import 'package:dart_bluez/bluez/bluez_common.dart';
import 'package:dart_bluez/bluez/bluez_object_iterator.dart';
import '../config.dart';
import 'bluez_adapter.dart';

class Bluez extends BluezObjectIterator implements AdapterManagerInterface {
  Bluez();

  @override
  Future<List<AdapterInterface>> get adapters async {
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

import 'package:dart_bluez/bluez/bus_object.dart';
import 'package:dart_bluez/bluez/object_manager.dart';
import 'package:dart_bluez/config.dart';
import 'package:dart_bluez/string_checker.dart';

class MockObjectManager implements ObjectManager {
  final objects = <BusObject>[
    busObjectFactory.busObject('/some/path', 'some.interface')
  ];

  @override
  void iterateBluezObjects(List<bool Function(String path)> conditions,
      Function(String p1) callback) async {
    for (var o in objects) {
      if (StringChecker.checkString(o.path, conditions)) {
        callback(o.path);
      }
    }
  }
}

class MockObjectManagerFactory implements ObjectManagerFactory {
  @override
  ObjectManager objectManager() => MockObjectManager();
}

import 'package:dart_bluez/bluez/object_manager.dart';
import 'package:dart_bluez/string_checker.dart';

import 'mock_bus_object.dart';

class MockObjectManager implements ObjectManager {
  final objects = <MockBusObject>[];

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

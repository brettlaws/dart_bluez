import 'package:dart_bluez/bluez/bluez_object.dart';
import 'package:dart_bluez/bluez/bus_object.dart';
import 'package:dart_bluez/implementation.dart';
import 'package:dart_bluez/bluez/object_iterator.dart';
import 'package:dart_bluez/bluez/bluez_object_iterator.dart';
import 'package:dart_bluez/mock/mock_bus_object.dart';

Implementation implementation = Implementation.release;

ObjectIteratorFactory get objectIteratorFactory {
  return BluezObjectIteratorFactory();
}

BusObjectFactory get busObjectFactory {
  switch (implementation) {
    case Implementation.unit:
      return MockBusObjectFactory();
    default:
      return BluezObjectFactory();
  }
}

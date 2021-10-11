import 'package:dart_bluez/implementation.dart';
import 'package:dart_bluez/bluez/object_manager.dart';
import 'package:dart_bluez/bluez/bluez_object_manager.dart';

final implementation = Implementation.integration;

ObjectManagerFactory get objectManagerFactory {
  return BluezObjectManagerFactory();
}

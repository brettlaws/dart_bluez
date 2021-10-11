import 'package:dart_bluez/api/device_interface.dart';

abstract class AdapterInterface {
  Future<String> get name;
  Future<String> get macAddress;
  Future<List<DeviceInterface>> scan(Duration duration);
}

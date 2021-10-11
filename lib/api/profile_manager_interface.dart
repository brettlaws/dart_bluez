import 'package:dart_bluez/api/profile_interface.dart';
import 'package:dart_bluez/model/bluetooth_result.dart';

abstract class ProfileManagerInterface {
  Future<BluetoothResult> registerProfile(ProfileInterface profile);
  Future<BluetoothResult> unregisterProfile(ProfileInterface profile);
}

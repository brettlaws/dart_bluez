import 'package:dart_bluez/api/bluetooth_agent.dart';

import 'bluetooth_result.dart';

abstract class BluetoothAgentManager {
  Future<BluetoothResult> registerAgent(BluetoothAgent agent);
  Future<BluetoothResult> unregisterAgent(BluetoothAgent agent);
}

import 'package:dart_bluez/api/agent_interface.dart';
import 'package:dart_bluez/model/bluetooth_result.dart';

abstract class AgentManagerInterface {
  Future<BluetoothResult> registerAgent(AgentInterface agent);
  Future<BluetoothResult> unregisterAgent(AgentInterface agent);
}

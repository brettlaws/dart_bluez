import 'dart:async';

import 'package:dart_bluez/model/bluetooth_uuid.dart';

abstract class CharacteristicInterface {
  // final controller = StreamController<List<int>>();

  Future<BluetoothUuid> get uuid;
  Future<List<int>> read();
  void write(List<int> value);

  // void listen(Function(List<int>) cb) {
  //   controller.stream.listen((event) => cb(event));
  // }
}

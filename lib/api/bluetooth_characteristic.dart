import 'dart:async';

import 'package:dart_bluez/api/bluetooth_uuid.dart';

abstract class BluetoothCharacteristic {
  // final controller = StreamController<List<int>>();

  Future<BluetoothUuid> get uuid;
  Future<List<int>> read();
  void write(List<int> value);

  // void listen(Function(List<int>) cb) {
  //   controller.stream.listen((event) => cb(event));
  // }
}

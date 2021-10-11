import 'package:dart_bluez/bluez/bus_object.dart';

class MockBusObject extends BusObject {
  MockBusObject(String path, String interface) : super(path, interface);

  final String _doing = 'something';
  bool _doingSomething = false;

  @override
  void call(String method,
      {List<int> data = const [],
      String? replySignature,
      bool expectReply = true}) {
    if (method == 'DoSomething') {
      _doingSomething = true;
    } else if (method == 'DoNothing') {
      _doingSomething = false;
    } else {
      throw Exception('Method $method doesn\'t exist.');
    }
  }

  @override
  Future<bool> getPropertyBool(String property) async {
    if (property == 'DoingSomething') {
      return _doingSomething;
    } else {
      throw Exception('Invalid property $property');
    }
  }

  @override
  Future<List<int>> getPropertyBytes(String property) async {
    if (property == 'data') {
      return [1, 2, 3];
    } else {
      throw Exception('Invalid property $property');
    }
  }

  @override
  Future<String> getPropertyString(String property) async {
    if (property == 'Doing') {
      return _doing;
    } else {
      throw Exception('Invalid property $property');
    }
  }
}

class MockBusObjectFactory implements BusObjectFactory {
  @override
  BusObject busObject(String path, String interface) =>
      MockBusObject(path, interface);
}

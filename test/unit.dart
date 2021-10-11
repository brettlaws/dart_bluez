import 'package:dart_bluez/config.dart';
import 'package:dart_bluez/implementation.dart';
import 'package:test/test.dart';

main(List<String> args) {
  implementation = Implementation.unit;

  group('Bus Object Interface', () {
    final object = busObjectFactory.busObject('/some/path', 'some.interface');
    test('Assignments from constructor arguments', () {
      expect(object.path, '/some/path');
      expect(object.busInterface, 'some.interface');
    });

    test('getPropertyBool(), call()', () async {
      expect(await object.getPropertyBool('DoingSomething'), false);

      object.call('DoSomething');
      expect(await object.getPropertyBool('DoingSomething'), true);

      object.call('DoNothing');
      expect(await object.getPropertyBool('DoingSomething'), false);
    });

    test('getPropertyString', () async {
      expect(await object.getPropertyString('Doing'), 'something');
    });

    test('Method doesn\'t exist', () async {
      bool caughtException = false;
      try {
        object.call('foo');
      } catch (e) {
        caughtException = true;
      }
      expect(caughtException, true);
    });
  });
}

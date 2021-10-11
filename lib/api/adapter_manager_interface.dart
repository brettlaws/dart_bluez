import 'adapter_interface.dart';

abstract class AdapterManagerInterface {
  Future<List<AdapterInterface>> get adapters;
}

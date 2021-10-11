abstract class ObjectIterator {
  void iterateBluezObjects(
      List<bool Function(String)> conditions, Function(String) callback);
}

abstract class ObjectIteratorFactory {
  ObjectIterator objectIterator();
}

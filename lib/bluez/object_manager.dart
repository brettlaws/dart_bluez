abstract class ObjectManager {
  void iterateBluezObjects(
      List<bool Function(String)> conditions, Function(String) callback);
}

abstract class ObjectManagerFactory {
  ObjectManager objectManager();
}

abstract class BusObject {
  BusObject(this.path, this.busInterface);

  final String path;

  String busInterface;

  Future<String> getPropertyString(String property);

  Future<bool> getPropertyBool(String property);

  Future<List<int>> getPropertyBytes(String property);

  void call(String method,
      {List<int> data = const [],
      String? replySignature,
      bool expectReply = true});
}

abstract class BusObjectFactory {
  BusObject busObject(String path, String interface);
}

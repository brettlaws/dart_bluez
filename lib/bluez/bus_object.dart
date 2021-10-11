abstract class BusObject {
  BusObject(this.path);

  final String path;

  String get busInterface;

  Future<String> getPropertyString(String property);

  Future<bool> getPropertyBool(String property);

  Future<List<int>> getPropertyBytes(String property);

  void call(String method,
      {List<int> data = const [],
      String? replySignature,
      bool expectReply = true});
}

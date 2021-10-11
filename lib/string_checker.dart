class StringChecker {
  StringChecker({required this.string, required this.conditions});

  final String string;
  final List<bool Function(String)> conditions;

  bool get result => checkString(string, conditions);

  static bool checkString(
      String string, List<bool Function(String)> conditions) {
    for (var condition in conditions) {
      if (condition(string) == false) return false;
    }
    return true;
  }
}

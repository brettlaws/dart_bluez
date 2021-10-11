class BluetoothError {
  BluetoothError(this.message);

  final String message;

  String get toLog => 'BLUEZ-DART:' + message;
}

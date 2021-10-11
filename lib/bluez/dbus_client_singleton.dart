import 'package:dbus/dbus.dart';

class DbusClientSingleton {
  static final DbusClientSingleton _dbusClientHandle =
      DbusClientSingleton._internal();

  factory DbusClientSingleton() {
    return _dbusClientHandle;
  }

  DbusClientSingleton._internal();

  final client = DBusClient.system();
}

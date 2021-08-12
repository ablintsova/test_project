import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static FlutterSecureStorage get _secureStorage => FlutterSecureStorage();

  static Future<void> writeTokenToStorage(String token) async {
    _secureStorage.write(key: "token", value: token);
  }

  static Future<String?> readFromSecureStorage() async {
    return _secureStorage.read(key: "token");
  }
}

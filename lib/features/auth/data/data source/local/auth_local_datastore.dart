import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String value, String key);
  Future<String?> getToken(String key);
  Future<void> clear(String key);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage storage;
  AuthLocalDataSourceImpl(this.storage);

  @override
  Future<void> saveToken(String value, String key) async => await storage.write(key: key, value: value);

  @override
  Future<String?> getToken(String key) async => await storage.read(key: key);

  @override
  Future<void> clear(String key) async => await storage.delete(key: key);
}
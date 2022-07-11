import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  // ignore: constant_identifier_names
  static const KEY = "session";

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> setStorage(String valor) async {
    await _storage.write(key: KEY, value: jsonEncode(valor));
  }

  Future<void> clearStorage() async {
    await _storage.delete(key: KEY);
    print("elimindado");
  }

  Future<String?> getStorage() async {
    final String? data = await _storage.read(key: KEY);
    if (data != null) {
      final String request = jsonDecode(data);

      return request;
    }
    //final String request = jsonDecode(data!);
    return null;
  }
}

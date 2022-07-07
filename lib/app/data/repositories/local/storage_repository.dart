
import 'package:app_music_flutter/app/data/providers/local/storage.dart';

class StorageRepository {
  final LocalStorage _local = LocalStorage();

  Future<void> setSession(String request) => _local.setStorage(request);

  Future<void> clearSession() => _local.clearStorage();

  Future<String?> get session => _local.getStorage();
}

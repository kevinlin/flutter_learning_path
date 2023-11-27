import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class StorageService {
  Future<void> writeSecureData(StorageItem newItem);

  Future<String?> readSecureData(String key);

  Future<void> deleteSecureData(StorageItem item);
}

class DefaultStorageService implements StorageService {
  final _secureStorage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(encryptedSharedPreferences: true);

  @override
  Future<void> writeSecureData(StorageItem newItem) async {
    await _secureStorage.write(
        key: newItem.key, value: newItem.value, aOptions: _getAndroidOptions());
  }

  @override
  Future<String?> readSecureData(String key) async {
    var readData = await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }

  @override
  Future<void> deleteSecureData(StorageItem item) async {
    await _secureStorage.delete(key: item.key, aOptions: _getAndroidOptions());
  }
}

class StorageItem {
  StorageItem(this.key, this.value);

  final String key;
  final String value;
}

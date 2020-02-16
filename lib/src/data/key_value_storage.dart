import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class KeyValueStorage {
  StreamingSharedPreferences _storage;

  Future<void> init() async {
    _storage = await StreamingSharedPreferences.instance;
  }

  bool getBoolean(String key) => _storage.getBool(key, defaultValue: null).getValue();

  double getDouble(String key) => _storage.getDouble(key, defaultValue: null).getValue();

  int getInt(String key) => _storage.getInt(key, defaultValue: null).getValue();

  String getString(String key) => _storage.getString(key, defaultValue: null).getValue();

  ///

  Stream<bool> streamBoolean(String key) => _storage.getBool(key, defaultValue: null);

  Stream<double> streamDouble(String key) => _storage.getDouble(key, defaultValue: null);

  Stream<int> streamInt(String key) => _storage.getInt(key, defaultValue: null);

  Stream<String> streamString(String key) => _storage.getString(key, defaultValue: null);

  ///

  Future<void> putBoolean(String key, bool value) => _storage.setBool(key, value);

  Future<void> putDouble(String key, double value) => _storage.setDouble(key, value);

  Future<void> putInt(String key, int value) => _storage.setInt(key, value);

  Future<void> putString(String key, String value) => _storage.setString(key, value);

  ///

  Future<void> removeKey(String key) => _storage.remove(key);

  Future<void> removeKeys(List<String> keys) => Future.forEach(keys, (key) => removeKey(key));

  Future<void> removeAll() => _storage.clear();
}

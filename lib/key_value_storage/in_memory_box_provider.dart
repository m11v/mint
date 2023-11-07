import 'key_value_storage_provider.dart';

class InMemoryBoxProvider extends KeyValueStorageProvider<String, dynamic> {
  InMemoryBoxProvider._internal();

  final Map<String, dynamic> _box = {};
  static final Map<String, InMemoryBoxProvider> _cache = {};

  static InMemoryBoxProvider create(String name) {
    if (_cache.containsKey(name)) {
      throw InMemoryBoxProviderHasBeenCreatedError(name);
    }

    final InMemoryBoxProvider instance = InMemoryBoxProvider._internal();
    _cache[name] = instance;
    return instance;
  }

  static InMemoryBoxProvider getInstance(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    } else {
      throw NoInMemoryBoxProviderError();
    }
  }

  @override
  bool containsKey(String key) {
    return _box.containsKey(key);
  }

  @override
  get(String key, {dynamic defaultValue}) {
    return _box[key] ?? defaultValue;
  }

  @override
  Future<void> put(String key, dynamic value) async {
    return _box[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    return _box.remove(key);
  }

  void clear() {
    return _box.clear();
  }

  static void dispose() {
    _cache.clear();
  }
}

class NoInMemoryBoxProviderError extends Error {
  NoInMemoryBoxProviderError();

  @override
  String toString() =>
      'InMemoryBoxProvider: The InMemoryBoxProvider is not created. Call InMemoryBoxProvider.create() to create one';
}

class InMemoryBoxProviderHasBeenCreatedError extends Error {
  InMemoryBoxProviderHasBeenCreatedError(String boxName) : _boxName = boxName;

  final String _boxName;

  @override
  String toString() =>
      'InMemoryBoxProviderHasBeenCreatedError: A InMemoryBoxProvider $_boxName is already created.';
}

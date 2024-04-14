import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'key_value_storage_provider.dart';

class HiveBoxProvider extends KeyValueStorageProvider<String, dynamic> {
  HiveBoxProvider._internal();

  late Box<dynamic> _box;
  static final Map<String, HiveBoxProvider> _cache = {};

  static Future<HiveBoxProvider> createAndInit({
    required String boxName,
    isFlutter = true,
  }) async {
    if (isFlutter) {
      await Hive.initFlutter();
    } else {
      Hive.init(Directory.current.path);
    }

    if (_cache.containsKey(boxName)) {
      throw HiveBoxProviderHasBeenCreatedError(boxName);
    }

    final HiveBoxProvider instance = HiveBoxProvider._internal();
    instance._box = await Hive.openBox(boxName);
    _cache[boxName] = instance;
    return instance;
  }

  static HiveBoxProvider getInstance({required String boxName}) {
    if (_cache.containsKey(boxName)) {
      return _cache[boxName]!;
    } else {
      throw NoHiveBoxProviderError();
    }
  }

  @override
  bool containsKey(String key) {
    return _box.containsKey(key);
  }

  @override
  get(String key, {dynamic defaultValue}) {
    return _box.get(key, defaultValue: defaultValue);
  }

  @override
  Future<void> put(String key, dynamic value) async {
    return _box.put(key, value);
  }

  @override
  Future<void> delete(String key) async {
    return _box.delete(key);
  }

  Future<void> close() async {
    _box.close();
  }

  static Future<void> dispose() async {
    _cache.values.onEach((item) {
      item.close();
    });
    _cache.clear();
  }
}

class NoHiveBoxProviderError extends Error {
  NoHiveBoxProviderError();

  @override
  String toString() =>
      'NoHiveBoxProviderError: The HiveBoxProvider is not created. Call HiveBoxProvider.create() to create one';
}

class HiveBoxProviderHasBeenCreatedError extends Error {
  HiveBoxProviderHasBeenCreatedError(String boxName) : _boxName = boxName;

  final String _boxName;

  @override
  String toString() =>
      'HiveBoxProviderHasBeenCreatedError: A HiveBoxProvider for $_boxName is already created.';
}

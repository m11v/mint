export 'hive_box_provider.dart';

abstract class KeyValueStorageProvider<K, V> {
  /// Checks whether the key value storage contains the [key].
  bool containsKey(K key);

  /// Saves the [key] - [value] pair.
  Future<void> put(K key, V value);

  /// Returns the value associated with the given [key]. If the key does not
  /// exist, `null` is returned.
  ///
  /// If [defaultValue] is specified, it is returned in case the key does not
  /// exist.
  V? get(K key, {V? defaultValue});

  /// Deletes the given [key]
  ///
  /// If it does not exist, nothing happens.
  Future<void> delete(K key);
}

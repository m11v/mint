import '../../key_value_storage/key_value_storage_provider.dart';

class HideAdRepository {
  static const _hideAdKey = 'hideAd';

  HideAdRepository({
    required KeyValueStorageProvider keyValueStorageProvider,
  }) : _keyValueStorageProvider = keyValueStorageProvider;

  final KeyValueStorageProvider _keyValueStorageProvider;

  bool get isAdHidden =>
      _keyValueStorageProvider.get(_hideAdKey, defaultValue: false);

  Future<bool> hideAd() async {
    await _keyValueStorageProvider.put(_hideAdKey, true);
    return isAdHidden;
  }

  Future<void> reset() async {
    await _keyValueStorageProvider.delete(_hideAdKey);
  }
}

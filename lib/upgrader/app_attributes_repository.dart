import '../key_value_storage/key_value_storage_provider.dart';
import 'upgrader.dart';

class AppAttributesRepository {
  AppAttributesRepository({
    AppAttributesApiClient? appAttributesApiClient,
    final KeyValueStorageProvider? keyValueStorageProvider,
  })  : _appAttributesApiClient =
            appAttributesApiClient ?? AppAttributesApiClient(),
        _keyValueStorageProvider = keyValueStorageProvider;

  static const _keyAppAttributes = 'key_app_attributes';

  final AppAttributesApiClient _appAttributesApiClient;
  final KeyValueStorageProvider? _keyValueStorageProvider;

  AppAttributes getLocalAppAttributes() {
    if (_keyValueStorageProvider != null &&
        _keyValueStorageProvider!.containsKey(_keyAppAttributes) == true) {
      final string = _keyValueStorageProvider!.get(_keyAppAttributes);
      return AppAttributes.fromJsonString(string);
    } else {
      return AppAttributes.empty;
    }
  }

  Future<void> saveLocalAppAttributes(
    AppAttributes appAttributes,
  ) async {
    await _keyValueStorageProvider?.put(
      _keyAppAttributes,
      appAttributes.toString(),
    );
  }

  Future<AppAttributes> getAppAttributesFromPage({
    required String pageUrl,
    required AppMarket market,
  }) async {
    return await _appAttributesApiClient.getAppAttributesFromPage(
      pageUrl: pageUrl,
      market: market,
    );
  }
}

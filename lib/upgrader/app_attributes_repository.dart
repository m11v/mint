import 'upgrader.dart';

class AppAttributesRepository {
  AppAttributesRepository({
    AppAttributesApiClient? appAttributesApiClient,
  }) : _appAttributesApiClient =
            appAttributesApiClient ?? AppAttributesApiClient();

  final AppAttributesApiClient _appAttributesApiClient;

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

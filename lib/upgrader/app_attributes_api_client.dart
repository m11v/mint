import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';

import 'models/models.dart';

class AppAttributesApiClient {
  AppAttributesApiClient({
    Dio? httpClient,
  }) : _httpClient = httpClient ?? Dio();

  final Dio _httpClient;

  Future<AppAttributes> getAppAttributesFromPage({
    required String pageUrl,
    required AppMarket market,
  }) async {
    try {
      final response = await _httpClient.get(pageUrl);
      final document = parse(response.data);
      final versionNameElements = document.getElementsByClassName(
          '${AppAttributesClassName.versionName.prefix}${market.name}');
      final versionCodeElements = document.getElementsByClassName(
          '${AppAttributesClassName.versionCode.prefix}${market.name}');
      final urlElements = document.getElementsByClassName(
          '${AppAttributesClassName.url.prefix}${market.name}');

      if (versionNameElements.isEmpty ||
          versionCodeElements.isEmpty ||
          urlElements.isEmpty) {
        return AppAttributes.empty;
      }
      final versionName = versionNameElements[0].text;
      final versionCode = versionCodeElements[0].text.toInt();
      final url = urlElements[0].text;
      return AppAttributes(
        versionName: versionName,
        versionCode: versionCode,
        url: url,
      );
    } catch (e) {
      return AppAttributes.empty;
    }
  }

  void dispose() {
    _httpClient.close();
  }
}

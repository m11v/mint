import 'dart:io';

import 'package:mintminter_mint/upgrader/app_attributes_api_client.dart';
import 'package:mintminter_mint/upgrader/models/app_attributes_platform.dart';

void main() async {
  final apiClient = AppAttributesApiClient();
  final attr = await apiClient.getAppAttributesFromPage(
    pageUrl:
        'https://mintminterdev.blogspot.com/p/easy-us-citizenship-test.html',
    market: AppMarket.playStore,
  );
  apiClient.dispose();
  stdout.writeln('👉 getAppAttributesFromPage is tested: $attr');
}

import 'package:example_mint/ad/example_ad_provider.dart';
import 'package:example_mint/app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ExampleAdProvider.getInstance().initializeMobileAdsOnMobile();

  runApp(const App());
}

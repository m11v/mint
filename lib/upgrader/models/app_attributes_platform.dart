import 'package:mintminter_mint/utils/platform.dart';

enum AppMarket {
  unknown(name: 'unknown'),
  playStore(name: 'playstore'),
  appStore(name: 'appstore');

  const AppMarket({
    required this.name,
  });
  final String name;
}

final defaultAppMarket = mobilePlatformFilter(
  onAndroid: () => AppMarket.playStore,
  oniOS: () => AppMarket.appStore,
  onNonMobile: () => AppMarket.unknown,
);

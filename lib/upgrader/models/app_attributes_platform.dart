enum AppMarket {
  playStore(name: 'playstore'),
  appStore(name: 'appstore');

  const AppMarket({
    required this.name,
  });
  final String name;
}

enum AppMarket {
  playStore(name: 'playstore');

  const AppMarket({
    required this.name,
  });
  final String name;
}

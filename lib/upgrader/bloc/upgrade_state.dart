part of 'upgrade_bloc.dart';

class UpgradeState extends Equatable {
  const UpgradeState({
    required this.url,
    required this.market,
  });

  final String? url;
  final AppMarket? market;

  static const initial = UpgradeState(
    url: null,
    market: null,
  );

  @override
  List<Object?> get props => [
        url,
        market,
      ];
}

extension UpgradeStateX on UpgradeState {
  bool get needUpgrade => market != null && url.isNotNullOrBlank;
}

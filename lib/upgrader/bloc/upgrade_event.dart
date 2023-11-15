part of 'upgrade_bloc.dart';

sealed class UpgradeEvent extends Equatable {
  const UpgradeEvent();
}

class UpgradeEventChecked extends UpgradeEvent {
  const UpgradeEventChecked({
    required this.versionCode,
    required this.pageUrl,
    required this.market,
  });

  final int versionCode;
  final String pageUrl;
  final AppMarket market;

  @override
  List<Object?> get props => [
        versionCode,
        pageUrl,
        market,
      ];
}

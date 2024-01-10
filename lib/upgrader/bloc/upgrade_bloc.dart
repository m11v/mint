import 'package:dartx/dartx.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mintminter_mint/mint.dart';

import '../upgrader.dart';

part 'upgrade_event.dart';
part 'upgrade_state.dart';

class UpgradeBloc extends Bloc<UpgradeEvent, UpgradeState> {
  UpgradeBloc({
    required AppAttributesRepository appAttributesRepository,
  })  : _appAttributesRepository = appAttributesRepository,
        super(UpgradeState.initial) {
    on<UpgradeEventChecked>(_onUpgradeEventChecked);
  }

  final AppAttributesRepository _appAttributesRepository;

  Future<void> _onUpgradeEventChecked(
      UpgradeEventChecked event, Emitter emit) async {
    final market = event.market ?? defaultAppMarket;

    final localAppAttributes = _appAttributesRepository.getLocalAppAttributes();
    if (event.versionCode < localAppAttributes.versionCode) {
      emit(UpgradeState(url: localAppAttributes.url, market: market));
    } else {
      final remoteAppAttributes =
          await _appAttributesRepository.getAppAttributesFromPage(
        pageUrl: event.pageUrl,
        market: market,
      );

      if (localAppAttributes.versionCode < remoteAppAttributes.versionCode) {
        await _appAttributesRepository.saveLocalAppAttributes(
          remoteAppAttributes,
        );
      }

      if (event.versionCode < remoteAppAttributes.versionCode) {
        emit(UpgradeState(url: remoteAppAttributes.url, market: market));
      }
    }
  }
}

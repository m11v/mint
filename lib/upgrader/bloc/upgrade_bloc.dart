import 'package:dartx/dartx.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final appAttributes = await _appAttributesRepository
        .getAppAttributesFromPage(pageUrl: event.pageUrl, market: event.market);

    if (event.versionCode < appAttributes.versionCode) {
      emit(UpgradeState(url: appAttributes.url, market: event.market));
    }
  }
}

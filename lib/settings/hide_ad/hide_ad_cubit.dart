import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mintminter_mint/mint.dart';
import 'package:mintminter_mint/settings/hide_ad/hide_ad_repository.dart';

import '../../key_value_storage/key_value_storage_provider.dart';

class HideAdCubit extends Cubit<bool> {
  HideAdCubit({
    required HideAdRepository hideAdRepository,
  })  : _hideAdRepository = hideAdRepository,
        super(false) {
    final hideAd = _hideAdRepository.isAdHidden;

    emit(hideAd);
  }

  final HideAdRepository _hideAdRepository;

  void hideAd() async {
    final hideAd = await _hideAdRepository.hideAd();
    emit(hideAd);
  }

  void reset() {
    _hideAdRepository.reset();
    emit(false);
  }
}

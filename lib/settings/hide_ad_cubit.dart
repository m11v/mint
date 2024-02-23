import 'package:flutter_bloc/flutter_bloc.dart';

import '../key_value_storage/key_value_storage_provider.dart';

class HideAdCubit extends Cubit<bool> {
  static const _hideAdKey = 'hideAd';

  HideAdCubit({
    required this.keyValueStorageProvider,
  }) : super(false) {
    final hideAd = keyValueStorageProvider.get(_hideAdKey, defaultValue: false);

    emit(hideAd);
  }

  final KeyValueStorageProvider keyValueStorageProvider;

  void hideAd() {
    keyValueStorageProvider.put(_hideAdKey, true);
    emit(true);
  }

  void reset() {
    keyValueStorageProvider.delete(_hideAdKey);
    emit(false);
  }
}

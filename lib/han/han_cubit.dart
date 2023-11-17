import 'package:flutter_bloc/flutter_bloc.dart';

import 'han.dart';

class HanCubit extends Cubit<HanType> {
  HanCubit() : super(HanType.unknown);

  void change({
    required HanType type,
  }) {
    emit(type);
  }
}

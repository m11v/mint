import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mintminter_mint/key_value_storage/key_value_storage.dart';

import '../han.dart';

part 'han_event.dart';
part 'han_state.dart';

class HanBloc extends Bloc<HanEvent, HanState> {
  static const _keyHanType = 'key_han_type';

  HanBloc({KeyValueStorageProvider? keyValueStorageProvider})
      : _keyValueStorageProvider = keyValueStorageProvider,
        super(HanState.initial) {
    on<_HanEventLoaded>(_onHanEventLoaded);
    on<HanEventChanged>(_onHanEventChanged);
    on<HanEventReset>(_onHanEventReset);

    add(const _HanEventLoaded());
  }

  final KeyValueStorageProvider? _keyValueStorageProvider;

  Future<void> _onHanEventLoaded(_HanEventLoaded event, Emitter emit) async {
    if (_keyValueStorageProvider != null &&
        _keyValueStorageProvider!.containsKey(_keyHanType) == true) {
      final index = _keyValueStorageProvider!.get(_keyHanType);
      final type = HanType.values[index];
      emit(HanState(hanType: type));
    }
  }

  Future<void> _onHanEventChanged(HanEventChanged event, Emitter emit) async {
    await _keyValueStorageProvider?.put(_keyHanType, event.hanType.index);
    emit(HanState(hanType: event.hanType));
  }

  Future<void> _onHanEventReset(HanEventReset event, Emitter emit) async {
    await _keyValueStorageProvider?.delete(_keyHanType);
    emit(const HanState(hanType: HanType.unknown));
  }
}

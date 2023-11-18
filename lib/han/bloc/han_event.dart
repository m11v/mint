part of 'han_bloc.dart';

sealed class HanEvent extends Equatable {
  const HanEvent();
}

class _HanEventLoaded extends HanEvent {
  const _HanEventLoaded();

  @override
  List<Object?> get props => [];
}

class HanEventChanged extends HanEvent {
  const HanEventChanged({
    required this.hanType,
  });

  final HanType hanType;

  @override
  List<Object?> get props => [
        hanType,
      ];
}

class HanEventReset extends HanEvent {
  const HanEventReset();

  @override
  List<Object?> get props => [];
}

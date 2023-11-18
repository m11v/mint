part of 'han_bloc.dart';

class HanState extends Equatable {
  const HanState({
    required this.hanType,
  });

  final HanType hanType;

  static const initial = HanState(
    hanType: HanType.unknown,
  );

  @override
  List<Object?> get props => [
        hanType,
      ];
}

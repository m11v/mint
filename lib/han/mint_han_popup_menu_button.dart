import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mintminter_mint/han/han.dart';

class MintHanPopupMenuButton extends StatelessWidget {
  const MintHanPopupMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HanCubit, HanType>(
      builder: (context, hanType) {
        return PopupMenuButton(
          icon: HanView(
            type: hanType,
          ),
          itemBuilder: (context) => HanType.values
              .map(
                (item) => PopupMenuItem(
                  value: item,
                  child: Text(item.menuItemText),
                ),
              )
              .toList(),
          onSelected: (type) => context.read<HanCubit>().change(type: type),
        );
      },
    );
  }
}

extension on HanType {
  String get menuItemText {
    switch (this) {
      case HanType.unknown:
        return '跟随系统';
      case HanType.simplified:
        return '简体中文';
      case HanType.traditional:
        return '繁體中文';
    }
  }
}

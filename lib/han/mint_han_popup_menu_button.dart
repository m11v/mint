import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mintminter_mint/han/han.dart';

class MintHanPopupMenuButton extends StatelessWidget {
  const MintHanPopupMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HanBloc, HanState>(
      builder: (context, state) {
        return PopupMenuButton(
          icon: HanView(
            type: state.hanType,
          ),
          itemBuilder: (context) => HanType.values
              .map(
                (item) => PopupMenuItem(
                  value: item,
                  child: Text(item.menuItemText),
                ),
              )
              .toList(),
          onSelected: (type) =>
              context.read<HanBloc>().add(HanEventChanged(hanType: type)),
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

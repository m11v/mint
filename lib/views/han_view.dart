import 'package:flutter/material.dart';

enum HanViewType {
  unknown,
  simplified,
  traditional,
}

extension HanViewTypeX on HanViewType {
  String get text {
    switch (this) {
      case HanViewType.unknown:
        return '文';
      case HanViewType.simplified:
        return '简';
      case HanViewType.traditional:
        return '繁';
    }
  }

  bool get isSelected {
    switch (this) {
      case HanViewType.unknown:
        return false;
      default:
        return true;
    }
  }
}

class HanView extends StatelessWidget {
  const HanView({
    super.key,
    required this.type,
  });

  final HanViewType type;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: type.isSelected
            ? colorScheme.primaryContainer
            : colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: colorScheme.primaryContainer),
      ),
      width: 24,
      height: 24,
      alignment: Alignment.center,
      child: Text(
        type.text,
        style: TextStyle(
          color: type.isSelected
              ? colorScheme.onPrimaryContainer
              : colorScheme.onPrimary,
          fontWeight: type.isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

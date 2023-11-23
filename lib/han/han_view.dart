import 'package:flutter/material.dart';
import 'package:mintminter_mint/extensions/context_extension.dart';
import 'han.dart';

class HanView extends StatelessWidget {
  const HanView({
    super.key,
    required this.type,
  });

  final HanType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type.isSelected
            ? context.primaryContainerColor
            : context.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: context.primaryContainerColor),
      ),
      width: 24,
      height: 24,
      alignment: Alignment.center,
      child: Text(
        type.text,
        style: TextStyle(
          color: type.isSelected
              ? context.onPrimaryContainerColor
              : context.onPrimaryColor,
          fontWeight: type.isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

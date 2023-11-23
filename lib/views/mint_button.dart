import 'package:flutter/material.dart';
import 'package:mintminter_mint/extensions/context_extension.dart';

class MintButton extends StatelessWidget {
  const MintButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  bool get isEnabled => onPressed != null;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isEnabled ? context.primaryColor : context.disabledColor,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onPressed: () {
          onPressed?.call();
        },
        child: Text(
          text,
          style: TextStyle(
              color: isEnabled ? Colors.white : Colors.white.withOpacity(0.7),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:mintminter_mint/extensions/context_extension.dart';

class MintFlatCard extends StatelessWidget {
  const MintFlatCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
  });

  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? context.primaryColor,
        border: Border.all(
          color: borderColor ?? (backgroundColor ?? context.primaryColor),
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 6),
      ),
      padding: padding ?? const EdgeInsets.all(16),
      margin: margin,
      child: child,
    );
  }
}

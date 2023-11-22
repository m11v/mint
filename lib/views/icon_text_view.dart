import 'package:flutter/material.dart';

class IconTextView extends StatelessWidget {
  const IconTextView({
    super.key,
    required this.icon,
    required this.text,
    this.padding,
  });

  final Widget icon;
  final Widget text;

  /// Insets a padding between its icon and text.
  ///
  /// If null, `EdgeInsets.only(left: 6)` is used.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(child: icon, alignment: PlaceholderAlignment.middle),
          WidgetSpan(
              child: Padding(
                padding: padding ?? const EdgeInsets.only(left: 6),
                child: text,
              ),
              alignment: PlaceholderAlignment.middle),
        ],
      ),
    );
  }
}

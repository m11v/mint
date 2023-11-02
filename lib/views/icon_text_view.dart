import 'package:flutter/material.dart';

class IconTextView extends StatelessWidget {
  const IconTextView({
    super.key,
    required this.icon,
    required this.text,
    this.color,
    this.iconSize,
    this.textStyle,
  });

  final IconData icon;
  final String text;
  final Color? color;
  final double? iconSize;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
              child: Icon(
                icon,
                size: iconSize,
                color: color ?? Theme.of(context).colorScheme.primary,
              ),
              alignment: PlaceholderAlignment.middle),
          WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  text,
                  style: textStyle ??
                      Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color:
                              color ?? Theme.of(context).colorScheme.primary),
                ),
              ),
              alignment: PlaceholderAlignment.middle),
        ],
      ),
    );
  }
}

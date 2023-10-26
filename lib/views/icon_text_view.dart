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
                size: iconSize ?? 16,
                color: color ?? Theme.of(context).colorScheme.onPrimary,
              ),
              alignment: PlaceholderAlignment.middle),
          WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  text,
                  style: textStyle ??
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                          color:
                              color ?? Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              alignment: PlaceholderAlignment.middle),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mintminter_mint/mint.dart';

class MintListTile extends StatelessWidget {
  const MintListTile({
    super.key,
    required this.leadingIconData,
    this.leadingSize,
    this.leadingColor,
    required this.title,
    this.titleStyle,
    this.description,
    this.descriptionStyle,
    this.tailingIconData,
    this.tailingSize,
    this.tailingColor,
    this.onTap,
  });

  final IconData leadingIconData;
  final double? leadingSize;
  final Color? leadingColor;
  final String title;
  final TextStyle? titleStyle;
  final String? description;
  final TextStyle? descriptionStyle;
  final IconData? tailingIconData;
  final double? tailingSize;
  final Color? tailingColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _IconView(
            iconData: leadingIconData,
            size: leadingSize ?? 24,
            color: leadingColor ?? context.colorScheme.primary,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: _ContentView(
              title: title,
              titleStyle: titleStyle,
              description: description,
              descriptionStyle: descriptionStyle,
            ),
          ),
          if (tailingIconData != null) ...[
            const SizedBox(
              width: 10,
            ),
            _IconView(
              iconData: tailingIconData!,
              size: tailingSize ?? 24,
              color: leadingColor ?? context.colorScheme.primary,
            )
          ],
        ],
      ),
    );
  }
}

class _IconView extends StatelessWidget {
  const _IconView({
    required this.iconData,
    this.size,
    this.color,
  });

  final IconData iconData;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView({
    required this.title,
    this.titleStyle,
    this.description,
    this.descriptionStyle,
  });

  final String title;
  final TextStyle? titleStyle;
  final String? description;
  final TextStyle? descriptionStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: titleStyle ??
              context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        if (description != null) ...[
          const SizedBox(
            height: 2,
          ),
          Text(
            description!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: descriptionStyle ?? context.textTheme.bodyMedium,
          ),
        ],
      ],
    );
  }
}

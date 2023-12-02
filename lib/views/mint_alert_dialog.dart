import 'package:flutter/material.dart';

import '../mint.dart';

class MintAlertDialog extends StatelessWidget {
  const MintAlertDialog({
    super.key,
    required this.titleText,
    required this.contentText,
    this.titleIconData,
    this.yesButtonText,
    this.noButtonText,
    this.onYesButtonTapped,
    this.onNoButtonTapped,
  });

  final IconData? titleIconData;
  final String? titleText;
  final String contentText;
  final String? yesButtonText;
  final String? noButtonText;
  final Function()? onYesButtonTapped;
  final Function()? onNoButtonTapped;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: IconTextView(
        icon: Icon(titleIconData ?? Icons.warning),
        text: Text(
          titleText ?? 'Confirmation',
          style: context.textTheme.titleSmall,
        ),
      ),
      content: Text(
        contentText,
        style: context.textTheme.bodyLarge,
      ),
      actions: [
        TextButton(
          onPressed: onYesButtonTapped,
          child: IconTextView(
            icon: Icon(
              Icons.check,
              color: Colors.green.shade700,
            ),
            text: Text(
              yesButtonText ?? 'YES',
              style: context.textTheme.titleMedium
                  ?.copyWith(color: Colors.green.shade700),
            ),
          ),
        ),
        TextButton(
          onPressed: onNoButtonTapped,
          child: Text(
            noButtonText ?? 'NO',
            style: context.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}

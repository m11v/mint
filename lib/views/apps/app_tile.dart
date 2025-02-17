import 'package:flutter/material.dart';
import 'package:mintminter_mint/mint.dart';

class AppTile extends StatelessWidget {
  const AppTile({
    super.key,
    required this.icon,
    required this.appName,
    required this.appUrl,
    this.description,
  });

  final String icon;
  final String appName;
  final String appUrl;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: context.onPrimaryContainerColor),
        ),
        child: Image.asset(
          icon,
        ),
      ),
      title: Text(
        appName,
        style: context.textTheme.titleMedium,
      ),
      subtitle: description != null
          ? Text(description!,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.onPrimaryContainerColor,
              ))
          : null,
      trailing: Icon(
        Icons.open_in_new,
        color: context.primaryColor.withAlpha(200),
      ),
      onTap: () {
        launchInBrowser(appUrl);
      },
    );
  }
}

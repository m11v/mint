import 'package:flutter/material.dart';

import '../mint.dart';

class AboutView extends StatelessWidget {
  const AboutView({
    super.key,
    required this.logoAssetName,
    required this.appName,
    required this.version,
    this.child,
  });

  final String logoAssetName;
  final String appName;
  final String version;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          logoAssetName,
          height: 100,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          appName,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          version,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
        const SizedBox(
          height: 10,
        ),
        const _DeveloperLinkView(),
        if (child != null) ...[
          const SizedBox(
            height: 10,
          ),
          child!,
        ],
      ],
    );
  }
}

class _DeveloperLinkView extends StatelessWidget {
  const _DeveloperLinkView();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Produced by ',
            ),
            WidgetSpan(
              child: Image.asset(
                MintImages.mintminter,
                width: 16,
                height: 16,
              ),
            ),
            const WidgetSpan(
                child: SizedBox(
              width: 4,
            )),
            const TextSpan(
                text: 'MintMinter',
                style: TextStyle(decoration: TextDecoration.underline)),
            WidgetSpan(
              child: Icon(
                Icons.open_in_new,
                size: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        launchInBrowser(
            'https://play.google.com/store/apps/dev?id=6660530813735178327');
      },
    );
  }
}

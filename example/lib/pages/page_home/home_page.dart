import 'package:example_mint/ad/example_ad_provider.dart';
import 'package:flutter/material.dart';
import 'package:mintminter_mint/mint.dart';
import 'package:mintminter_mint/views/about_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mintminter_mint Example'),
      ),
      body: PageContent(
        child: ListView(
          children: <Widget>[
            AdBanner(
              padding: const EdgeInsets.only(bottom: 20),
              type:
                  const ExampleTopBannerAndroid(unitId: AdIdProvider.mockAdId),
              adIdProvider: ExampleAdProvider.getInstance(),
            ),
            const _MintMinterAndroidAppsView(),
            const AboutView(
              logoAssetName: 'assets/images/mintminter.png',
              appName: 'Example App',
              version: 'version',
              child: Text('This is foot view'),
            )
          ],
        ),
      ),
    );
  }
}

class _MintMinterAndroidAppsView extends StatelessWidget {
  const _MintMinterAndroidAppsView();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(
                text: 'MintMinter Android Apps',
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
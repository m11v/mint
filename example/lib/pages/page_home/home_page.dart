import 'package:example_mint/ad/example_ad_provider.dart';
import 'package:example_mint/main.dart';
import 'package:flutter/material.dart';
import 'package:mintminter_mint/mint.dart';

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
            const _TestAboutView(),
            const SizedBox(
              height: 40,
            ),
            const _TestHiveView(),
            const SizedBox(
              height: 40,
            ),
            const _TestContentView(),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class _TestAboutView extends StatelessWidget {
  const _TestAboutView();

  @override
  Widget build(BuildContext context) {
    return const AboutView(
      logoAssetName: 'assets/images/mintminter.png',
      appName: 'Example App',
      version: 'version',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          guanyinlingqian2023Tile,
          Divider(),
          huangdaxianTile,
        ],
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

class _TestHiveView extends StatefulWidget {
  const _TestHiveView();

  @override
  State<_TestHiveView> createState() => _TestHiveViewState();
}

class _TestHiveViewState extends State<_TestHiveView> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = HiveBoxProvider.getInstance(boxName: appBoxName)
        .get('test_hive', defaultValue: 0);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text('Value: $value'),
      onTap: () {
        final newValue = value + 1;
        HiveBoxProvider.getInstance(boxName: appBoxName)
            .put('test_hive', newValue);
        setState(() {
          value = newValue;
        });
      },
    );
  }
}

class _TestContentView extends StatefulWidget {
  const _TestContentView();

  @override
  State<_TestContentView> createState() => _TestContentViewState();
}

class _TestContentViewState extends State<_TestContentView> {
  String assetContent = '';

  @override
  Widget build(BuildContext context) {
    if (assetContent.isEmpty) {
      return InkWell(
        child: const Text('Load Content...'),
        onTap: () async {
          final assetProvider = AssetProvider(
              assetBundle: DefaultAssetBundle.of(context),
              name: 'assets/content/example.json');
          final content = await assetProvider.loadContent();
          setState(() {
            assetContent = content;
          });
        },
      );
    } else {
      return Text(assetContent);
    }
  }
}

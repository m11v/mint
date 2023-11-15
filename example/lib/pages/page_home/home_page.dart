import 'package:example_mint/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mintminter_mint/mint.dart';
import 'package:mintminter_mint/upgrader/views/upgrade_tile.dart';
import 'package:mintminter_mint/views/icon_text_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mintminter_mint Example'),
      ),
      body: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AppAttributesRepository>(
            create: (context) => AppAttributesRepository(),
          ),
        ],
        child: const HomePageContentView(),
      ),
    );
  }
}

class HomePageContentView extends StatelessWidget {
  const HomePageContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UpgradeBloc>(
          create: (context) => UpgradeBloc(
            appAttributesRepository: context.read<AppAttributesRepository>(),
          ),
        ),
      ],
      child: PageContent(
        child: ListView(
          children: <Widget>[
            const UpgradeTile(
              titleText: 'New version is available!',
              subtitleText: 'Click here to upgrade.',
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
            const MintButton(
              text: 'Disabled Button',
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: const IconTextView(
                icon: Icons.shuffle_on_rounded,
                text: 'Shuffle',
                iconSize: 20,
              ),
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
    return MintButton(
        text: 'Value: $value',
        onPressed: () {
          final newValue = value + 1;
          HiveBoxProvider.getInstance(boxName: appBoxName)
              .put('test_hive', newValue);
          setState(() {
            value = newValue;
          });
        });
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

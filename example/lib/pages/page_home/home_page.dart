import 'dart:math';

import 'package:example_mint/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mintminter_mint/han/mint_han_popup_menu_button.dart';
import 'package:mintminter_mint/mint.dart';
import 'package:mintminter_mint/views/mint_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppAttributesRepository>(
          create: (context) => AppAttributesRepository(
            keyValueStorageProvider:
                HiveBoxProvider.getInstance(boxName: appBoxName),
          ),
        ),
        RepositoryProvider<HideAdRepository>(
          create: (context) => HideAdRepository(
            keyValueStorageProvider:
                HiveBoxProvider.getInstance(boxName: appBoxName),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UpgradeBloc>(
            create: (context) => UpgradeBloc(
              appAttributesRepository: context.read<AppAttributesRepository>(),
              enableCheck: true,
            )..add(const UpgradeEventChecked(
                versionCode: 9,
                pageUrl:
                    'https://mintminterdev.blogspot.com/p/mint-example.html',
              )),
          ),
          BlocProvider<HanBloc>(
            create: (context) => HanBloc(
              keyValueStorageProvider:
                  HiveBoxProvider.getInstance(boxName: appBoxName),
            ),
          ),
          BlocProvider<HideAdCubit>(
            create: (context) => HideAdCubit(
              hideAdRepository: context.read<HideAdRepository>(),
            ),
          ),
          BlocProvider<CounterCubit>(
            create: (context) => CounterCubit(),
          ),
        ],
        child: const _HomePageView(),
      ),
    );
  }
}

class _HomePageView extends StatelessWidget {
  const _HomePageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mintminter_mint Example'),
        actions: const [
          MintHanPopupMenuButton(),
        ],
      ),
      body: const _HomePageContentView(),
    );
  }
}

class _HomePageContentView extends StatelessWidget {
  const _HomePageContentView();

  @override
  Widget build(BuildContext context) {
    return PageContent(
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
            color: context.primaryContainerColor,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: const IconTextView(
              icon: Icon(Icons.handshake_outlined),
              text: Text('Example of IconTextView'),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          MintFlatCard(
            backgroundColor: context.secondaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const HanView(type: HanType.unknown),
                const HanView(type: HanType.simplified),
                const HanView(type: HanType.traditional),
                InkWell(
                  child: const MintHanView(),
                  onTap: () {
                    int index = Random().nextInt(3);
                    context
                        .read<HanBloc>()
                        .add(HanEventChanged(hanType: HanType.values[index]));
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            child: const Text('Show dialog'),
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => MintAlertDialog(
                  titleText: 'Confirmation',
                  contentText: 'Some content',
                  onYesButtonTapped: () {
                    Navigator.of(ctx).pop();
                  },
                  onNoButtonTapped: () {
                    Navigator.of(ctx).pop();
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const _TestHideAdView(),
          const SizedBox(
            height: 20,
          ),
          const _TestCounterView(),
          const SizedBox(
            height: 20,
          ),
          const _TestMintListTileView(),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class _TestAboutView extends StatelessWidget {
  const _TestAboutView();

  @override
  Widget build(BuildContext context) {
    return AboutView(
      logoAssetName: 'assets/images/mintminter.png',
      appName: 'Example App',
      version: 'version',
      onAppNameTapped: () {
        debugPrint('onAppNameTapped');
      },
      onLogoTapped: () {
        debugPrint('onLogoTapped');
      },
      onVersionTapped: () {
        debugPrint('onVersionTapped');
      },
      child: const Column(
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
                color: context.secondaryColor,
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

class _TestHideAdView extends StatelessWidget {
  const _TestHideAdView();

  @override
  Widget build(BuildContext context) {
    return MintFlatCard(
        backgroundColor: context.primaryContainerColor,
        child: BlocBuilder<HideAdCubit, bool>(builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!state) ...[
                Text(
                  'Mock Ad View',
                  style: TextStyle(
                    color: context.onPrimaryContainerColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
              MintButton(
                text: 'Hide Ad',
                onPressed: () {
                  context.read<HideAdCubit>().hideAd();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              MintButton(
                text: 'Reset',
                onPressed: () {
                  context.read<HideAdCubit>().reset();
                },
              ),
            ],
          );
        }));
  }
}

class _TestCounterView extends StatelessWidget {
  const _TestCounterView();

  @override
  Widget build(BuildContext context) {
    return MintFlatCard(
      backgroundColor: context.secondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<CounterCubit, int>(builder: (context, state) {
            return Text(
              'Count $state',
              style: const TextStyle(
                color: Colors.white,
              ),
            );
          }),
          const SizedBox(
            height: 10,
          ),
          MintButton(
            text: 'Increment',
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          MintButton(
            text: 'Decrement',
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          MintButton(
            text: 'Reset',
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
          ),
        ],
      ),
    );
  }
}

class _TestMintListTileView extends StatelessWidget {
  const _TestMintListTileView();

  @override
  Widget build(BuildContext context) {
    return MintListTile(
      leadingIconData: Icons.sunny,
      title: 'Title ' * 50,
      description: 'Description ' * 50,
      tailingIconData: Icons.chevron_right,
      onTap: () {
        debugPrint('onTap: MintListTile --> ${context.screenWidth}');
      },
    );
  }
}

import 'package:example_mint/ad/example_ad_provider.dart';
import 'package:flutter/material.dart';
import 'package:mintminter_mint/mint.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mint Example'),
      ),
      body: PageContent(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Example of mint package',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            AdBanner(
              padding: const EdgeInsets.symmetric(vertical: 50),
              type:
                  const ExampleTopBannerAndroid(unitId: AdIdProvider.mockAdId),
              adIdProvider: ExampleAdProvider.getInstance(),
            ),
            Text(
              'text1',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}

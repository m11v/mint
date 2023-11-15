import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/utils.dart';
import '../upgrader.dart';

class UpgradeTile extends StatelessWidget {
  const UpgradeTile({
    super.key,
    required this.titleText,
    required this.subtitleText,
  });

  final String titleText;
  final String subtitleText;

  @override
  Widget build(BuildContext context) {
    context.read<UpgradeBloc>().add(const UpgradeEventChecked(
          versionCode: 1,
          pageUrl:
              'https://mintminterdev.blogspot.com/p/easy-us-citizenship-test.html',
          market: AppMarket.playStore,
        ));
    return BlocBuilder<UpgradeBloc, UpgradeState>(
      builder: (context, state) {
        if (state.needUpgrade) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: ListTile(
              tileColor: Theme.of(context).colorScheme.primaryContainer,
              leading: Icon(
                Icons.notifications_active,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                titleText,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              subtitle: Text(
                subtitleText,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              trailing: Icon(
                Icons.upgrade,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              onTap: () {
                launchInBrowser(state.url!);
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

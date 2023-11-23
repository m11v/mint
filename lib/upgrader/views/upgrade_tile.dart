import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mintminter_mint/extensions/context_extension.dart';

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
    return BlocBuilder<UpgradeBloc, UpgradeState>(
      builder: (context, state) {
        if (state.needUpgrade) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: ListTile(
              tileColor: context.primaryContainerColor,
              leading: Icon(
                Icons.notifications_active,
                color: context.primaryColor,
              ),
              title: Text(
                titleText,
                style: TextStyle(
                    color: context.onPrimaryContainerColor),
              ),
              subtitle: Text(
                subtitleText,
                style: TextStyle(
                    color: context.onPrimaryContainerColor),
              ),
              trailing: Icon(
                Icons.upgrade,
                color: context.onPrimaryContainerColor,
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

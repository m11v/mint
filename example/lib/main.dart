import 'package:example_mint/app.dart';
import 'package:flutter/material.dart';
import 'package:mintminter_mint/key_value_storage/hive_box_provider.dart';

const appBoxName = 'example_mintminter_app';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveBoxProvider.createAndInit(boxName: appBoxName);

  runApp(const App());
}

import 'package:example_mint/pages/page_home/home_page.dart';
import 'package:flutter/material.dart';

const MaterialColor themeColor = Colors.green;

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example App for Mint',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
        appBarTheme: AppBarTheme(
            backgroundColor: themeColor.shade900,
            foregroundColor: Colors.white,
            titleTextStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

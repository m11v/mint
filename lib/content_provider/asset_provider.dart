import 'package:flutter/services.dart';

import 'content_provider.dart';

class AssetProvider extends ContentProvider {
  const AssetProvider({
    required this.assetBundle,
    required this.name,
  });

  final AssetBundle assetBundle;
  final String name;

  @override
  Future<String> loadContent() async {
    return await assetBundle.loadString(name);
  }
}

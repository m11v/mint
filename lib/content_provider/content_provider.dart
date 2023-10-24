export 'asset_provider.dart';

abstract class ContentProvider {
  const ContentProvider();

  Future<String> loadContent();
}

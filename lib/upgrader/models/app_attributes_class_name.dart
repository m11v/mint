enum AppAttributesClassName {
  versionName(prefix: 'mintminter_version_name_'),
  versionCode(prefix: 'mintminter_version_code_'),
  url(prefix: 'mintminter_url_');

  const AppAttributesClassName({required this.prefix});
  final String prefix;
}

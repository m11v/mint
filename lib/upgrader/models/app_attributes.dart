import 'package:equatable/equatable.dart';

class AppAttributes extends Equatable {
  const AppAttributes({
    required this.versionName,
    required this.versionCode,
    required this.url,
  });

  final String versionName;
  final int versionCode;
  final String url;

  static const empty = AppAttributes(
    versionName: '',
    url: '',
    versionCode: -1,
  );

  @override
  List<Object?> get props => [
        versionName,
        versionCode,
        url,
      ];
}

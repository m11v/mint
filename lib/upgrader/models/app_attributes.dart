import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_attributes.g.dart';

@JsonSerializable()
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

  factory AppAttributes.fromJson(Map<String, dynamic> json) =>
      _$AppAttributesFromJson(json);

  factory AppAttributes.fromJsonString(String jsonString) =>
      AppAttributes.fromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$AppAttributesToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }

  @override
  List<Object?> get props => [
        versionName,
        versionCode,
        url,
      ];
}

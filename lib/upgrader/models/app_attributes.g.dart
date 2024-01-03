// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppAttributes _$AppAttributesFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AppAttributes',
      json,
      ($checkedConvert) {
        final val = AppAttributes(
          versionName: $checkedConvert('versionName', (v) => v as String),
          versionCode: $checkedConvert('versionCode', (v) => v as int),
          url: $checkedConvert('url', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$AppAttributesToJson(AppAttributes instance) =>
    <String, dynamic>{
      'versionName': instance.versionName,
      'versionCode': instance.versionCode,
      'url': instance.url,
    };

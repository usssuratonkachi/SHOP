// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_key_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiAccessKey _$ApiAccessKeyFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiAccessKey',
      json,
      ($checkedConvert) {
        final val = ApiAccessKey(
          accessKey: $checkedConvert('accessKey', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiAccessKeyToJson(ApiAccessKey instance) =>
    <String, dynamic>{
      'accessKey': instance.accessKey,
    };

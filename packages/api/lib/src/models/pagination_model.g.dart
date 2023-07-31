// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPaginationModel _$ApiPaginationModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiPaginationModel',
      json,
      ($checkedConvert) {
        final val = ApiPaginationModel(
          page: $checkedConvert('page', (v) => v as int?),
          pages: $checkedConvert('pages', (v) => v as int?),
          total: $checkedConvert('total', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiPaginationModelToJson(ApiPaginationModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pages': instance.pages,
      'total': instance.total,
    };

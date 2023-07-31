// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiListItemsModel _$ApiListItemsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiListItemsModel',
      json,
      ($checkedConvert) {
        final val = ApiListItemsModel(
          pagination: $checkedConvert(
              'pagination', (v) => ApiPaginationModel.fromJson(v)),
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) => ApiItem.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiListItemsModelToJson(ApiListItemsModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'pagination': instance.pagination,
    };

ApiListItemsModelWithoutPagination _$ApiListItemsModelWithoutPaginationFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiListItemsModelWithoutPagination',
      json,
      ($checkedConvert) {
        final val = ApiListItemsModelWithoutPagination(
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) => ApiItem.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiListItemsModelWithoutPaginationToJson(
        ApiListItemsModelWithoutPagination instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

ApiItem _$ApiItemFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ApiItem',
      json,
      ($checkedConvert) {
        final val = ApiItem(
          id: $checkedConvert('id', (v) => v as int),
          title: $checkedConvert('title', (v) => v as String),
          slug: $checkedConvert('slug', (v) => v as String),
          image: $checkedConvert('image',
              (v) => ApiImageModel.fromJson(v as Map<String, dynamic>)),
          price: $checkedConvert('price', (v) => (v as num).toDouble()),
          colors: $checkedConvert(
              'colors',
              (v) => (v as List<dynamic>)
                  .map(
                      (e) => ApiColorsModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiItemToJson(ApiItem instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'image': instance.image,
      'price': instance.price,
      'colors': instance.colors,
    };

ApiImageModel _$ApiImageModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiImageModel',
      json,
      ($checkedConvert) {
        final val = ApiImageModel(
          file: $checkedConvert(
              'file', (v) => ApiFileModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiImageModelToJson(ApiImageModel instance) =>
    <String, dynamic>{
      'file': instance.file,
    };

ApiFileModel _$ApiFileModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiFileModel',
      json,
      ($checkedConvert) {
        final val = ApiFileModel(
          url: $checkedConvert('url', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          originalName: $checkedConvert('originalName', (v) => v as String),
          extension: $checkedConvert('extension', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiFileModelToJson(ApiFileModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'originalName': instance.originalName,
      'extension': instance.extension,
    };

ApiColorsModel _$ApiColorsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiColorsModel',
      json,
      ($checkedConvert) {
        final val = ApiColorsModel(
          id: $checkedConvert('id', (v) => v as int),
          title: $checkedConvert('title', (v) => v as String),
          code: $checkedConvert('code', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiColorsModelToJson(ApiColorsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'code': instance.code,
    };

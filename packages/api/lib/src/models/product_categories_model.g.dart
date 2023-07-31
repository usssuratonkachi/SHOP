// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiListProductCategoriesModel _$ApiListProductCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiListProductCategoriesModel',
      json,
      ($checkedConvert) {
        final val = ApiListProductCategoriesModel(
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) => ApiProductCategoriesModel.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiListProductCategoriesModelToJson(
        ApiListProductCategoriesModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

ApiProductCategoriesModel _$ApiProductCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiProductCategoriesModel',
      json,
      ($checkedConvert) {
        final val = ApiProductCategoriesModel(
          id: $checkedConvert('id', (v) => v as int?),
          title: $checkedConvert('title', (v) => v as String?),
          slug: $checkedConvert('slug', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiProductCategoriesModelToJson(
        ApiProductCategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
    };

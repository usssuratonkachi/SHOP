// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiBasketModel _$ApiBasketModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiBasketModel',
      json,
      ($checkedConvert) {
        final val = ApiBasketModel(
          id: $checkedConvert('id', (v) => v as int),
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      ApiBasketItemModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          user: $checkedConvert(
              'user', (v) => ApiUserModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiBasketModelToJson(ApiBasketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items,
      'user': instance.user,
    };

ApiUserModel _$ApiUserModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiUserModel',
      json,
      ($checkedConvert) {
        final val = ApiUserModel(
          id: $checkedConvert('id', (v) => v as int?),
          accessKey: $checkedConvert('accessKey', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiUserModelToJson(ApiUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accessKey': instance.accessKey,
    };

ApiBasketItemModel _$ApiBasketItemModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiBasketItemModel',
      json,
      ($checkedConvert) {
        final val = ApiBasketItemModel(
          product: $checkedConvert(
              'product',
              (v) => v == null
                  ? null
                  : ApiItem.fromJson(v as Map<String, dynamic>)),
          id: $checkedConvert('id', (v) => v as int?),
          price: $checkedConvert('price', (v) => (v as num?)?.toDouble()),
          quantity: $checkedConvert('quantity', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiBasketItemModelToJson(ApiBasketItemModel instance) =>
    <String, dynamic>{
      'product': instance.product,
      'id': instance.id,
      'price': instance.price,
      'quantity': instance.quantity,
    };

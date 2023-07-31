// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiOrderResponseModel _$ApiOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiOrderResponseModel',
      json,
      ($checkedConvert) {
        final val = ApiOrderResponseModel(
          id: $checkedConvert('id', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
          address: $checkedConvert('address', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          basket: $checkedConvert(
              'basket',
              (v) => v == null
                  ? null
                  : ApiBasketModel.fromJson(v as Map<String, dynamic>)),
          totalPrice: $checkedConvert('totalPrice', (v) => v as int?),
          comment: $checkedConvert('comment', (v) => v as String?),
          status: $checkedConvert(
              'status',
              (v) => v == null
                  ? null
                  : ApiStatusModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiOrderResponseModelToJson(
        ApiOrderResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'basket': instance.basket,
      'totalPrice': instance.totalPrice,
      'comment': instance.comment,
      'status': instance.status,
    };

ApiOrderResponseErrorModel _$ApiOrderResponseErrorModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiOrderResponseErrorModel',
      json,
      ($checkedConvert) {
        final val = ApiOrderResponseErrorModel(
          error: $checkedConvert(
              'error',
              (v) => v == null
                  ? null
                  : ApiOrderErrorModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiOrderResponseErrorModelToJson(
        ApiOrderResponseErrorModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

ApiOrderErrorModel _$ApiOrderErrorModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiOrderErrorModel',
      json,
      ($checkedConvert) {
        final val = ApiOrderErrorModel(
          message: $checkedConvert('message', (v) => v as String?),
          code: $checkedConvert('code', (v) => v as int?),
          request: $checkedConvert(
              'request',
              (v) => v == null
                  ? null
                  : ApiOrderRequestModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiOrderErrorModelToJson(ApiOrderErrorModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'request': instance.request,
    };

ApiOrderRequestModel _$ApiOrderRequestModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiOrderRequestModel',
      json,
      ($checkedConvert) {
        final val = ApiOrderRequestModel(
          name: $checkedConvert('name', (v) => v as String?),
          address: $checkedConvert('address', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiOrderRequestModelToJson(
        ApiOrderRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
    };

ApiStatusModel _$ApiStatusModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ApiStatusModel',
      json,
      ($checkedConvert) {
        final val = ApiStatusModel(
          id: $checkedConvert('id', (v) => v as int?),
          title: $checkedConvert('title', (v) => v as String?),
          code: $checkedConvert('code', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApiStatusModelToJson(ApiStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'code': instance.code,
    };

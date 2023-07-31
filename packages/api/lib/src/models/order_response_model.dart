import 'package:json_annotation/json_annotation.dart';

import 'basket_model.dart';

part 'order_response_model.g.dart';

@JsonSerializable()
class ApiOrderResponseModel {
  const ApiOrderResponseModel({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.email,
    this.basket,
    this.totalPrice,
    this.comment,
    this.status,
  });

  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final ApiBasketModel? basket;
  @JsonKey(name: 'totalPrice')
  final int? totalPrice;
  final String? comment;
  final ApiStatusModel? status;

  factory ApiOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApiOrderResponseModelFromJson(json);
}

@JsonSerializable()
class ApiOrderResponseErrorModel {
  const ApiOrderResponseErrorModel({required this.error});

  final ApiOrderErrorModel? error;

  factory ApiOrderResponseErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiOrderResponseErrorModelFromJson(json);
}

@JsonSerializable()
class ApiOrderErrorModel {
  const ApiOrderErrorModel(
      {required this.message, required this.code, required this.request});

  final String? message;
  final int? code;
  final ApiOrderRequestModel? request;

  factory ApiOrderErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiOrderErrorModelFromJson(json);
}

@JsonSerializable()
class ApiOrderRequestModel {
  const ApiOrderRequestModel(
      {required this.name,
      required this.address,
      required this.phone,
      required this.email});

  final String? name;
  final String? address;
  final String? phone;
  final String? email;

  factory ApiOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ApiOrderRequestModelFromJson(json);
}

@JsonSerializable()
class ApiStatusModel {
  const ApiStatusModel(
      {required this.id, required this.title, required this.code});

  final int? id;
  final String? title;
  final String? code;

  factory ApiStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ApiStatusModelFromJson(json);
}

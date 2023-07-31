import 'package:json_annotation/json_annotation.dart';
import 'package:api/src/models/item.dart';
part 'basket_model.g.dart';


@JsonSerializable()
class ApiBasketModel {
  const ApiBasketModel(
      {required this.id, required this.items, required this.user});

  final int id;
  final List<ApiBasketItemModel> items;
  final ApiUserModel user;

  factory ApiBasketModel.fromJson(Map<String, dynamic> json) =>
      _$ApiBasketModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiBasketModelToJson(this);
}

@JsonSerializable()
class ApiUserModel {
  const ApiUserModel({this.id, this.accessKey});

  final int? id;
  @JsonKey(name: 'accessKey')
  final String? accessKey;

  factory ApiUserModel.fromJson(Map<String, dynamic> json) =>
      _$ApiUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiUserModelToJson(this);
}

@JsonSerializable()
class ApiBasketItemModel {
  const ApiBasketItemModel(
      {required this.product,
      required this.id,
      required this.price,
      required this.quantity});


  final ApiItem? product;
  final int? id;
  final double? price;
  final int? quantity;


  factory ApiBasketItemModel.fromJson(Map<String, dynamic> json) => _$ApiBasketItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiBasketItemModelToJson(this);
}

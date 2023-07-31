import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:repository/src/models/item.dart';

@JsonSerializable()
class BasketModel extends Equatable {
  const BasketModel(
      {required this.id, required this.items, required this.user});

  final int id;
  final List<BasketItemModel> items;
  final UserModel? user;

  @override
  List<Object?> get props => [id, items, user];
}

@JsonSerializable()
class UserModel extends Equatable {
  const UserModel({required this.id, required this.accessKey});

  final int id;
  final String accessKey;

  @override
  List<Object> get props => [id, accessKey];
}

@JsonSerializable()
class BasketItemModel extends Equatable {
  const BasketItemModel(
      {required this.item,
      required this.price,
      required this.id,
      required this.quantity});

  final Item? item;
  final double? price;
  final int? id;
  final int? quantity;

  @override
  List<Object?> get props => [item, price, id, quantity];
}

import 'package:equatable/equatable.dart';

import 'basket_model.dart';

class OrderResponseModel extends Equatable {
  const OrderResponseModel({
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
  final BasketModel? basket;
  final int? totalPrice;
  final String? comment;
  final StatusModel? status;

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        phone,
        email,
        basket,
        totalPrice,
        comment,
        status,
      ];
}

class OrderResponseErrorModel extends Equatable {
  const OrderResponseErrorModel({required this.error});

  final OrderErrorModel? error;

  @override
  List<Object?> get props => [error];
}

class OrderErrorModel extends Equatable {
  const OrderErrorModel(
      {required this.message, required this.code, required this.request});

  final String? message;
  final int? code;
  final OrderRequestModel? request;

  @override
  List<Object?> get props => [message, code, request];
}

class OrderRequestModel extends Equatable {
  const OrderRequestModel(
      {required this.name,
      required this.address,
      required this.phone,
      required this.email});

  final String? name;
  final String? address;
  final String? phone;
  final String? email;

  @override
  List<Object?> get props => [name, address, phone, email];
}

class StatusModel extends Equatable {
  const StatusModel(
      {required this.id, required this.title, required this.code});

  final int? id;
  final String? title;
  final String? code;

  @override
  List<Object?> get props => [id, title, code];
}

part of 'order_cubit.dart';

enum OrderStatus { initial, loading, success, failure }

extension ItemCardStatusX on OrderStatus {
  bool get isInitial => this == OrderStatus.initial;

  bool get isLoading => this == OrderStatus.loading;

  bool get isSuccess => this == OrderStatus.success;

  bool get isFailure => this == OrderStatus.failure;
}

class OrderState extends Equatable {
  const OrderState({
    this.status = OrderStatus.initial,
    this.order,
    this.errorOrder,
    this.orderId,
  });

  final OrderStatus status;
  final OrderResponseModel? order;
  final OrderResponseErrorModel? errorOrder;
  final int? orderId;

  OrderState copyWith({
    OrderStatus? status,
    OrderResponseModel? order,
    OrderResponseErrorModel? errorOrder,
    int? orderId,
  }) {
    return OrderState(
      status: status ?? this.status,
      order: order ?? this.order,
      errorOrder: errorOrder ?? this.errorOrder,
      orderId: orderId ?? this.orderId
    );
  }

  @override
  List<Object?> get props => [status, order, errorOrder, orderId];
}

class GetInfoErrorState extends OrderState {
  const GetInfoErrorState();
}

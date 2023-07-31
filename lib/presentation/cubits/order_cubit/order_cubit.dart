import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repository/repository.dart';

import '../../../constants.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._orderRepository) : super(const OrderState());

  final OrderRepository _orderRepository;

  Future<void> createOrder(
      {required name,
      required address,
      required phone,
      required email,
      required comment}) async {
    emit(state.copyWith(status: OrderStatus.loading));

    final order = await _orderRepository.createOrder(
        name: name,
        address: address,
        phone: phone,
        email: email,
        comment: comment);

    if (order.runtimeType == OrderResponseModel) {
      emit(state.copyWith(
          status: OrderStatus.success, order: order as OrderResponseModel, orderId: order.id));
      ordersIdList.add(order.id);

    } else {
      emit(state.copyWith(
          status: OrderStatus.failure,
          errorOrder: order as OrderResponseErrorModel));
    }
  }

  Future<void> fetchOrderInfo({required orderId}) async {
    try {
      final orderInfo = await _orderRepository.getOrderInfo(orderId: orderId);
      emit(state.copyWith(status: OrderStatus.success, order: orderInfo));
    } on Exception {
      emit(const GetInfoErrorState());
    }
  }
}

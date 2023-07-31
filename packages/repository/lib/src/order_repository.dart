import 'package:api/api.dart';
import 'package:shop/data/access_key_storage/access_key_storage.dart';
import 'package:shop/data/mappers/order_mapper.dart';

import 'models/order_model.dart';

class OrderRepository {
  OrderRepository(
      {required this.accessKeyStorage,
      required this.orderResponseMapper,
      required this.orderResponseErrorMapper,
      OrderApiClient? orderApiClient})
      : _orderApiClient = orderApiClient ?? OrderApiClient();

  final AccessKeyStorage accessKeyStorage;
  final OrderApiClient _orderApiClient;
  final OrderResponseMapper orderResponseMapper;
  final OrderResponseErrorMapper orderResponseErrorMapper;

  Future<Object> createOrder(
      {required name,
      required address,
      required phone,
      required email,
      required comment}) async {
    final orderResponse = await _orderApiClient.createOrder(
        userAccessKey: accessKeyStorage.getAccessKey(),
        name: name,
        address: address,
        phone: phone,
        email: email,
        comment: comment);

    if (orderResponse.runtimeType == ApiOrderResponseErrorModel) {
      return orderResponseErrorMapper
          .map(orderResponse as ApiOrderResponseErrorModel?);
    }

    return orderResponseMapper.map(orderResponse as ApiOrderResponseModel?);
  }

  Future<OrderResponseModel> getOrderInfo({required orderId}) async {
    final orderInfo = await _orderApiClient.getOrderInfo(
        userAccessKey: accessKeyStorage.getAccessKey(), orderId: orderId);

    return orderResponseMapper.map(orderInfo);
  }
}

import 'dart:convert';

import 'package:api/src/models/order_response_model.dart';
import 'package:http/http.dart' as http;

class GetOrderIngoRequestFailure implements Exception {}

class OrderApiClient {
  OrderApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  static const _baseUrl = 'vue-study.skillbox.cc';

  Future<Object> createOrder(
      {required userAccessKey,
      required name,
      required address,
      required phone,
      required email,
      required comment}) async {
    final createOrderRequest =
        Uri.https(_baseUrl, '/api/orders', {'userAccessKey': userAccessKey});

    final createOrderResponse =
        await _httpClient.post(createOrderRequest, body: {
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'comment': comment
    });

    final createOrderResponseJson = json.decode(createOrderResponse.body);

    if (createOrderResponse.statusCode != 200) {
      return ApiOrderResponseErrorModel.fromJson(createOrderResponseJson);
    }
    return ApiOrderResponseModel.fromJson(createOrderResponseJson);
  }

  Future<ApiOrderResponseModel> getOrderInfo(
      {required userAccessKey, required orderId}) async {
    final orderInfoRequest = Uri.https(_baseUrl, '/api/orders/$orderId',
        {'userAccessKey': userAccessKey});

    final orderInfoResponse = await _httpClient.get(orderInfoRequest);

    if (orderInfoResponse.statusCode != 200) {
      throw GetOrderIngoRequestFailure();
    }

    final orderInfoJson = json.decode(orderInfoResponse.body);

    return ApiOrderResponseModel.fromJson(orderInfoJson);
  }
}

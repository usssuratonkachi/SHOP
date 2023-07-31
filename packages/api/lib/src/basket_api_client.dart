import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/basket_model.dart';

class GetBasketRequestFailure implements Exception {}

class PostRequestFailure implements Exception {}

class DeleteRequestFailure implements Exception {}

class BasketApiClient {
  BasketApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseUrl = 'vue-study.skillbox.cc';

  Future<ApiBasketModel> getBasket(String? userAccessKey) async {
    final basketRequest =
        Uri.https(_baseUrl, '/api/baskets/', {'userAccessKey': userAccessKey});

    final basketResponse = await _httpClient.get(basketRequest);

    if (basketResponse.statusCode != 200) {
      throw GetBasketRequestFailure();
    }

    final basketJson = json.decode(basketResponse.body);

    return ApiBasketModel.fromJson(basketJson);
  }

  Future<void> postToBasket(
      {required userAccessKey, required productId}) async {
    final postRequest = Uri.https(
        _baseUrl, '/api/baskets/products', {'userAccessKey': userAccessKey});

    final postResponse = await _httpClient
        .post(postRequest, body: {'productId': '$productId', 'quantity': '1'});
    print('пост по такому ключу: $userAccessKey');

    if (postResponse.statusCode != 200) {
      throw PostRequestFailure();
    }
  }

  Future<void> changeQuantity(
      {required userAccessKey, required productId, required quantity}) async {
    final putQuantityRequest = Uri.https(
        _baseUrl, '/api/baskets/products', {'userAccessKey': userAccessKey});

    final puQuantityResponse = await _httpClient.put(putQuantityRequest,
        body: {'productId': '$productId', 'quantity': '$quantity'});

    if (puQuantityResponse.statusCode != 200) {
      throw PostRequestFailure();
    }
  }

  Future<void> deleteProductFromBasket(
      {required userAccessKey, required productId}) async {
    final deleteRequest = Uri.https(
        _baseUrl, '/api/baskets/products', {'userAccessKey': userAccessKey});

    final deleteResponse =
        await _httpClient.delete(deleteRequest, body: {'productId': '$productId'});

    if (deleteResponse.statusCode != 200) {
      throw DeleteRequestFailure();
    }
  }
}

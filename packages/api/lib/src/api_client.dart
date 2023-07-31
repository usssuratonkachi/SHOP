import 'dart:async';
import 'dart:convert';

import 'package:api/api.dart';
import 'package:http/http.dart' as http;

class GetItemsRequestFailure implements Exception {}

class ApiClient {
  ApiClient({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseUrl = 'vue-study.skillbox.cc';

  Future<ApiListItemsModel> getListItems({required offset}) async {
    const paginationLimit = 10;
    final listItemsRequest = Uri.https(_baseUrl, '/api/products',
        {'page': '$offset', 'limit': '$paginationLimit'});

    final listItemResponse = await _httpClient.get(listItemsRequest);

    if (listItemResponse.statusCode != 200) {
      throw GetItemsRequestFailure();
    }

    final listItemsJson = json.decode(listItemResponse.body);

    return ApiListItemsModel .fromJson(listItemsJson);
  }
}

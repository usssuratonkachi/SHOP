import 'dart:convert';

import 'package:api/api.dart';
import 'package:http/http.dart' as http;

class GetSortItemsRequestFailure implements Exception {}

class SortItemsApiClient {
  SortItemsApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseUrl = 'vue-study.skillbox.cc';

  Future<ApiListItemsModelWithoutPagination> getListSortItems({required categoryId}) async {
    final listSortItemsRequest =
        Uri.https(_baseUrl, '/api/products', {'categoryId': '$categoryId'});

    final listSortItemsResponse = await _httpClient.get(listSortItemsRequest);

    if (listSortItemsResponse.statusCode != 200) {
      throw GetSortItemsRequestFailure();
    }

    final listSortItemsJson = json.decode(listSortItemsResponse.body);

    return ApiListItemsModelWithoutPagination.fromJson(listSortItemsJson);
  }
}

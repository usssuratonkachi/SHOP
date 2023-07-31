import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api.dart';

class GetItemCardRequestFailure implements Exception {}

class ItemCardApiClient {
  ItemCardApiClient({http.Client? httpClient,}) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseUrl = 'vue-study.skillbox.cc';

  Future<ApiItem> getItemCard({required id}) async{
     final itemCardRequest = Uri.https(_baseUrl, 'api/products/$id');

     final itemCardResponse = await _httpClient.get(itemCardRequest);

     if(itemCardResponse.statusCode != 200 ){
       throw GetItemCardRequestFailure();
     }

     final itemCardJson = json.decode(itemCardResponse.body);

     return ApiItem.fromJson(itemCardJson);
  }
}
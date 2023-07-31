import 'dart:convert';

import 'package:api/src/models/product_categories_model.dart';
import 'package:http/http.dart' as http;

class GetProductCategoriesRequestFailure implements Exception {}


class ProductCategoriesApiClient {
  ProductCategoriesApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseUrl = 'vue-study.skillbox.cc';

  Future<ApiListProductCategoriesModel> getListItems() async{

    final listProductRequest = Uri.https(_baseUrl, 'api/productCategories');

    final listProductResponse = await _httpClient.get(listProductRequest);

    if(listProductResponse.statusCode != 200){
      throw GetProductCategoriesRequestFailure();
    }

    final listProductJson = json.decode(listProductResponse.body);

    return ApiListProductCategoriesModel.fromJson(listProductJson);
  }
}
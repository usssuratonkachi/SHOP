import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/access_key_model.dart';

class GetUserAccessKeyRequestFailure implements Exception {}

class AccessKeyApiClient {
  AccessKeyApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseUrl = 'vue-study.skillbox.cc';

  Future<String> getUserAccessKey() async {
    final userAccessKeyRequest = Uri.https(_baseUrl, '/api/users/accessKey');

    final userAccessKeyResponse = await _httpClient.get(userAccessKeyRequest);

    if (userAccessKeyResponse.statusCode != 200) {
      throw GetUserAccessKeyRequestFailure();
    }

    final userAccessKeyJson = json.decode(userAccessKeyResponse.body);
    print('кей из api: ${ApiAccessKey.fromJson(userAccessKeyJson).accessKey}');
    return ApiAccessKey.fromJson(userAccessKeyJson).accessKey;
  }
}

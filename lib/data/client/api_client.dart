import 'dart:convert';

import 'package:dog_app/data/client/api_result.dart';
import 'package:dog_app/data/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class ApiClient {
  Future<ApiResult> get({
    required String path,
    Map<String, dynamic>? queryParameters = const {},
  });
}

class LiveApiClient extends ApiClient {
  final http.Client _client;
  final String _baseUrl;
  final String _serverVersion;
  final String _apiKey;

  LiveApiClient({
    required http.Client client,
    required String baseUrl,
    required String serverVersion,
    required String apiKey,
  })  : _client = client,
        _baseUrl = baseUrl,
        _serverVersion = serverVersion,
        _apiKey = apiKey;

  @override
  Future<ApiResult> get({
    required String path,
    Map<String, dynamic>? queryParameters = const {},
  }) async {
    final response = await _client.get(
      Uri.https(
        _baseUrl,
        '/$_serverVersion/$path',
        queryParameters,
      ),
      headers: {'x-api-key': _apiKey},
    );

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);

      return ApiResult.fromList(decodedResponse);
    } else {
      throw ServerException();
    }
  }
}

import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class ApiClient {
  Future<http.Response> get({
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
  Future<http.Response> get({
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
      return response;
    } else {
      throw ServerException();
    }
  }
}

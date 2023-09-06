import 'package:dog_app/data/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class ApiRequester {
  Future<http.Response> get({
    required String path,
    Map<String, String>? queryParameters = const {},
  });
}

class HttpApiRequester extends ApiRequester {
  final http.Client _client;
  final String _baseUrl;
  final String _serverVersion;
  final String _apiKey;

  HttpApiRequester({
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
    Map<String, String>? queryParameters = const {},
  }) async {
    try {
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
    } catch (e) {
      throw ServerException();
    }
  }
}

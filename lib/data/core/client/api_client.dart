import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final _url = 'api.thedogapi.com';
  final _version = 'v1';
  final _apiKey = 'a1fc2a7a-894c-46c9-bfaf-1cc221241eba';

  final http.Client _client;

  ApiClient({required http.Client client}) : _client = client;

  Future<http.Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _client.get(
      Uri.https(_url, '/$_version/$path'),
      headers: {'x-api-key': _apiKey},
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw ServerException();
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:dog_app/data/models/breed_data_model.dart';

import 'package:dog_app/server_config.dart';

class BreedDataSource {
  final http.Client _client;

  BreedDataSource({required http.Client client}) : _client = client;

  Future<List<BreedDataModel>> getBreeds() async {
    final response = await _client.get(
      Uri.https(url, '/$version/breeds'),
      headers: {'x-api-key': apiKey},
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      return body
          .map<BreedDataModel>((breed) => BreedDataModel.fromJson(breed))
          .toList();
    } else {
      throw ServerException();
    }
  }
}

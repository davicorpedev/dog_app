import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:dog_app/data/models/dog_model.dart';

import 'package:dog_app/server_config.dart';

class DogDataSource {
  final http.Client _client;

  DogDataSource({required http.Client client}) : _client = client;

  Future<List<DogModel>> getDogsByBreed(int breedID) async {
    final response = await _client.get(
      Uri.https(
        url,
        '/$version/images/search?limit=30&breed_id=$breedID',
      ),
      headers: {'x-api-key': apiKey},
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      return body.map<DogModel>((dog) => DogModel.fromJson(dog)).toList();
    } else {
      throw ServerException();
    }
  }

  Future<DogModel> getRandomDog() async {
    final response = await _client.get(
      Uri.https(
        url,
        '/$version/images/search',
      ),
      headers: {'x-api-key': apiKey},
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      return DogModel.fromJson(body.first);
    } else {
      throw ServerException();
    }
  }
}

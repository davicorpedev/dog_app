import 'dart:convert';

import 'package:dog_app/data/core/client/api_client.dart';

import 'package:dog_app/data/models/dog_model.dart';

class DogDataSource {
  final ApiClient _client;

  DogDataSource({required ApiClient client}) : _client = client;

  Future<List<DogModel>> getDogsByBreed(int breedId) async {
    final response = await _client.get(
      path: 'images/search',
      queryParameters: {
        'limit': '30',
        'breed_id': '$breedId',
      },
    );

    final body = json.decode(response.body);

    return body.map<DogModel>((dog) => DogModel.fromJson(dog)).toList();
  }

  Future<DogModel> getRandomDog() async {
    final response = await _client.get(path: 'images/search');

    final body = json.decode(response.body);

    return DogModel.fromJson(body.first);
  }
}

import 'dart:convert';

import 'package:dog_app/data/core/client/api_client.dart';
import 'package:dog_app/data/models/dog_model.dart';

abstract class DogDataSource {
  Future<List<DogModel>> getDogsByBreed(int breedId);
  Future<DogModel> getRandomDog();
}

class DogDataSourceImpl extends DogDataSource {
  final ApiClient _client;

  DogDataSourceImpl({required ApiClient client}) : _client = client;

  @override
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

  @override
  Future<DogModel> getRandomDog() async {
    final response = await _client.get(path: 'images/search');

    final body = json.decode(response.body);

    return DogModel.fromJson(body.first);
  }
}

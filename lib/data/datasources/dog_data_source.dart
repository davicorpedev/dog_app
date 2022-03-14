import 'dart:convert';

import 'package:dog_app/data/core/client/api_client.dart';
import 'package:dog_app/data/models/dog_model.dart';
import 'package:dog_app/domain/core/entitites/breed.dart';
import 'package:dog_app/domain/core/entitites/id.dart';

abstract class DogDataSource {
  Future<List<DogModel>> getDogsByBreed(ID<Breed> id);
  Future<DogModel> getRandomDog();
}

class DogDataSourceImpl extends DogDataSource {
  final ApiClient _client;

  DogDataSourceImpl({required ApiClient client}) : _client = client;

  @override
  Future<List<DogModel>> getDogsByBreed(ID<Breed> id) async {
    final response = await _client.get(
      path: 'images/search',
      queryParameters: {
        'limit': '30',
        'breed_id': id.value,
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

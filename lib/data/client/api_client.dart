import 'dart:convert';

import 'package:dog_app/data/client/api_requester.dart';
import 'package:dog_app/data/error/exceptions.dart';
import 'package:dog_app/data/models/breed_info_model.dart';
import 'package:dog_app/data/models/dog_model.dart';
import 'package:dog_app/domain/entities/breed.dart';
import 'package:dog_app/domain/entities/id.dart';

abstract class ApiClient {
  Future<List<BreedInfoModel>> getBreeds();
  Future<List<DogModel>> getDogsByBreed(ID<Breed> id);
  Future<DogModel> getRandomDog();
}

class LiveApiClient extends ApiClient {
  final ApiRequester _apiRequester;

  LiveApiClient({
    required ApiRequester apiRequester,
  }) : _apiRequester = apiRequester;

  @override
  Future<List<BreedInfoModel>> getBreeds() async {
    final response = await _apiRequester.get(path: 'breeds');

    final decodedResponse = json.decode(response.body);

    return decodedResponse
        .map<BreedInfoModel>((breed) => BreedInfoModel.fromJson(breed))
        .toList();
  }

  @override
  Future<List<DogModel>> getDogsByBreed(ID<Breed> id) async {
    final response = await _apiRequester.get(
      path: 'images/search',
      queryParameters: {
        'limit': '30',
        'breed_id': id.value,
      },
    );

    final decodedResponse = json.decode(response.body);

    return decodedResponse
        .map<DogModel>((dog) => DogModel.fromJson(dog))
        .toList();
  }

  @override
  Future<DogModel> getRandomDog() async {
    final response = await _apiRequester.get(path: 'images/search');

    final decodedResponse = json.decode(response.body);

    if (decodedResponse.isEmpty) throw DogNotExistsException();

    return DogModel.fromJson(decodedResponse[0]);
  }
}

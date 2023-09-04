import 'dart:convert';

import 'package:dog_app/data/error/exceptions.dart';
import 'package:dog_app/data/models/breed_info_model.dart';
import 'package:dog_app/data/models/dog_model.dart';
import 'package:dog_app/domain/entities/breed.dart';
import 'package:dog_app/domain/entities/id.dart';
import 'package:http/http.dart' as http;

abstract class ApiClient {
  Future<List<BreedInfoModel>> getBreeds();
  Future<List<DogModel>> getDogsByBreed(ID<Breed> id);
  Future<DogModel> getRandomDog();
}

class HttpApiClient extends ApiClient {
  final http.Client _client;
  final String _baseUrl;
  final String _serverVersion;
  final String _apiKey;

  HttpApiClient({
    required http.Client client,
    required String baseUrl,
    required String serverVersion,
    required String apiKey,
  })  : _client = client,
        _baseUrl = baseUrl,
        _serverVersion = serverVersion,
        _apiKey = apiKey;

  // TODO: create a subclass to handle the logic

  @override
  Future<List<BreedInfoModel>> getBreeds() async {
    try {
      final response = await _client.get(
        Uri.https(
          _baseUrl,
          '/$_serverVersion/breeds',
        ),
        headers: {'x-api-key': _apiKey},
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);

        return decodedResponse
            .map<BreedInfoModel>((breed) => BreedInfoModel.fromJson(breed))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<DogModel>> getDogsByBreed(ID<Breed> id) async {
    try {
      final response = await _client.get(
        Uri.https(
          _baseUrl,
          '/$_serverVersion/images/search',
          {
            'limit': '30',
            'breed_id': id.value,
          },
        ),
        headers: {'x-api-key': _apiKey},
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);

        return decodedResponse
            .map<DogModel>((dog) => DogModel.fromJson(dog))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<DogModel> getRandomDog() async {
    try {
      final response = await _client.get(
        Uri.https(
          _baseUrl,
          '/$_serverVersion/images/search',
        ),
        headers: {'x-api-key': _apiKey},
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);

        return DogModel.fromJson(decodedResponse);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}

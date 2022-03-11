import 'dart:convert';

import 'package:dog_app/data/core/client/api_client.dart';

import 'package:dog_app/data/models/breed_info_model.dart';

class BreedDataSource {
  final ApiClient _client;

  BreedDataSource({required ApiClient client}) : _client = client;

  Future<List<BreedInfoModel>> getBreeds() async {
    final response = await _client.get(path: 'breeds');

    final body = json.decode(response.body);

    return body
        .map<BreedInfoModel>((breed) => BreedInfoModel.fromJson(breed))
        .toList();
  }
}

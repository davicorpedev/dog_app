import 'package:dog_app/data/client/api_client.dart';
import 'package:dog_app/data/error/exceptions.dart';
import 'package:dog_app/data/models/dog_model.dart';
import 'package:dog_app/domain/entities/breed.dart';
import 'package:dog_app/domain/entities/id.dart';

abstract class DogDataSource {
  Future<List<DogModel>> getDogsByBreed(ID<Breed> id);
  Future<DogModel> getRandomDog();
}

class DogDataSourceImpl extends DogDataSource {
  final ApiClient _client;

  DogDataSourceImpl({required ApiClient client}) : _client = client;

  @override
  Future<List<DogModel>> getDogsByBreed(ID<Breed> id) async {
    final result = await _client.get(
      path: 'images/search',
      queryParameters: {
        'limit': '30',
        'breed_id': id.value,
      },
    );

    return result.response
        .map<DogModel>((dog) => DogModel.fromJson(dog))
        .toList();
  }

  @override
  Future<DogModel> getRandomDog() async {
    final result = await _client.get(path: 'images/search');

    if (result.response.isNotEmpty) {
      return DogModel.fromJson(result.response.first);
    }

    throw DogNotExistsException();
  }
}

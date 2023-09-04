import 'package:dog_app/data/client/api_client.dart';
import 'package:dog_app/data/error/exceptions.dart';
import 'package:dog_app/domain/entities/breed.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/entities/id.dart';
import 'package:dog_app/domain/entities/result.dart';
import 'package:dog_app/domain/error/failures.dart';
import 'package:dog_app/domain/utils/network_info.dart';

abstract class DogRepository {
  Future<Result<List<Dog>>> getDogsByBreed(ID<Breed> id);
  Future<Result<Dog>> getRandomDog();
}

class DogRepositoryImpl extends DogRepository {
  final NetworkInfo _networkInfo;
  final ApiClient _apiClient;

  DogRepositoryImpl({
    required NetworkInfo networkInfo,
    required ApiClient apiClient,
  })  : _networkInfo = networkInfo,
        _apiClient = apiClient;

  @override
  Future<Result<List<Dog>>> getDogsByBreed(ID<Breed> id) async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await _apiClient.getDogsByBreed(id);

        return Result.success(result);
      } on ServerException {
        return Result.error(ServerFailure());
      }
    } else {
      return Result.error(NetworkFailure());
    }
  }

  @override
  Future<Result<Dog>> getRandomDog() async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await _apiClient.getRandomDog();

        return Result.success(result);
      } on ServerException {
        return Result.error(ServerFailure());
      } on DogNotExistsException {
        return Result.error(DogNotExistsFailure());
      }
    } else {
      return Result.error(NetworkFailure());
    }
  }
}

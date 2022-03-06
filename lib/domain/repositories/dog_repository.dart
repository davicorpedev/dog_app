import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:dog_app/domain/core/utils/network_info.dart';
import 'package:dog_app/data/data_source/dog_data_source.dart';
import 'package:dog_app/domain/core/entitites/result.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/dog.dart';

class DogRepository {
  final NetworkInfo _networkInfo;
  final DogDataSource _dataSource;

  DogRepository({
    required NetworkInfo networkInfo,
    required DogDataSource dataSource,
  })  : _networkInfo = networkInfo,
        _dataSource = dataSource;

  Future<Result<List<Dog>>> getDogsByBreed(int breedID) async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await _dataSource.getDogsByBreed(breedID);

        return Result.success(result);
      } on ServerException {
        return Result.error(ServerFailure());
      }
    } else {
      return Result.error(NetworkFailure());
    }
  }

  Future<Result<Dog>> getRandomDog() async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await _dataSource.getRandomDog();

        return Result.success(result);
      } on ServerException {
        return Result.error(ServerFailure());
      }
    } else {
      return Result.error(NetworkFailure());
    }
  }
}

import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:dog_app/data/datasources/dog_data_source.dart';
import 'package:dog_app/domain/core/entitites/breed.dart';
import 'package:dog_app/domain/core/entitites/id.dart';
import 'package:dog_app/domain/core/entitites/result.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/core/utils/network_info.dart';
import 'package:dog_app/domain/entities/dog.dart';

abstract class DogRepository {
  Future<Result<List<Dog>>> getDogsByBreed(ID<Breed> id);
  Future<Result<Dog>> getRandomDog();
}

class DogRepositoryImpl extends DogRepository {
  final NetworkInfo _networkInfo;
  final DogDataSource _dataSource;

  DogRepositoryImpl({
    required NetworkInfo networkInfo,
    required DogDataSource dataSource,
  })  : _networkInfo = networkInfo,
        _dataSource = dataSource;

  @override
  Future<Result<List<Dog>>> getDogsByBreed(ID<Breed> id) async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await _dataSource.getDogsByBreed(id);

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

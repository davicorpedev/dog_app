import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:dog_app/data/core/network/network_info.dart';
import 'package:dog_app/data/data_source/breed_data_source.dart';
import 'package:dog_app/domain/core/entitites/result.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/breed_data.dart';

class BreedRepository {
  final NetworkInfo _networkInfo;
  final BreedDataSource _dataSource;

  BreedRepository({
    required NetworkInfo networkInfo,
    required BreedDataSource dataSource,
  })  : _networkInfo = networkInfo,
        _dataSource = dataSource;

  Future<Result<List<BreedData>>> getBreeds() async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await _dataSource.getBreeds();

        return Result.success(result);
      } on ServerException {
        return Result.error(ServerFailure());
      }
    } else {
      return Result.error(NetworkFailure());
    }
  }
}
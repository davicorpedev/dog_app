import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:dog_app/domain/core/utils/network_info.dart';
import 'package:dog_app/data/datasources/breed_data_source.dart';
import 'package:dog_app/domain/core/entitites/result.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/breed_info.dart';

class BreedRepository {
  final NetworkInfo _networkInfo;
  final BreedDataSource _dataSource;

  BreedRepository({
    required NetworkInfo networkInfo,
    required BreedDataSource dataSource,
  })  : _networkInfo = networkInfo,
        _dataSource = dataSource;

  Future<Result<List<BreedInfo>>> getBreeds() async {
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

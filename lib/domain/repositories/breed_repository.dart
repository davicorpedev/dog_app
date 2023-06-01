import 'package:dog_app/data/datasources/breed_data_source.dart';
import 'package:dog_app/data/error/exceptions.dart';
import 'package:dog_app/domain/entities/breed_info.dart';
import 'package:dog_app/domain/entities/result.dart';
import 'package:dog_app/domain/error/failures.dart';
import 'package:dog_app/domain/utils/network_info.dart';

abstract class BreedRepository {
  Future<Result<List<BreedInfo>>> getBreeds();
}

class BreedRepositoryImpl extends BreedRepository {
  final NetworkInfo _networkInfo;
  final BreedDataSource _dataSource;

  BreedRepositoryImpl({
    required NetworkInfo networkInfo,
    required BreedDataSource dataSource,
  })  : _networkInfo = networkInfo,
        _dataSource = dataSource;

  List<BreedInfo> _cachedBreeds = [];

  @override
  Future<Result<List<BreedInfo>>> getBreeds() async {
    if (_cachedBreeds.isEmpty) {
      return await _getBreedsFromDataSource();
    }

    return Result.success(_cachedBreeds);
  }

  Future<Result<List<BreedInfo>>> _getBreedsFromDataSource() async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await _dataSource.getBreeds();

        _cacheBreeds(result);

        return Result.success(result);
      } on ServerException {
        return Result.error(ServerFailure());
      }
    } else {
      return Result.error(NetworkFailure());
    }
  }

  void _cacheBreeds(List<BreedInfo> breeds) {
    _cachedBreeds = breeds;
  }
}

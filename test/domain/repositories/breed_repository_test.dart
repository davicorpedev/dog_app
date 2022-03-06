import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dog_app/data/core/error/exceptions.dart';

import 'package:dog_app/data/data_source/breed_data_source.dart';
import 'package:dog_app/data/models/breed_data_model.dart';
import 'package:dog_app/domain/core/entitites/result.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/breed_data.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';

import '../core/mock_network_info.dart';

class MockBreedDataSource extends Mock implements BreedDataSource {}

void main() {
  late MockNetworkInfo networkInfo;
  late MockBreedDataSource dataSource;
  late BreedRepository repository;

  setUp(() {
    networkInfo = MockNetworkInfo();
    dataSource = MockBreedDataSource();
    repository = BreedRepository(
      dataSource: dataSource,
      networkInfo: networkInfo,
    );
  });

  group(
    'getBreeds',
    () {
      const tBreedModelList = [
        BreedDataModel(
          id: 1,
          name: 'test',
          temperament: 'test',
          lifeSpan: 'test',
          origin: 'test',
          image: 'test',
        ),
      ];

      List<BreedData> tBreedList = tBreedModelList;

      group(
        'device is online',
        () {
          test('should check if the device is online', () {
            networkInfo.runTestsOnline();
            when(() => dataSource.getBreeds()).thenAnswer(
              (_) async => tBreedModelList,
            );

            repository.getBreeds();

            verify(() => networkInfo.isConnected).called(1);
          });
        },
      );

      test(
        'should return data when the request is successful',
        () async {
          networkInfo.runTestsOnline();
          when(() => dataSource.getBreeds()).thenAnswer(
            (_) async => tBreedModelList,
          );

          final result = await repository.getBreeds();

          verify(() => dataSource.getBreeds()).called(1);
          expect(
            result,
            Result<List<BreedData>>.success(tBreedList),
          );
        },
      );

      test(
        'should return ServerFailure when the request has failed',
        () async {
          networkInfo.runTestsOnline();
          when(() => dataSource.getBreeds()).thenThrow(ServerException());

          final result = await repository.getBreeds();

          verify(() => dataSource.getBreeds()).called(1);

          expect(
            result,
            Result<List<BreedData>>.error(ServerFailure()),
          );
        },
      );

      test(
        'should return NetworkFailure when the user has no connection',
        () async {
          networkInfo.runTestsOffline();

          final result = await repository.getBreeds();

          verifyNever(() => dataSource.getBreeds()).called(1);
          expect(
            result,
            Result<List<BreedData>>.error(NetworkFailure()),
          );
        },
      );
    },
  );
}

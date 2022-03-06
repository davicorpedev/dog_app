import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:dog_app/data/data_source/dog_data_source.dart';
import 'package:dog_app/data/models/dog_breed_model.dart';
import 'package:dog_app/data/models/dog_model.dart';
import 'package:dog_app/domain/core/entitites/result.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';

import '../utils/mock_network_info.dart';

class MockDogDataSource extends Mock implements DogDataSource {}

void main() {
  late MockNetworkInfo networkInfo;
  late MockDogDataSource dataSource;
  late DogRepository repository;

  setUp(() {
    networkInfo = MockNetworkInfo();
    dataSource = MockDogDataSource();
    repository = DogRepository(
      networkInfo: networkInfo,
      dataSource: dataSource,
    );
  });

  group('getDogsByBreed', () {
    const tBreedId = 1;

    const tDogModelList = [
      DogModel(
        id: 'test',
        url: 'test',
        breeds: [
          DogBreedModel(
            id: 1,
            name: 'test',
            temperament: 'test',
            lifeSpan: 'test',
            origin: 'test',
          ),
        ],
      ),
    ];

    List<Dog> tDogList = tDogModelList;

    test(
      'should check if the device is online',
      () {
        networkInfo.runTestsOnline();
        when(() => dataSource.getDogsByBreed(any())).thenAnswer(
          (_) async => tDogModelList,
        );

        repository.getDogsByBreed(tBreedId);

        verify(() => networkInfo.isConnected).called(1);
      },
    );

    test(
      'should return data when the call is successful',
      () async {
        networkInfo.runTestsOnline();
        when(() => dataSource.getDogsByBreed(any())).thenAnswer(
          (_) async => tDogModelList,
        );

        final result = await repository.getDogsByBreed(tBreedId);

        verify(() => dataSource.getDogsByBreed(tBreedId)).called(1);
        expect(
          result,
          Result<List<Dog>>.success(tDogList),
        );
      },
    );

    test(
      'should return a ServerFailure when the request has failed',
      () async {
        networkInfo.runTestsOnline();
        when(() => dataSource.getDogsByBreed(any())).thenThrow(
          ServerException(),
        );

        final result = await repository.getDogsByBreed(tBreedId);

        verify(() => dataSource.getDogsByBreed(tBreedId)).called(1);
        expect(
          result,
          Result<List<Dog>>.error(ServerFailure()),
        );
      },
    );

    test(
      'should return NetworkFailure when the user has no connection',
      () async {
        networkInfo.runTestsOffline();

        final result = await repository.getDogsByBreed(tBreedId);

        verifyNever(() => dataSource.getDogsByBreed(any())).called(0);
        expect(
          result,
          Result<List<Dog>>.error(NetworkFailure()),
        );
      },
    );
  });

  group(
    'getRandomDog',
    () {
      const tDogModel = DogModel(
        id: 'test',
        url: 'test',
        breeds: [
          DogBreedModel(
            id: 1,
            name: 'test',
            temperament: 'test',
            lifeSpan: 'test',
            origin: 'test',
          ),
        ],
      );

      Dog tDog = tDogModel;

      test('should check is the device is online', () {
        networkInfo.runTestsOnline();
        when(() => dataSource.getRandomDog()).thenAnswer(
          (_) async => tDogModel,
        );

        repository.getRandomDog();

        verify(() => networkInfo.isConnected).called(1);
      });

      test(
        'should return a random Dog when the call is successful',
        () async {
          networkInfo.runTestsOnline();
          when(() => dataSource.getRandomDog()).thenAnswer(
            (_) async => tDogModel,
          );

          final result = await repository.getRandomDog();

          verify(() => dataSource.getRandomDog()).called(1);
          expect(
            result,
            Result<Dog>.success(tDog),
          );
        },
      );

      test(
        'should return a ServerFailure when the request is unsuccessful',
        () async {
          networkInfo.runTestsOnline();
          when(() => dataSource.getRandomDog()).thenThrow(
            ServerException(),
          );

          final result = await repository.getRandomDog();

          expect(
            result,
            Result<Dog>.error(ServerFailure()),
          );
        },
      );

      test(
        'should return a NetworkFailure when the user has no connection',
        () async {
          networkInfo.runTestsOffline();

          final result = await repository.getRandomDog();

          verifyNever(() => dataSource.getRandomDog()).called(0);
          expect(
            result,
            Result<Dog>.error(NetworkFailure()),
          );
        },
      );
    },
  );
}

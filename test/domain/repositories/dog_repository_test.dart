import 'package:dog_app/data/error/exceptions.dart';
import 'package:dog_app/data/models/dog_breed_model.dart';
import 'package:dog_app/data/models/dog_model.dart';
import 'package:dog_app/domain/entities/breed.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/entities/id.dart';
import 'package:dog_app/domain/entities/result.dart';
import 'package:dog_app/domain/error/failures.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../data/utils/mock_api_client.dart';
import '../utils/mock_network_info.dart';

void main() {
  late MockNetworkInfo networkInfo;
  late MockApiClient apiClient;
  late DogRepository repository;

  setUp(() {
    networkInfo = MockNetworkInfo();
    apiClient = MockApiClient();
    repository = DogRepositoryImpl(
      networkInfo: networkInfo,
      apiClient: apiClient,
    );
  });

  group('getDogsByBreed', () {
    const tBreedID = ID<Breed>('1');

    setUpAll(() {
      registerFallbackValue(ID<Breed>);
    });

    const tDogModelList = [
      DogModel(
        id: ID('test'),
        url: 'test',
        breeds: [
          DogBreedModel(
            id: ID('1'),
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
        when(() => apiClient.getDogsByBreed(tBreedID)).thenAnswer(
          (_) async => tDogModelList,
        );

        repository.getDogsByBreed(tBreedID);

        verify(() => networkInfo.isConnected).called(1);
      },
    );

    test(
      'should return data when the call is successful',
      () async {
        networkInfo.runTestsOnline();
        when(() => apiClient.getDogsByBreed(tBreedID)).thenAnswer(
          (_) async => tDogModelList,
        );

        final result = await repository.getDogsByBreed(tBreedID);

        verify(() => apiClient.getDogsByBreed(tBreedID)).called(1);
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
        when(() => apiClient.getDogsByBreed(tBreedID)).thenThrow(
          ServerException(),
        );

        final result = await repository.getDogsByBreed(tBreedID);

        verify(() => apiClient.getDogsByBreed(tBreedID)).called(1);
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

        final result = await repository.getDogsByBreed(tBreedID);

        verifyNever(() => apiClient.getDogsByBreed(tBreedID)).called(0);
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
        id: ID('test'),
        url: 'test',
        breeds: [
          DogBreedModel(
            id: ID('1'),
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
        when(() => apiClient.getRandomDog()).thenAnswer(
          (_) async => tDogModel,
        );

        repository.getRandomDog();

        verify(() => networkInfo.isConnected).called(1);
      });

      test(
        'should return a random Dog when the call is successful',
        () async {
          networkInfo.runTestsOnline();
          when(() => apiClient.getRandomDog()).thenAnswer(
            (_) async => tDogModel,
          );

          final result = await repository.getRandomDog();

          verify(() => apiClient.getRandomDog()).called(1);
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
          when(() => apiClient.getRandomDog()).thenThrow(
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
        'should return a DogNotExistsFailure when the request does not return a Dog',
        () async {
          networkInfo.runTestsOnline();
          when(() => apiClient.getRandomDog()).thenThrow(
            DogNotExistsException(),
          );

          final result = await repository.getRandomDog();

          expect(
            result,
            Result<Dog>.error(DogNotExistsFailure()),
          );
        },
      );

      test(
        'should return a NetworkFailure when the user has no connection',
        () async {
          networkInfo.runTestsOffline();

          final result = await repository.getRandomDog();

          verifyNever(() => apiClient.getRandomDog()).called(0);
          expect(
            result,
            Result<Dog>.error(NetworkFailure()),
          );
        },
      );
    },
  );
}

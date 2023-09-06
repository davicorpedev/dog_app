import 'dart:convert';

import 'package:dog_app/data/client/api_client.dart';
import 'package:dog_app/data/client/api_requester.dart';
import 'package:dog_app/data/error/exceptions.dart';
import 'package:dog_app/data/models/breed_info_model.dart';
import 'package:dog_app/data/models/dog_breed_model.dart';
import 'package:dog_app/data/models/dog_model.dart';
import 'package:dog_app/domain/entities/breed.dart';
import 'package:dog_app/domain/entities/id.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../fixtures/fixture_reader.dart';

class MockApiRequester extends Mock implements ApiRequester {}

void main() {
  late MockApiRequester mockApiRequester;
  late LiveApiClient apiClient;

  setUp(() {
    mockApiRequester = MockApiRequester();
    apiClient = LiveApiClient(apiRequester: mockApiRequester);
  });

  group('getBreeds', () {
    const tBreedModelList = [
      BreedInfoModel(
        id: ID('1'),
        name: 'test',
        temperament: 'test',
        lifeSpan: 'test',
        origin: 'test',
        image: 'test',
      )
    ];

    void mockGetBreedsSuccess() {
      when(
        () => mockApiRequester.get(path: any(named: 'path')),
      ).thenAnswer(
        (_) async => http.Response(
          json.decode(fixture('breed_list.json')),
          200,
        ),
      );
    }

    test(
      'should perform a get request with x-api-key in header',
      () {
        mockGetBreedsSuccess();

        apiClient.getBreeds();

        verify(
          () => mockApiRequester.get(path: 'breeds'),
        ).called(1);
      },
    );

    test(
      'should return a list of breeds when the request is successful',
      () async {
        mockGetBreedsSuccess();

        final result = await apiClient.getBreeds();

        expect(result, tBreedModelList);
      },
    );

    test(
      'should throw a ServerException when the response fails',
      () async {
        when(() => mockApiRequester.get(path: any(named: 'path')))
            .thenThrow(ServerException());

        final call = apiClient.getBreeds();

        expect(() => call, throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });

  group('getDogsByBreed', () {
    const tBreedID = ID<Breed>('1');

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

    void mockGetDogsByBreedSuccess() {
      when(
        () => mockApiRequester.get(
          path: any(named: 'path'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          json.decode(fixture('dog_list.json')),
          200,
        ),
      );
    }

    test(
      'should perform a GET request with x-api-key in header',
      () {
        mockGetDogsByBreedSuccess();

        apiClient.getDogsByBreed(tBreedID);

        verify(
          () => mockApiRequester.get(
            path: 'images/search',
            queryParameters: {
              'limit': '30',
              'breed_id': tBreedID.value,
            },
          ),
        ).called(1);
      },
    );

    test(
      'should return a list of dogs when the request is successful',
      () async {
        mockGetDogsByBreedSuccess();

        final result = await apiClient.getDogsByBreed(tBreedID);

        expect(result, tDogModelList);
      },
    );

    test(
      'should throw a ServerException when request fails',
      () {
        when(
          () => mockApiRequester.get(
            path: any(named: 'path'),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenThrow(ServerException());

        final call = apiClient.getDogsByBreed(tBreedID);

        expect(() => call, throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });

  group('getRandomDog', () {
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

    void mockGetRandomDogSuccess() {
      when(() => mockApiRequester.get(path: any(named: 'path'))).thenAnswer(
        (_) async => http.Response(
          json.decode(fixture('dog_list.json')),
          200,
        ),
      );
    }

    test(
      'should perform a GET request with a x-api-key in header',
      () async {
        mockGetRandomDogSuccess();

        apiClient.getRandomDog();

        verify(
          () => mockApiRequester.get(path: 'images/search'),
        ).called(1);
      },
    );

    test(
      'should return a list of Dog when the request is successful',
      () async {
        mockGetRandomDogSuccess();

        final result = await apiClient.getRandomDog();

        expect(result, tDogModel);
      },
    );

    test(
      'should throw ServerException when the request fails',
      () async {
        when(
          () => mockApiRequester.get(path: any(named: 'path')),
        ).thenThrow(ServerException());

        final call = apiClient.getRandomDog;

        expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
      },
    );

    test(
      'should throw DogNotExistsException when the request returns an empty JSON',
      () async {
        when(() => mockApiRequester.get(path: any(named: 'path'))).thenAnswer(
          (_) async => http.Response('[]', 200),
        );

        final call = apiClient.getRandomDog;

        expect(
          () => call(),
          throwsA(const TypeMatcher<DogNotExistsException>()),
        );
      },
    );
  });
}

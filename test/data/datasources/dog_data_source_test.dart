import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:dog_app/data/datasources/dog_data_source.dart';
import 'package:dog_app/data/models/dog_breed_model.dart';
import 'package:dog_app/data/models/dog_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../fixtures/fixture_reader.dart';
import '../utils/mock_api_client.dart';

void main() {
  late MockApiClient client;
  late DogDataSource dataSource;

  setUp(() {
    client = MockApiClient();
    dataSource = DogDataSource(client: client);
  });

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  group('getDogsByBreed', () {
    const tBreedID = 1;

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

    void mockGetDogsByBreedSuccess() {
      when(
        () => client.get(
          path: any(named: 'path'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer(
        (_) async => http.Response(fixture('dog_list.json'), 200),
      );
    }

    void mockGetDogsByBreedError() {
      when(
        () => client.get(
          path: any(named: 'path'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(ServerException());
    }

    test(
      'should perform a GET request with x-api-key in header',
      () {
        mockGetDogsByBreedSuccess();

        dataSource.getDogsByBreed(tBreedID);

        verify(
          () => client.get(
            path: 'images/search',
            queryParameters: {
              'limit': '30',
              'breed_id': '$tBreedID',
            },
          ),
        ).called(1);
      },
    );

    test(
      'should return a list of dogs when the request is successful',
      () async {
        mockGetDogsByBreedSuccess();

        final result = await dataSource.getDogsByBreed(tBreedID);

        expect(result, tDogModelList);
      },
    );

    test(
      'should throw a ServerException when request fails',
      () {
        mockGetDogsByBreedError();

        final call = dataSource.getDogsByBreed(tBreedID);

        expect(() => call, throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });

  group('getRandomDog', () {
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

    void mockGetRandomDogSuccess() {
      when(
        () => client.get(path: any(named: 'path')),
      ).thenAnswer(
        (_) async => http.Response(fixture('dog_list.json'), 200),
      );
    }

    void mockGetRandomDogError() {
      when(
        () => client.get(path: any(named: 'path')),
      ).thenThrow(ServerException());
    }

    test(
      'should perform a GET request with a x-api-key in header',
      () async {
        mockGetRandomDogSuccess();

        dataSource.getRandomDog();

        verify(
          () => client.get(path: 'images/search'),
        ).called(1);
      },
    );

    test(
      'should return a list of Dog when the request is successful',
      () async {
        mockGetRandomDogSuccess();

        final result = await dataSource.getRandomDog();

        expect(result, tDogModel);
      },
    );

    test(
      'should throw ServerException when the request fails',
      () async {
        mockGetRandomDogError();

        final call = dataSource.getRandomDog;

        expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}

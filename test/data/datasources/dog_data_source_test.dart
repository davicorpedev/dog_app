import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:dog_app/data/datasources/dog_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:dog_app/data/models/dog_breed_model.dart';
import 'package:dog_app/data/models/dog_model.dart';
import 'package:dog_app/server_config.dart';
import '../../fixtures/fixture_reader.dart';
import '../core/mock_http_client.dart';

void main() {
  late MockHttpClient client;
  late DogDataSource dataSource;

  setUp(() {
    client = MockHttpClient();
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
          any(),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(fixture('dog_list.json'), 200),
      );
    }

    void mockGetDogsByBreedError() {
      when(
        () => client.get(
          any(),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );
    }

    test(
      'should perform a GET request with x-api-key in header',
      () {
        mockGetDogsByBreedSuccess();

        dataSource.getDogsByBreed(tBreedID);

        verify(
          () => client.get(
            Uri.https(
              url,
              '/$version/images/search?limit=30&breed_id=$tBreedID',
            ),
            headers: {'x-api-key': apiKey},
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
        () => client.get(
          any(),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(fixture('dog_list.json'), 200),
      );
    }

    void mockGetRandomDogError() {
      when(
        () => client.get(
          any(),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );
    }

    test(
      'should perform a GET request with a x-api-key in header',
      () async {
        mockGetRandomDogSuccess();

        dataSource.getRandomDog();

        verify(
          () => client.get(
            Uri.https(
              url,
              '/$version/images/search',
            ),
            headers: {'x-api-key': apiKey},
          ),
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

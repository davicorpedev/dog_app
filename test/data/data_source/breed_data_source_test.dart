import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:dog_app/data/data_source/breed_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:dog_app/data/models/breed_data_model.dart';
import 'package:dog_app/server_config.dart';

import '../../fixtures/fixture_reader.dart';
import '../core/mock_http_client.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late BreedDataSource dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = BreedDataSource(client: mockHttpClient);
  });

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  group('getBreeds', () {
    const tBreedModelList = [
      BreedDataModel(
        id: 1,
        name: 'test',
        temperament: 'test',
        lifeSpan: 'test',
        origin: 'test',
        image: 'test',
      )
    ];

    void mockGetBreedsSuccess() {
      when(
        () => mockHttpClient.get(
          any(),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(fixture('breed_list.json'), 200),
      );
    }

    void mockGetBreedsError() {
      when(
        () => mockHttpClient.get(
          any(),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );
    }

    test(
      'should perform a get request with x-api-key in header',
      () {
        mockGetBreedsSuccess();

        dataSource.getBreeds();

        verify(
          () => mockHttpClient.get(
            Uri.https(url, '/$version/breeds'),
            headers: {'x-api-key': apiKey},
          ),
        ).called(1);
      },
    );

    test(
      'should return a list of breeds when the request is successful',
      () async {
        mockGetBreedsSuccess();

        final result = await dataSource.getBreeds();

        expect(result, tBreedModelList);
      },
    );

    test(
      'should throw a ServerException when the response fails',
      () async {
        mockGetBreedsError();

        final call = dataSource.getBreeds();

        expect(() => call, throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}

import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:dog_app/data/datasources/breed_data_source.dart';
import 'package:dog_app/data/models/breed_info_model.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../fixtures/fixture_reader.dart';
import '../utils/mock_api_client.dart';

void main() {
  late MockApiClient mockHttpClient;
  late BreedDataSourceImpl dataSource;

  setUp(() {
    mockHttpClient = MockApiClient();
    dataSource = BreedDataSourceImpl(client: mockHttpClient);
  });

  group('getBreeds', () {
    const tBreedModelList = [
      BreedInfoModel(
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
        () => mockHttpClient.get(path: any(named: 'path')),
      ).thenAnswer(
        (_) async => http.Response(fixture('breed_list.json'), 200),
      );
    }

    void mockGetBreedsError() {
      when(
        () => mockHttpClient.get(path: any(named: 'path')),
      ).thenThrow(ServerException());
    }

    test(
      'should perform a get request with x-api-key in header',
      () {
        mockGetBreedsSuccess();

        dataSource.getBreeds();

        verify(
          () => mockHttpClient.get(path: 'breeds'),
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

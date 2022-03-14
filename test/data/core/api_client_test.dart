import 'package:dog_app/data/core/client/api_client.dart';
import 'package:dog_app/data/core/error/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  const baseUrl = 'baseUrl';
  const serverVersion = 'v1';
  const apiKey = 'apiKey';
  const path = 'path';

  late final LiveApiClient apiClient;
  late final MockHttpClient httpClient;

  setUpAll(() {
    httpClient = MockHttpClient();

    apiClient = LiveApiClient(
      client: httpClient,
      baseUrl: baseUrl,
      serverVersion: serverVersion,
      apiKey: apiKey,
    );

    registerFallbackValue(Uri());
  });

  group(
    'get',
    () {
      test(
        'should call get of the http client',
        () async {
          when(
            () => httpClient.get(
              any(),
              headers: any(named: 'headers'),
            ),
          ).thenAnswer((_) async => http.Response('', 200));

          await apiClient.get(path: path);

          verify(
            () => httpClient.get(
              Uri.https(
                baseUrl,
                '/$serverVersion/$path',
                {},
              ),
              headers: {'x-api-key': apiKey},
            ),
          ).called(1);
        },
      );

      test(
        'should return a Response if the request has succeed',
        () async {
          when(
            () => httpClient.get(
              any(),
              headers: any(named: 'headers'),
            ),
          ).thenAnswer((_) async => http.Response('', 200));

          final result = await apiClient.get(path: path);

          expect(result.body, '');
          expect(result.statusCode, 200);
        },
      );

      test(
        'should throw a ServerException if the request has failed',
        () async {
          when(
            () => httpClient.get(
              any(),
              headers: any(named: 'headers'),
            ),
          ).thenAnswer((_) async => http.Response('', 404));

          final call = apiClient.get(path: path);

          expect(
            () => call,
            throwsA(const TypeMatcher<ServerException>()),
          );
        },
      );
    },
  );
}

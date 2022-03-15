import 'package:dog_app/data/core/client/api_client.dart';
import 'package:dog_app/data/core/client/api_result.dart';
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

  const jsonKey = 'test';
  const jsonValue = 'test';

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
        'should perform a HTTP GET request with valid queryParameters and headers',
        () async {
          when(
            () => httpClient.get(
              any(),
              headers: any(named: 'headers'),
            ),
          ).thenAnswer((_) async => http.Response('[]', 200));

          await apiClient.get(
            path: path,
            queryParameters: {jsonKey: jsonValue},
          );

          verify(
            () => httpClient.get(
              Uri.https(
                baseUrl,
                '/$serverVersion/$path',
                {jsonKey: jsonValue},
              ),
              headers: {'x-api-key': apiKey},
            ),
          ).called(1);
        },
      );

      test(
        'should return an ApiResponse if the response is successful',
        () async {
          when(
            () => httpClient.get(
              any(),
              headers: any(named: 'headers'),
            ),
          ).thenAnswer(
            (_) async => http.Response('[{"$jsonKey": "$jsonValue"}]', 200),
          );

          final result = await apiClient.get(path: path);

          expect(
            result,
            ApiResult.fromList(
              const [
                {jsonKey: jsonValue}
              ],
            ),
          );
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
          ).thenAnswer((_) async => http.Response('[]', 404));

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

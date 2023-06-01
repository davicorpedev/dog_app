import 'package:dog_app/data/client/api_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tMapList = <dynamic>[
    {'test': 'test'}
  ];

  group('fromList', () {
    test(
      'should return a valid object',
      () async {
        final result = ApiResult.fromList(tMapList);

        expect(result.response, tMapList);
      },
    );
  });
}

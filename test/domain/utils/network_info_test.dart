import 'package:dog_app/domain/utils/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';

class MockDataConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late NetworkInfo networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfo(connectionChecker: mockDataConnectionChecker);
  });

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
        when(() => mockDataConnectionChecker.hasConnection).thenAnswer(
          (_) async => true,
        );

        final result = await networkInfo.isConnected;

        verify(() => mockDataConnectionChecker.hasConnection).called(1);
        expect(result, true);
      },
    );
  });
}

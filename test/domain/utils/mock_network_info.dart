import 'package:mocktail/mocktail.dart';
import 'package:dog_app/domain/core/utils/network_info.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

extension Helpers on MockNetworkInfo {
  void runTestsOnline() {
    when(() => isConnected).thenAnswer((_) async => true);
  }

  void runTestsOffline() {
    when(() => isConnected).thenAnswer((_) async => false);
  }
}
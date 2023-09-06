import 'package:dog_app/domain/error/failures.dart';

const String serverFailureMessage = 'Server Failure';
const String networkFailureMessage = 'Network Failure';
const String dogNotExistsFailureMessage = 'Dog does not exist';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureMessage;
    case NetworkFailure:
      return networkFailureMessage;
    case DogNotExistsFailure:
      return dogNotExistsFailureMessage;
    default:
      return 'Unexpected Error';
  }
}

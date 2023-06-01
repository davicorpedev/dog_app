import 'package:equatable/equatable.dart';

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

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class NetworkFailure extends Failure {}

class InvalidUrlFailure extends Failure {}

class DogNotExistsFailure extends Failure {}

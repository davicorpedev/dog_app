import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class NetworkFailure extends Failure {}

class InvalidUrlFailure extends Failure {}

class DogNotExistsFailure extends Failure {}

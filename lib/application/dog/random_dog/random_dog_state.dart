part of 'random_dog_bloc.dart';

abstract class RandomDogState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends RandomDogState {}

class Loading extends RandomDogState {}

class Loaded extends RandomDogState {
  final Dog dog;

  Loaded({required this.dog});

  @override
  List<Object> get props => [dog];
}

class Error extends RandomDogState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}

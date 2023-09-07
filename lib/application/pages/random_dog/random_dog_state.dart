part of 'random_dog_bloc.dart';

abstract class RandomDogState extends Equatable {
  const RandomDogState();

  @override
  List<Object> get props => [];
}

class RandomDogInitialState extends RandomDogState {
  const RandomDogInitialState();
}

class RandomDogLoadingState extends RandomDogState {
  const RandomDogLoadingState();
}

class RandomDogLoadedState extends RandomDogState {
  final Dog dog;

  const RandomDogLoadedState({required this.dog});

  @override
  List<Object> get props => [dog];
}

class RandomDogErrorState extends RandomDogState {
  final Failure failure;

  const RandomDogErrorState({required this.failure});

  @override
  List<Object> get props => [failure];
}

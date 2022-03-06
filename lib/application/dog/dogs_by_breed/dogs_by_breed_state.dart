part of 'dogs_by_breed_bloc.dart';

abstract class DogsByBreedState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends DogsByBreedState {}

class Loading extends DogsByBreedState {}

class Loaded extends DogsByBreedState {
  final List<Dog> dogs;

  Loaded({required this.dogs});

  @override
  List<Object> get props => [dogs];
}

class Error extends DogsByBreedState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}

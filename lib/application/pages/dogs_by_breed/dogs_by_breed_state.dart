part of 'dogs_by_breed_bloc.dart';

abstract class DogsByBreedState extends Equatable {
  const DogsByBreedState();

  @override
  List<Object> get props => [];
}

class DogsByBreedInitialState extends DogsByBreedState {
  const DogsByBreedInitialState();
}

class DogsByBreedLoadingState extends DogsByBreedState {
  const DogsByBreedLoadingState();
}

class DogsByBreedLoadedState extends DogsByBreedState {
  final List<Dog> dogs;

  const DogsByBreedLoadedState({required this.dogs});

  @override
  List<Object> get props => [dogs];
}

class DogsByBreedErrorState extends DogsByBreedState {
  final Failure failure;

  const DogsByBreedErrorState({required this.failure});

  @override
  List<Object> get props => [failure];
}

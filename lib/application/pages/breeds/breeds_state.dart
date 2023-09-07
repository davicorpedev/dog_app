part of 'breeds_bloc.dart';

abstract class BreedsState extends Equatable {
  const BreedsState();

  @override
  List<Object> get props => [];
}

class BreedsInitialState extends BreedsState {
  const BreedsInitialState();
}

class BreedsLoadingState extends BreedsState {
  const BreedsLoadingState();
}

class BreedsLoadedState extends BreedsState {
  final List<BreedInfo> breeds;

  const BreedsLoadedState({required this.breeds});

  @override
  List<Object> get props => [breeds];
}

class BreedsErrorState extends BreedsState {
  final Failure failure;

  const BreedsErrorState({required this.failure});

  @override
  List<Object> get props => [failure];
}

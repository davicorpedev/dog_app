part of 'breed_bloc.dart';

abstract class BreedState extends Equatable {
  const BreedState();

  @override
  List<Object> get props => [];
}

class BreedInitialState extends BreedState {
  const BreedInitialState();
}

class BreedLoadingState extends BreedState {
  const BreedLoadingState();
}

class BreedLoadedState extends BreedState {
  final List<BreedInfo> breeds;

  const BreedLoadedState({required this.breeds});

  @override
  List<Object> get props => [breeds];
}

class BreedErrorState extends BreedState {
  final String message;

  const BreedErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

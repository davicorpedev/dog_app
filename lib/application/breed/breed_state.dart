part of 'breed_bloc.dart';

abstract class BreedState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends BreedState {}

class Loading extends BreedState {}

class Loaded extends BreedState {
  final List<BreedInfo> breeds;

  Loaded({required this.breeds});

  @override
  List<Object> get props => [breeds];
}

class Error extends BreedState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}

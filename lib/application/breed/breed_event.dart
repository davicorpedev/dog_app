part of 'breed_bloc.dart';

abstract class BreedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetBreedsEvent extends BreedEvent {}

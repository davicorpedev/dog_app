part of 'dogs_by_breed_bloc.dart';

abstract class DogsByBreedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDogsByBreedEvent extends DogsByBreedEvent {
  final int breedId;

  GetDogsByBreedEvent({required this.breedId});

  @override
  List<Object> get props => [breedId];
}

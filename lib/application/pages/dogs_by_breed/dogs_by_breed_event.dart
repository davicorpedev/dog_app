part of 'dogs_by_breed_bloc.dart';

abstract class DogsByBreedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDogsByBreedEvent extends DogsByBreedEvent {
  final ID<Breed> breedID;

  GetDogsByBreedEvent({required this.breedID});

  @override
  List<Object> get props => [breedID];
}

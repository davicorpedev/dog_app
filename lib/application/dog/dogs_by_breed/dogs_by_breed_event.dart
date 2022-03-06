part of 'dogs_by_breed_bloc.dart';

abstract class DogsByBreedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDogsByBreed extends DogsByBreedEvent {
  final int breedId;

  GetDogsByBreed({required this.breedId});

  @override
  List<Object> get props => [breedId];
}

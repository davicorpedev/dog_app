part of 'random_dog_bloc.dart';

abstract class RandomDogEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetRandomDog extends RandomDogEvent {}

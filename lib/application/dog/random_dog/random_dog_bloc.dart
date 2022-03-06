import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';

part 'random_dog_event.dart';

part 'random_dog_state.dart';

class RandomDogBloc extends Bloc<RandomDogEvent, RandomDogState> {
  final DogRepository _repository;

  RandomDogBloc({required DogRepository repository})
      : _repository = repository,
        super(Initial()) {
    on<GetRandomDog>(_onGetRandomDog);
  }

  void _onGetRandomDog(
    GetRandomDog event,
    Emitter<RandomDogState> emit,
  ) async {
    emit(Loading());

    final result = await _repository.getRandomDog();

    await result.when(
      success: (dog) async {
        emit(Loaded(dog: dog));
      },
      error: (failure) async {
        emit(Error(message: mapFailureToMessage(failure)));
      },
    );
  }
}

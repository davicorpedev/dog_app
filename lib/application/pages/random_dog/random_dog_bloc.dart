import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/error/failures.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_dog_event.dart';
part 'random_dog_state.dart';

class RandomDogBloc extends Bloc<RandomDogEvent, RandomDogState> {
  final DogRepository _repository;

  RandomDogBloc({
    required DogRepository repository,
  })  : _repository = repository,
        super(const RandomDogInitialState()) {
    on<GetRandomDogEvent>(_onGetRandomDog);
    add(GetRandomDogEvent());
  }

  void _onGetRandomDog(
    GetRandomDogEvent event,
    Emitter<RandomDogState> emit,
  ) async {
    emit(const RandomDogLoadingState());

    final result = await _repository.getRandomDog();

    result.when(
      success: (dog) {
        emit(RandomDogLoadedState(dog: dog));
      },
      error: (failure) {
        emit(RandomDogErrorState(failure: failure));
      },
    );
  }
}

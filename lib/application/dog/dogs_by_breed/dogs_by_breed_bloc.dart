import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';

part 'dogs_by_breed_event.dart';

part 'dogs_by_breed_state.dart';

class DogsByBreedBloc extends Bloc<DogsByBreedEvent, DogsByBreedState> {
  final DogRepository _repository;

  DogsByBreedBloc({
    required DogRepository repository,
  })  : _repository = repository,
        super(Empty()) {
    on<GetDogsByBreed>(_onGetDogsByBreed);
  }

  void _onGetDogsByBreed(
    GetDogsByBreed event,
    Emitter<DogsByBreedState> emit,
  ) async {
    emit(Loading());

    final result = await _repository.getDogsByBreed(event.breedId);

    result.when(
      success: (dogs) {
        emit(Loaded(dogs: dogs));
      },
      error: (failure) {
        emit(Error(message: mapFailureToMessage(failure)));
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';
import 'package:equatable/equatable.dart';

part 'dogs_by_breed_event.dart';
part 'dogs_by_breed_state.dart';

class DogsByBreedBloc extends Bloc<DogsByBreedEvent, DogsByBreedState> {
  final int _breedId;
  final DogRepository _repository;

  DogsByBreedBloc({
    required int breedId,
    required DogRepository repository,
  })  : _repository = repository,
        _breedId = breedId,
        super(Empty()) {
    on<GetDogsByBreed>(_onGetDogsByBreed);
    add(GetDogsByBreed(breedId: _breedId));
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

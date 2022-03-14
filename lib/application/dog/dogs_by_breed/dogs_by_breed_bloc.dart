import 'package:bloc/bloc.dart';
import 'package:dog_app/domain/core/entitites/breed.dart';
import 'package:dog_app/domain/core/entitites/id.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';
import 'package:equatable/equatable.dart';

part 'dogs_by_breed_event.dart';
part 'dogs_by_breed_state.dart';

class DogsByBreedBloc extends Bloc<DogsByBreedEvent, DogsByBreedState> {
  final ID<Breed> _breedId;
  final DogRepository _repository;

  DogsByBreedBloc({
    required ID<Breed> breedId,
    required DogRepository repository,
  })  : _repository = repository,
        _breedId = breedId,
        super(const DogsByBreedInitialState()) {
    on<GetDogsByBreedEvent>(_onGetDogsByBreed);
    add(GetDogsByBreedEvent(breedId: _breedId));
  }

  void _onGetDogsByBreed(
    GetDogsByBreedEvent event,
    Emitter<DogsByBreedState> emit,
  ) async {
    emit(const DogsByBreedLoadingState());

    final result = await _repository.getDogsByBreed(event.breedId);

    result.when(
      success: (dogs) {
        emit(DogsByBreedLoadedState(dogs: dogs));
      },
      error: (failure) {
        emit(DogsByBreedErrorState(message: mapFailureToMessage(failure)));
      },
    );
  }
}

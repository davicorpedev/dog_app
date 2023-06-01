import 'package:dog_app/domain/entities/breed.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/entities/id.dart';
import 'package:dog_app/domain/error/failures.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dogs_by_breed_event.dart';
part 'dogs_by_breed_state.dart';

class DogsByBreedBloc extends Bloc<DogsByBreedEvent, DogsByBreedState> {
  final ID<Breed> _breedID;
  final DogRepository _repository;

  DogsByBreedBloc({
    required ID<Breed> breedID,
    required DogRepository repository,
  })  : _repository = repository,
        _breedID = breedID,
        super(const DogsByBreedInitialState()) {
    on<GetDogsByBreedEvent>(_onGetDogsByBreed);
    add(GetDogsByBreedEvent(breedID: _breedID));
  }

  void _onGetDogsByBreed(
    GetDogsByBreedEvent event,
    Emitter<DogsByBreedState> emit,
  ) async {
    emit(const DogsByBreedLoadingState());

    final result = await _repository.getDogsByBreed(event.breedID);

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

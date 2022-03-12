import 'package:bloc/bloc.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/breed_info.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:equatable/equatable.dart';

part 'breed_event.dart';
part 'breed_state.dart';

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  final BreedRepository _repository;

  BreedBloc({
    required BreedRepository repository,
  })  : _repository = repository,
        super(const BreedInitialState()) {
    on<GetBreedsEvent>(_onGetBreeds);
    add(GetBreedsEvent());
  }

  void _onGetBreeds(
    GetBreedsEvent event,
    Emitter<BreedState> emit,
  ) async {
    emit(const BreedLoadingState());

    final result = await _repository.getBreeds();

    result.when(
      success: (breeds) {
        emit(BreedLoadedState(breeds: breeds));
      },
      error: (failure) {
        emit(BreedErrorState(message: mapFailureToMessage(failure)));
      },
    );
  }
}

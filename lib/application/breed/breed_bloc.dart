import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/breed_info.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';

part 'breed_event.dart';
part 'breed_state.dart';

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  final BreedRepository _repository;

  BreedBloc({
    required BreedRepository repository,
  })  : _repository = repository,
        super(Empty()) {
    on<GetBreeds>(_onGetBreeds);
  }

  void _onGetBreeds(
    GetBreeds event,
    Emitter<BreedState> emit,
  ) async {
    emit(Loading());

    final result = await _repository.getBreeds();

    await result.when(
      success: (breeds) async {
        emit(Loaded(breeds: breeds));
      },
      error: (failure) async {
        emit(Error(message: mapFailureToMessage(failure)));
      },
    );
  }
}

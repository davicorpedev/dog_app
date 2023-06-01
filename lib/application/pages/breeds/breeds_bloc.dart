import 'package:dog_app/domain/error/failures.dart';
import 'package:dog_app/domain/entities/breed_info.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'breeds_event.dart';
part 'breeds_state.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  final BreedRepository _repository;

  BreedsBloc({
    required BreedRepository repository,
  })  : _repository = repository,
        super(const BreedsInitialState()) {
    on<GetBreedsEvent>(_onGetBreeds);
    add(GetBreedsEvent());
  }

  void _onGetBreeds(
    GetBreedsEvent event,
    Emitter<BreedsState> emit,
  ) async {
    emit(const BreedsLoadingState());

    final result = await _repository.getBreeds();

    result.when(
      success: (breeds) {
        emit(BreedsLoadedState(breeds: breeds));
      },
      error: (failure) {
        emit(BreedsErrorState(message: mapFailureToMessage(failure)));
      },
    );
  }
}

import 'package:dog_app/domain/entities/breed.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'breeds_flow_cubit.freezed.dart';
part 'breeds_flow_state.dart';

class BreedsFlowCubit extends Cubit<BreedsFlowState> {
  BreedsFlowCubit()
      : super(
          BreedsFlowState(
            selectedBreed: null,
            selectedDog: null,
            currentScreen: BreedsFlowScreen.breeds,
          ),
        );

  void openDogDetails(Dog dog) {
    emit(
      state.copyWith(
        currentScreen: BreedsFlowScreen.dogDetails,
        selectedDog: dog,
      ),
    );
  }

  void openDogsByBreed(Breed breed) {
    emit(
      state.copyWith(
        currentScreen: BreedsFlowScreen.dogsByBreed,
        selectedBreed: breed,
      ),
    );
  }

  void back() {
    switch (state.currentScreen) {
      case BreedsFlowScreen.breeds:
        break;
      case BreedsFlowScreen.dogsByBreed:
        emit(
          state.copyWith(
            currentScreen: BreedsFlowScreen.breeds,
            selectedBreed: null,
          ),
        );
        break;
      case BreedsFlowScreen.dogDetails:
        emit(
          state.copyWith(
            currentScreen: BreedsFlowScreen.dogsByBreed,
            selectedDog: null,
          ),
        );
        break;
    }
  }
}

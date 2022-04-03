part of 'breeds_flow_cubit.dart';

enum BreedsFlowScreen { breeds, dogsByBreed, dogDetails }

@freezed
class BreedsFlowState with _$BreedsFlowState {
  factory BreedsFlowState({
    required Breed? selectedBreed,
    required Dog? selectedDog,
    required BreedsFlowScreen currentScreen,
  }) = _BreedsFlowState;
}

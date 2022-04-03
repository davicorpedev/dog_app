import 'package:bloc_test/bloc_test.dart';
import 'package:dog_app/application/breeds_flow/breeds_flow_cubit.dart';
import 'package:dog_app/domain/core/entitites/id.dart';
import 'package:dog_app/domain/entities/breed_info.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/entities/dog_breed.dart';

void main() {
  const tDog = Dog(
    id: ID('test'),
    url: 'test',
    breeds: [
      DogBreed(
        id: ID('1'),
        name: 'test',
        temperament: 'test',
        lifeSpan: 'test',
        origin: 'test',
      ),
    ],
  );

  const tBreed = BreedInfo(
    image: 'test',
    id: ID('1'),
    name: 'test',
    temperament: 'test',
    lifeSpan: 'test',
    origin: 'test',
  );

  blocTest<BreedsFlowCubit, BreedsFlowState>(
    'should have a default constructor',
    build: () => BreedsFlowCubit(),
  );

  blocTest<BreedsFlowCubit, BreedsFlowState>(
    'should open DogsByBreed when a breed is selected',
    build: () => BreedsFlowCubit(),
    act: (bloc) => bloc.openDogsByBreed(tBreed),
    expect: () => [
      BreedsFlowState(
        currentScreen: BreedsFlowScreen.dogsByBreed,
        selectedBreed: tBreed,
        selectedDog: null,
      ),
    ],
  );

  blocTest<BreedsFlowCubit, BreedsFlowState>(
    'should open DogsDetails when a dog is selected',
    build: () => BreedsFlowCubit(),
    act: (bloc) {
      bloc.openDogsByBreed(tBreed);
      bloc.openDogDetails(tDog);
    },
    expect: () => [
      BreedsFlowState(
        currentScreen: BreedsFlowScreen.dogsByBreed,
        selectedBreed: tBreed,
        selectedDog: null,
      ),
      BreedsFlowState(
        currentScreen: BreedsFlowScreen.dogDetails,
        selectedBreed: tBreed,
        selectedDog: tDog,
      ),
    ],
  );
}

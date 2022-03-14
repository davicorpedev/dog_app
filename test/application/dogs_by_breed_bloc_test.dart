import 'package:bloc_test/bloc_test.dart';
import 'package:dog_app/application/dog/dogs_by_breed/dogs_by_breed_bloc.dart';
import 'package:dog_app/domain/core/entitites/breed.dart';
import 'package:dog_app/domain/core/entitites/id.dart';
import 'package:dog_app/domain/core/entitites/result.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/entities/dog_breed.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDogRepository extends Mock implements DogRepository {}

void main() {
  late MockDogRepository repository;

  setUp(() {
    repository = MockDogRepository();
  });

  group('GetDogsByBreed', () {
    const tBreedId = ID<Breed>('1');

    const tDogList = [
      Dog(
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
      ),
    ];

    blocTest<DogsByBreedBloc, DogsByBreedState>(
      'should get the data from the repository',
      setUp: () {
        when(() => repository.getDogsByBreed(tBreedId)).thenAnswer(
          (_) async => const Result<List<Dog>>.success(tDogList),
        );
      },
      build: () => DogsByBreedBloc(
        repository: repository,
        breedId: tBreedId,
      ),
      verify: (bloc) {
        verify(() => repository.getDogsByBreed(tBreedId)).called(1);
      },
    );

    blocTest<DogsByBreedBloc, DogsByBreedState>(
      'should emit [Loading, Loaded] when the request has succeded',
      setUp: () {
        when(() => repository.getDogsByBreed(tBreedId)).thenAnswer(
          (_) async => const Result<List<Dog>>.success(tDogList),
        );
      },
      build: () => DogsByBreedBloc(
        repository: repository,
        breedId: tBreedId,
      ),
      expect: () => [
        const DogsByBreedLoadingState(),
        const DogsByBreedLoadedState(dogs: tDogList),
      ],
    );

    blocTest<DogsByBreedBloc, DogsByBreedState>(
      'should emit [Loading, Error] when the request has failed',
      setUp: () {
        when(() => repository.getDogsByBreed(tBreedId)).thenAnswer(
          (_) async => Result<List<Dog>>.error(ServerFailure()),
        );
      },
      build: () => DogsByBreedBloc(
        repository: repository,
        breedId: tBreedId,
      ),
      expect: () => [
        const DogsByBreedLoadingState(),
        const DogsByBreedErrorState(message: serverFailureMessage),
      ],
    );
  });
}

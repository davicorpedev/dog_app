import 'package:bloc_test/bloc_test.dart';
import 'package:dog_app/application/pages/dogs_by_breed/dogs_by_breed_bloc.dart';
import 'package:dog_app/domain/entities/breed.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/entities/dog_breed.dart';
import 'package:dog_app/domain/entities/id.dart';
import 'package:dog_app/domain/entities/result.dart';
import 'package:dog_app/domain/error/failures.dart';
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
    const tBreedID = ID<Breed>('1');

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
        when(() => repository.getDogsByBreed(tBreedID)).thenAnswer(
          (_) async => const Result<List<Dog>>.success(tDogList),
        );
      },
      build: () => DogsByBreedBloc(
        repository: repository,
        breedID: tBreedID,
      ),
      verify: (bloc) {
        verify(() => repository.getDogsByBreed(tBreedID)).called(1);
      },
    );

    blocTest<DogsByBreedBloc, DogsByBreedState>(
      'should emit [Loading, Loaded] when the request has succeded',
      setUp: () {
        when(() => repository.getDogsByBreed(tBreedID)).thenAnswer(
          (_) async => const Result<List<Dog>>.success(tDogList),
        );
      },
      build: () => DogsByBreedBloc(
        repository: repository,
        breedID: tBreedID,
      ),
      expect: () => [
        const DogsByBreedLoadingState(),
        const DogsByBreedLoadedState(dogs: tDogList),
      ],
    );

    blocTest<DogsByBreedBloc, DogsByBreedState>(
      'should emit [Loading, Error] when the request has failed',
      setUp: () {
        when(() => repository.getDogsByBreed(tBreedID)).thenAnswer(
          (_) async => Result<List<Dog>>.error(ServerFailure()),
        );
      },
      build: () => DogsByBreedBloc(
        repository: repository,
        breedID: tBreedID,
      ),
      expect: () => [
        const DogsByBreedLoadingState(),
        const DogsByBreedErrorState(message: serverFailureMessage),
      ],
    );
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:dog_app/application/pages/random_dog/random_dog_bloc.dart';
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

  group('GetRandomDog', () {
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

    blocTest<RandomDogBloc, RandomDogState>(
      'should get the data from the repository',
      setUp: () {
        when(() => repository.getRandomDog()).thenAnswer(
          (_) async => const Result<Dog>.success(tDog),
        );
      },
      build: () => RandomDogBloc(repository: repository),
      verify: (bloc) {
        verify(() => repository.getRandomDog()).called(1);
      },
    );

    blocTest<RandomDogBloc, RandomDogState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      setUp: () {
        when(() => repository.getRandomDog()).thenAnswer(
          (_) async => const Result<Dog>.success(tDog),
        );
      },
      build: () => RandomDogBloc(repository: repository),
      expect: () => [
        const RandomDogLoadingState(),
        const RandomDogLoadedState(dog: tDog),
      ],
    );

    blocTest<RandomDogBloc, RandomDogState>(
      'should emit [Loading, Error] with an error when the data fails',
      setUp: () {
        when(() => repository.getRandomDog()).thenAnswer(
          (_) async => Result<Dog>.error(ServerFailure()),
        );
      },
      build: () => RandomDogBloc(repository: repository),
      expect: () => [
        const RandomDogLoadingState(),
        RandomDogErrorState(failure: ServerFailure()),
      ],
    );

    blocTest<RandomDogBloc, RandomDogState>(
      'should emit [Loading, Error] with an error when the request does not return a Dog',
      setUp: () {
        when(() => repository.getRandomDog()).thenAnswer(
          (_) async => Result<Dog>.error(DogNotExistsFailure()),
        );
      },
      build: () => RandomDogBloc(repository: repository),
      expect: () => [
        const RandomDogLoadingState(),
        RandomDogErrorState(failure: DogNotExistsFailure()),
      ],
    );
  });
}

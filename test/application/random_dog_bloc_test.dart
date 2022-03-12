import 'package:bloc_test/bloc_test.dart';
import 'package:dog_app/application/dog/random_dog/random_dog_bloc.dart';
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

  group('GetRandomDog', () {
    const tDog = Dog(
      id: 'test',
      url: 'test',
      breeds: [
        DogBreed(
          id: 1,
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
        const RandomDogErrorState(message: serverFailureMessage),
      ],
    );
  });
}

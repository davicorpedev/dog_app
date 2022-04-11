import 'package:bloc_test/bloc_test.dart';
import 'package:dog_app/application/pages/app_initializer/app_initializer_cubit.dart';
import 'package:mocktail/mocktail.dart';

abstract class FutureFunction {
  Future<void> call();
}

class MockInitializationTasks extends Mock implements FutureFunction {}

void main() {
  final tInitializationTasks = MockInitializationTasks();

  blocTest<AppInitializerCubit, AppInitializerState>(
    'should emit [Loading, Loaded] when the app has been successfully initialized',
    build: () => AppInitializerCubit(),
    setUp: () {
      when(() => tInitializationTasks.call()).thenAnswer(
        (_) async => () {},
      );
    },
    act: (cubit) => cubit.initializeTasks(tInitializationTasks.call),
    verify: (cubit) {
      verify(() => tInitializationTasks.call()).called(1);
    },
    expect: () => [
      AppInitializerLoadingState(),
      AppInitializerLoadedState(),
    ],
  );

  blocTest<AppInitializerCubit, AppInitializerState>(
    'should emit [Loading, Error] when the app has received an Exception when initializing',
    build: () => AppInitializerCubit(),
    setUp: () {
      when(() => tInitializationTasks.call()).thenThrow(Exception());
    },
    act: (cubit) => cubit.initializeTasks(tInitializationTasks.call),
    expect: () => [
      AppInitializerLoadingState(),
      AppInitializerErrorState(),
    ],
  );
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_initializer_state.dart';

class AppInitializerCubit extends Cubit<AppInitializerState> {
  AppInitializerCubit() : super(AppInitializerInitialState());

  Future<void> initializeTasks(
    Future<void> Function() initializationTasks,
  ) async {
    try {
      emit(AppInitializerLoadingState());

      await initializationTasks();

      emit(AppInitializerLoadedState());
    } catch (e) {
      emit(AppInitializerErrorState());
    }
  }
}

part of 'app_initializer_cubit.dart';

abstract class AppInitializerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppInitializerInitialState extends AppInitializerState {}

class AppInitializerLoadingState extends AppInitializerState {}

class AppInitializerLoadedState extends AppInitializerState {}

class AppInitializerErrorState extends AppInitializerState {}

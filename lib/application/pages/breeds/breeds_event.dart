part of 'breeds_bloc.dart';

abstract class BreedsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetBreedsEvent extends BreedsEvent {}

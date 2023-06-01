import 'package:equatable/equatable.dart';

class ID<T> extends Equatable {
  final String value;

  const ID(this.value);

  @override
  List<Object?> get props => [value];
}

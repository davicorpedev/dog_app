// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'breeds_flow_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BreedsFlowStateTearOff {
  const _$BreedsFlowStateTearOff();

  _BreedsFlowState call(
      {required Breed? selectedBreed,
      required Dog? selectedDog,
      required BreedsFlowScreen currentScreen}) {
    return _BreedsFlowState(
      selectedBreed: selectedBreed,
      selectedDog: selectedDog,
      currentScreen: currentScreen,
    );
  }
}

/// @nodoc
const $BreedsFlowState = _$BreedsFlowStateTearOff();

/// @nodoc
mixin _$BreedsFlowState {
  Breed? get selectedBreed => throw _privateConstructorUsedError;
  Dog? get selectedDog => throw _privateConstructorUsedError;
  BreedsFlowScreen get currentScreen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BreedsFlowStateCopyWith<BreedsFlowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedsFlowStateCopyWith<$Res> {
  factory $BreedsFlowStateCopyWith(
          BreedsFlowState value, $Res Function(BreedsFlowState) then) =
      _$BreedsFlowStateCopyWithImpl<$Res>;
  $Res call(
      {Breed? selectedBreed, Dog? selectedDog, BreedsFlowScreen currentScreen});
}

/// @nodoc
class _$BreedsFlowStateCopyWithImpl<$Res>
    implements $BreedsFlowStateCopyWith<$Res> {
  _$BreedsFlowStateCopyWithImpl(this._value, this._then);

  final BreedsFlowState _value;
  // ignore: unused_field
  final $Res Function(BreedsFlowState) _then;

  @override
  $Res call({
    Object? selectedBreed = freezed,
    Object? selectedDog = freezed,
    Object? currentScreen = freezed,
  }) {
    return _then(_value.copyWith(
      selectedBreed: selectedBreed == freezed
          ? _value.selectedBreed
          : selectedBreed // ignore: cast_nullable_to_non_nullable
              as Breed?,
      selectedDog: selectedDog == freezed
          ? _value.selectedDog
          : selectedDog // ignore: cast_nullable_to_non_nullable
              as Dog?,
      currentScreen: currentScreen == freezed
          ? _value.currentScreen
          : currentScreen // ignore: cast_nullable_to_non_nullable
              as BreedsFlowScreen,
    ));
  }
}

/// @nodoc
abstract class _$BreedsFlowStateCopyWith<$Res>
    implements $BreedsFlowStateCopyWith<$Res> {
  factory _$BreedsFlowStateCopyWith(
          _BreedsFlowState value, $Res Function(_BreedsFlowState) then) =
      __$BreedsFlowStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Breed? selectedBreed, Dog? selectedDog, BreedsFlowScreen currentScreen});
}

/// @nodoc
class __$BreedsFlowStateCopyWithImpl<$Res>
    extends _$BreedsFlowStateCopyWithImpl<$Res>
    implements _$BreedsFlowStateCopyWith<$Res> {
  __$BreedsFlowStateCopyWithImpl(
      _BreedsFlowState _value, $Res Function(_BreedsFlowState) _then)
      : super(_value, (v) => _then(v as _BreedsFlowState));

  @override
  _BreedsFlowState get _value => super._value as _BreedsFlowState;

  @override
  $Res call({
    Object? selectedBreed = freezed,
    Object? selectedDog = freezed,
    Object? currentScreen = freezed,
  }) {
    return _then(_BreedsFlowState(
      selectedBreed: selectedBreed == freezed
          ? _value.selectedBreed
          : selectedBreed // ignore: cast_nullable_to_non_nullable
              as Breed?,
      selectedDog: selectedDog == freezed
          ? _value.selectedDog
          : selectedDog // ignore: cast_nullable_to_non_nullable
              as Dog?,
      currentScreen: currentScreen == freezed
          ? _value.currentScreen
          : currentScreen // ignore: cast_nullable_to_non_nullable
              as BreedsFlowScreen,
    ));
  }
}

/// @nodoc

class _$_BreedsFlowState implements _BreedsFlowState {
  _$_BreedsFlowState(
      {required this.selectedBreed,
      required this.selectedDog,
      required this.currentScreen});

  @override
  final Breed? selectedBreed;
  @override
  final Dog? selectedDog;
  @override
  final BreedsFlowScreen currentScreen;

  @override
  String toString() {
    return 'BreedsFlowState(selectedBreed: $selectedBreed, selectedDog: $selectedDog, currentScreen: $currentScreen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BreedsFlowState &&
            const DeepCollectionEquality()
                .equals(other.selectedBreed, selectedBreed) &&
            const DeepCollectionEquality()
                .equals(other.selectedDog, selectedDog) &&
            const DeepCollectionEquality()
                .equals(other.currentScreen, currentScreen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedBreed),
      const DeepCollectionEquality().hash(selectedDog),
      const DeepCollectionEquality().hash(currentScreen));

  @JsonKey(ignore: true)
  @override
  _$BreedsFlowStateCopyWith<_BreedsFlowState> get copyWith =>
      __$BreedsFlowStateCopyWithImpl<_BreedsFlowState>(this, _$identity);
}

abstract class _BreedsFlowState implements BreedsFlowState {
  factory _BreedsFlowState(
      {required Breed? selectedBreed,
      required Dog? selectedDog,
      required BreedsFlowScreen currentScreen}) = _$_BreedsFlowState;

  @override
  Breed? get selectedBreed;
  @override
  Dog? get selectedDog;
  @override
  BreedsFlowScreen get currentScreen;
  @override
  @JsonKey(ignore: true)
  _$BreedsFlowStateCopyWith<_BreedsFlowState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breeds_flow_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$BreedsFlowStateCopyWithImpl<$Res, BreedsFlowState>;
  @useResult
  $Res call(
      {Breed? selectedBreed, Dog? selectedDog, BreedsFlowScreen currentScreen});
}

/// @nodoc
class _$BreedsFlowStateCopyWithImpl<$Res, $Val extends BreedsFlowState>
    implements $BreedsFlowStateCopyWith<$Res> {
  _$BreedsFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedBreed = freezed,
    Object? selectedDog = freezed,
    Object? currentScreen = null,
  }) {
    return _then(_value.copyWith(
      selectedBreed: freezed == selectedBreed
          ? _value.selectedBreed
          : selectedBreed // ignore: cast_nullable_to_non_nullable
              as Breed?,
      selectedDog: freezed == selectedDog
          ? _value.selectedDog
          : selectedDog // ignore: cast_nullable_to_non_nullable
              as Dog?,
      currentScreen: null == currentScreen
          ? _value.currentScreen
          : currentScreen // ignore: cast_nullable_to_non_nullable
              as BreedsFlowScreen,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BreedsFlowStateCopyWith<$Res>
    implements $BreedsFlowStateCopyWith<$Res> {
  factory _$$_BreedsFlowStateCopyWith(
          _$_BreedsFlowState value, $Res Function(_$_BreedsFlowState) then) =
      __$$_BreedsFlowStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Breed? selectedBreed, Dog? selectedDog, BreedsFlowScreen currentScreen});
}

/// @nodoc
class __$$_BreedsFlowStateCopyWithImpl<$Res>
    extends _$BreedsFlowStateCopyWithImpl<$Res, _$_BreedsFlowState>
    implements _$$_BreedsFlowStateCopyWith<$Res> {
  __$$_BreedsFlowStateCopyWithImpl(
      _$_BreedsFlowState _value, $Res Function(_$_BreedsFlowState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedBreed = freezed,
    Object? selectedDog = freezed,
    Object? currentScreen = null,
  }) {
    return _then(_$_BreedsFlowState(
      selectedBreed: freezed == selectedBreed
          ? _value.selectedBreed
          : selectedBreed // ignore: cast_nullable_to_non_nullable
              as Breed?,
      selectedDog: freezed == selectedDog
          ? _value.selectedDog
          : selectedDog // ignore: cast_nullable_to_non_nullable
              as Dog?,
      currentScreen: null == currentScreen
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
            other is _$_BreedsFlowState &&
            (identical(other.selectedBreed, selectedBreed) ||
                other.selectedBreed == selectedBreed) &&
            (identical(other.selectedDog, selectedDog) ||
                other.selectedDog == selectedDog) &&
            (identical(other.currentScreen, currentScreen) ||
                other.currentScreen == currentScreen));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedBreed, selectedDog, currentScreen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BreedsFlowStateCopyWith<_$_BreedsFlowState> get copyWith =>
      __$$_BreedsFlowStateCopyWithImpl<_$_BreedsFlowState>(this, _$identity);
}

abstract class _BreedsFlowState implements BreedsFlowState {
  factory _BreedsFlowState(
      {required final Breed? selectedBreed,
      required final Dog? selectedDog,
      required final BreedsFlowScreen currentScreen}) = _$_BreedsFlowState;

  @override
  Breed? get selectedBreed;
  @override
  Dog? get selectedDog;
  @override
  BreedsFlowScreen get currentScreen;
  @override
  @JsonKey(ignore: true)
  _$$_BreedsFlowStateCopyWith<_$_BreedsFlowState> get copyWith =>
      throw _privateConstructorUsedError;
}

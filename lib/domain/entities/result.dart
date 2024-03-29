import 'package:dog_app/domain/error/failures.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T value) = _Success<T>;
  const factory Result.error(Failure failure) = _Error;
}

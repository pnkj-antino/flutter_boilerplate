import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_boilerplate/src/core/error/app_exception.dart';

part 'result.freezed.dart';

/// A generic class that holds either a success value or a failure value
@freezed
class Result<T> with _$Result<T> {
  /// Private constructor for freezed
  const Result._();
  
  /// Create a success result with data
  const factory Result.success(T data) = Success<T>;

  /// Create a failure result with AppException
  const factory Result.failure(AppException exception) = Failure<T>;
  
  /// Whether the result is a success
  bool get isSuccess => this is Success<T>;
  
  /// Whether the result is a failure
  bool get isFailure => this is Failure<T>;
  
  /// Get the success value (throws if failure)
  T get data {
    return when(
      success: (data) => data,
      failure: (exception) => throw exception,
    );
  }
  
  /// Get the success value or handle failure with a callback
  T getOrElse(T Function(AppException exception) orElse) {
    return when(
      success: (data) => data,
      failure: (exception) => orElse(exception),
    );
  }
  
  /// Transform the success value
  Result<R> mapData<R>(R Function(T data) transform) {
    return when(
      success: (data) => Result.success(transform(data)),
      failure: (exception) => Result.failure(exception),
    );
  }
  
  /// Flat map to another Result
  Result<R> flatMap<R>(Result<R> Function(T data) transform) {
    return when(
      success: (data) => transform(data),
      failure: (exception) => Result.failure(exception),
    );
  }
}
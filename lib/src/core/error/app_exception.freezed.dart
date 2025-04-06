// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? message, int? statusCode, String? stackTrace)
        network,
    required TResult Function(
            String message, int? statusCode, String? stackTrace)
        server,
    required TResult Function(String? message, String? stackTrace) unexpected,
    required TResult Function() noInternet,
    required TResult Function() timeout,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String? resource) notFound,
    required TResult Function(String message, Map<String, dynamic>? errors)
        validation,
    required TResult Function(String message) cache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult? Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult? Function(String? message, String? stackTrace)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? timeout,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String message, Map<String, dynamic>? errors)? validation,
    TResult? Function(String message)? cache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult Function(String? message, String? stackTrace)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? timeout,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String? resource)? notFound,
    TResult Function(String message, Map<String, dynamic>? errors)? validation,
    TResult Function(String message)? cache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(ServerException value) server,
    required TResult Function(UnexpectedException value) unexpected,
    required TResult Function(NoInternetException value) noInternet,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ForbiddenException value) forbidden,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(ValidationException value) validation,
    required TResult Function(CacheException value) cache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnexpectedException value)? unexpected,
    TResult? Function(NoInternetException value)? noInternet,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ForbiddenException value)? forbidden,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(CacheException value)? cache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(ServerException value)? server,
    TResult Function(UnexpectedException value)? unexpected,
    TResult Function(NoInternetException value)? noInternet,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ForbiddenException value)? forbidden,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(ValidationException value)? validation,
    TResult Function(CacheException value)? cache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NetworkExceptionImplCopyWith<$Res> {
  factory _$$NetworkExceptionImplCopyWith(_$NetworkExceptionImpl value,
          $Res Function(_$NetworkExceptionImpl) then) =
      __$$NetworkExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message, int? statusCode, String? stackTrace});
}

/// @nodoc
class __$$NetworkExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NetworkExceptionImpl>
    implements _$$NetworkExceptionImplCopyWith<$Res> {
  __$$NetworkExceptionImplCopyWithImpl(_$NetworkExceptionImpl _value,
      $Res Function(_$NetworkExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? statusCode = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$NetworkExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NetworkExceptionImpl extends NetworkException {
  const _$NetworkExceptionImpl({this.message, this.statusCode, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final int? statusCode;
  @override
  final String? stackTrace;

  @override
  String toString() {
    return 'AppException.network(message: $message, statusCode: $statusCode, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode, stackTrace);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkExceptionImplCopyWith<_$NetworkExceptionImpl> get copyWith =>
      __$$NetworkExceptionImplCopyWithImpl<_$NetworkExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? message, int? statusCode, String? stackTrace)
        network,
    required TResult Function(
            String message, int? statusCode, String? stackTrace)
        server,
    required TResult Function(String? message, String? stackTrace) unexpected,
    required TResult Function() noInternet,
    required TResult Function() timeout,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String? resource) notFound,
    required TResult Function(String message, Map<String, dynamic>? errors)
        validation,
    required TResult Function(String message) cache,
  }) {
    return network(message, statusCode, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult? Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult? Function(String? message, String? stackTrace)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? timeout,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String message, Map<String, dynamic>? errors)? validation,
    TResult? Function(String message)? cache,
  }) {
    return network?.call(message, statusCode, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult Function(String? message, String? stackTrace)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? timeout,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String? resource)? notFound,
    TResult Function(String message, Map<String, dynamic>? errors)? validation,
    TResult Function(String message)? cache,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message, statusCode, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(ServerException value) server,
    required TResult Function(UnexpectedException value) unexpected,
    required TResult Function(NoInternetException value) noInternet,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ForbiddenException value) forbidden,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(ValidationException value) validation,
    required TResult Function(CacheException value) cache,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnexpectedException value)? unexpected,
    TResult? Function(NoInternetException value)? noInternet,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ForbiddenException value)? forbidden,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(CacheException value)? cache,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(ServerException value)? server,
    TResult Function(UnexpectedException value)? unexpected,
    TResult Function(NoInternetException value)? noInternet,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ForbiddenException value)? forbidden,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(ValidationException value)? validation,
    TResult Function(CacheException value)? cache,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkException extends AppException {
  const factory NetworkException(
      {final String? message,
      final int? statusCode,
      final String? stackTrace}) = _$NetworkExceptionImpl;
  const NetworkException._() : super._();

  String? get message;
  int? get statusCode;
  String? get stackTrace;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkExceptionImplCopyWith<_$NetworkExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerExceptionImplCopyWith<$Res> {
  factory _$$ServerExceptionImplCopyWith(_$ServerExceptionImpl value,
          $Res Function(_$ServerExceptionImpl) then) =
      __$$ServerExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, int? statusCode, String? stackTrace});
}

/// @nodoc
class __$$ServerExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$ServerExceptionImpl>
    implements _$$ServerExceptionImplCopyWith<$Res> {
  __$$ServerExceptionImplCopyWithImpl(
      _$ServerExceptionImpl _value, $Res Function(_$ServerExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$ServerExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServerExceptionImpl extends ServerException {
  const _$ServerExceptionImpl(
      {required this.message, this.statusCode, this.stackTrace})
      : super._();

  @override
  final String message;
  @override
  final int? statusCode;
  @override
  final String? stackTrace;

  @override
  String toString() {
    return 'AppException.server(message: $message, statusCode: $statusCode, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode, stackTrace);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      __$$ServerExceptionImplCopyWithImpl<_$ServerExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? message, int? statusCode, String? stackTrace)
        network,
    required TResult Function(
            String message, int? statusCode, String? stackTrace)
        server,
    required TResult Function(String? message, String? stackTrace) unexpected,
    required TResult Function() noInternet,
    required TResult Function() timeout,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String? resource) notFound,
    required TResult Function(String message, Map<String, dynamic>? errors)
        validation,
    required TResult Function(String message) cache,
  }) {
    return server(message, statusCode, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult? Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult? Function(String? message, String? stackTrace)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? timeout,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String message, Map<String, dynamic>? errors)? validation,
    TResult? Function(String message)? cache,
  }) {
    return server?.call(message, statusCode, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult Function(String? message, String? stackTrace)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? timeout,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String? resource)? notFound,
    TResult Function(String message, Map<String, dynamic>? errors)? validation,
    TResult Function(String message)? cache,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message, statusCode, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(ServerException value) server,
    required TResult Function(UnexpectedException value) unexpected,
    required TResult Function(NoInternetException value) noInternet,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ForbiddenException value) forbidden,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(ValidationException value) validation,
    required TResult Function(CacheException value) cache,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnexpectedException value)? unexpected,
    TResult? Function(NoInternetException value)? noInternet,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ForbiddenException value)? forbidden,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(CacheException value)? cache,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(ServerException value)? server,
    TResult Function(UnexpectedException value)? unexpected,
    TResult Function(NoInternetException value)? noInternet,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ForbiddenException value)? forbidden,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(ValidationException value)? validation,
    TResult Function(CacheException value)? cache,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerException extends AppException {
  const factory ServerException(
      {required final String message,
      final int? statusCode,
      final String? stackTrace}) = _$ServerExceptionImpl;
  const ServerException._() : super._();

  String get message;
  int? get statusCode;
  String? get stackTrace;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedExceptionImplCopyWith<$Res> {
  factory _$$UnexpectedExceptionImplCopyWith(_$UnexpectedExceptionImpl value,
          $Res Function(_$UnexpectedExceptionImpl) then) =
      __$$UnexpectedExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message, String? stackTrace});
}

/// @nodoc
class __$$UnexpectedExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UnexpectedExceptionImpl>
    implements _$$UnexpectedExceptionImplCopyWith<$Res> {
  __$$UnexpectedExceptionImplCopyWithImpl(_$UnexpectedExceptionImpl _value,
      $Res Function(_$UnexpectedExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$UnexpectedExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnexpectedExceptionImpl extends UnexpectedException {
  const _$UnexpectedExceptionImpl({this.message, this.stackTrace}) : super._();

  @override
  final String? message;
  @override
  final String? stackTrace;

  @override
  String toString() {
    return 'AppException.unexpected(message: $message, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, stackTrace);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedExceptionImplCopyWith<_$UnexpectedExceptionImpl> get copyWith =>
      __$$UnexpectedExceptionImplCopyWithImpl<_$UnexpectedExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? message, int? statusCode, String? stackTrace)
        network,
    required TResult Function(
            String message, int? statusCode, String? stackTrace)
        server,
    required TResult Function(String? message, String? stackTrace) unexpected,
    required TResult Function() noInternet,
    required TResult Function() timeout,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String? resource) notFound,
    required TResult Function(String message, Map<String, dynamic>? errors)
        validation,
    required TResult Function(String message) cache,
  }) {
    return unexpected(message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult? Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult? Function(String? message, String? stackTrace)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? timeout,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String message, Map<String, dynamic>? errors)? validation,
    TResult? Function(String message)? cache,
  }) {
    return unexpected?.call(message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult Function(String? message, String? stackTrace)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? timeout,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String? resource)? notFound,
    TResult Function(String message, Map<String, dynamic>? errors)? validation,
    TResult Function(String message)? cache,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(message, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(ServerException value) server,
    required TResult Function(UnexpectedException value) unexpected,
    required TResult Function(NoInternetException value) noInternet,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ForbiddenException value) forbidden,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(ValidationException value) validation,
    required TResult Function(CacheException value) cache,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnexpectedException value)? unexpected,
    TResult? Function(NoInternetException value)? noInternet,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ForbiddenException value)? forbidden,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(CacheException value)? cache,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(ServerException value)? server,
    TResult Function(UnexpectedException value)? unexpected,
    TResult Function(NoInternetException value)? noInternet,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ForbiddenException value)? forbidden,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(ValidationException value)? validation,
    TResult Function(CacheException value)? cache,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class UnexpectedException extends AppException {
  const factory UnexpectedException(
      {final String? message,
      final String? stackTrace}) = _$UnexpectedExceptionImpl;
  const UnexpectedException._() : super._();

  String? get message;
  String? get stackTrace;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnexpectedExceptionImplCopyWith<_$UnexpectedExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoInternetExceptionImplCopyWith<$Res> {
  factory _$$NoInternetExceptionImplCopyWith(_$NoInternetExceptionImpl value,
          $Res Function(_$NoInternetExceptionImpl) then) =
      __$$NoInternetExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoInternetExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NoInternetExceptionImpl>
    implements _$$NoInternetExceptionImplCopyWith<$Res> {
  __$$NoInternetExceptionImplCopyWithImpl(_$NoInternetExceptionImpl _value,
      $Res Function(_$NoInternetExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoInternetExceptionImpl extends NoInternetException {
  const _$NoInternetExceptionImpl() : super._();

  @override
  String toString() {
    return 'AppException.noInternet()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoInternetExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? message, int? statusCode, String? stackTrace)
        network,
    required TResult Function(
            String message, int? statusCode, String? stackTrace)
        server,
    required TResult Function(String? message, String? stackTrace) unexpected,
    required TResult Function() noInternet,
    required TResult Function() timeout,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String? resource) notFound,
    required TResult Function(String message, Map<String, dynamic>? errors)
        validation,
    required TResult Function(String message) cache,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult? Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult? Function(String? message, String? stackTrace)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? timeout,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String message, Map<String, dynamic>? errors)? validation,
    TResult? Function(String message)? cache,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult Function(String? message, String? stackTrace)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? timeout,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String? resource)? notFound,
    TResult Function(String message, Map<String, dynamic>? errors)? validation,
    TResult Function(String message)? cache,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(ServerException value) server,
    required TResult Function(UnexpectedException value) unexpected,
    required TResult Function(NoInternetException value) noInternet,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ForbiddenException value) forbidden,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(ValidationException value) validation,
    required TResult Function(CacheException value) cache,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnexpectedException value)? unexpected,
    TResult? Function(NoInternetException value)? noInternet,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ForbiddenException value)? forbidden,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(CacheException value)? cache,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(ServerException value)? server,
    TResult Function(UnexpectedException value)? unexpected,
    TResult Function(NoInternetException value)? noInternet,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ForbiddenException value)? forbidden,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(ValidationException value)? validation,
    TResult Function(CacheException value)? cache,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class NoInternetException extends AppException {
  const factory NoInternetException() = _$NoInternetExceptionImpl;
  const NoInternetException._() : super._();
}

/// @nodoc
abstract class _$$TimeoutExceptionImplCopyWith<$Res> {
  factory _$$TimeoutExceptionImplCopyWith(_$TimeoutExceptionImpl value,
          $Res Function(_$TimeoutExceptionImpl) then) =
      __$$TimeoutExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimeoutExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$TimeoutExceptionImpl>
    implements _$$TimeoutExceptionImplCopyWith<$Res> {
  __$$TimeoutExceptionImplCopyWithImpl(_$TimeoutExceptionImpl _value,
      $Res Function(_$TimeoutExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimeoutExceptionImpl extends TimeoutException {
  const _$TimeoutExceptionImpl() : super._();

  @override
  String toString() {
    return 'AppException.timeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimeoutExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? message, int? statusCode, String? stackTrace)
        network,
    required TResult Function(
            String message, int? statusCode, String? stackTrace)
        server,
    required TResult Function(String? message, String? stackTrace) unexpected,
    required TResult Function() noInternet,
    required TResult Function() timeout,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String? resource) notFound,
    required TResult Function(String message, Map<String, dynamic>? errors)
        validation,
    required TResult Function(String message) cache,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult? Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult? Function(String? message, String? stackTrace)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? timeout,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String message, Map<String, dynamic>? errors)? validation,
    TResult? Function(String message)? cache,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult Function(String? message, String? stackTrace)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? timeout,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String? resource)? notFound,
    TResult Function(String message, Map<String, dynamic>? errors)? validation,
    TResult Function(String message)? cache,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(ServerException value) server,
    required TResult Function(UnexpectedException value) unexpected,
    required TResult Function(NoInternetException value) noInternet,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ForbiddenException value) forbidden,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(ValidationException value) validation,
    required TResult Function(CacheException value) cache,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnexpectedException value)? unexpected,
    TResult? Function(NoInternetException value)? noInternet,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ForbiddenException value)? forbidden,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(CacheException value)? cache,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(ServerException value)? server,
    TResult Function(UnexpectedException value)? unexpected,
    TResult Function(NoInternetException value)? noInternet,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ForbiddenException value)? forbidden,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(ValidationException value)? validation,
    TResult Function(CacheException value)? cache,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class TimeoutException extends AppException {
  const factory TimeoutException() = _$TimeoutExceptionImpl;
  const TimeoutException._() : super._();
}

/// @nodoc
abstract class _$$UnauthorizedExceptionImplCopyWith<$Res> {
  factory _$$UnauthorizedExceptionImplCopyWith(
          _$UnauthorizedExceptionImpl value,
          $Res Function(_$UnauthorizedExceptionImpl) then) =
      __$$UnauthorizedExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UnauthorizedExceptionImpl>
    implements _$$UnauthorizedExceptionImplCopyWith<$Res> {
  __$$UnauthorizedExceptionImplCopyWithImpl(_$UnauthorizedExceptionImpl _value,
      $Res Function(_$UnauthorizedExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnauthorizedExceptionImpl extends UnauthorizedException {
  const _$UnauthorizedExceptionImpl() : super._();

  @override
  String toString() {
    return 'AppException.unauthorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? message, int? statusCode, String? stackTrace)
        network,
    required TResult Function(
            String message, int? statusCode, String? stackTrace)
        server,
    required TResult Function(String? message, String? stackTrace) unexpected,
    required TResult Function() noInternet,
    required TResult Function() timeout,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String? resource) notFound,
    required TResult Function(String message, Map<String, dynamic>? errors)
        validation,
    required TResult Function(String message) cache,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult? Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult? Function(String? message, String? stackTrace)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? timeout,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String message, Map<String, dynamic>? errors)? validation,
    TResult? Function(String message)? cache,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult Function(String? message, String? stackTrace)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? timeout,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String? resource)? notFound,
    TResult Function(String message, Map<String, dynamic>? errors)? validation,
    TResult Function(String message)? cache,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(ServerException value) server,
    required TResult Function(UnexpectedException value) unexpected,
    required TResult Function(NoInternetException value) noInternet,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ForbiddenException value) forbidden,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(ValidationException value) validation,
    required TResult Function(CacheException value) cache,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnexpectedException value)? unexpected,
    TResult? Function(NoInternetException value)? noInternet,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ForbiddenException value)? forbidden,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(CacheException value)? cache,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(ServerException value)? server,
    TResult Function(UnexpectedException value)? unexpected,
    TResult Function(NoInternetException value)? noInternet,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ForbiddenException value)? forbidden,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(ValidationException value)? validation,
    TResult Function(CacheException value)? cache,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedException extends AppException {
  const factory UnauthorizedException() = _$UnauthorizedExceptionImpl;
  const UnauthorizedException._() : super._();
}

/// @nodoc
abstract class _$$ForbiddenExceptionImplCopyWith<$Res> {
  factory _$$ForbiddenExceptionImplCopyWith(_$ForbiddenExceptionImpl value,
          $Res Function(_$ForbiddenExceptionImpl) then) =
      __$$ForbiddenExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ForbiddenExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$ForbiddenExceptionImpl>
    implements _$$ForbiddenExceptionImplCopyWith<$Res> {
  __$$ForbiddenExceptionImplCopyWithImpl(_$ForbiddenExceptionImpl _value,
      $Res Function(_$ForbiddenExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ForbiddenExceptionImpl extends ForbiddenException {
  const _$ForbiddenExceptionImpl() : super._();

  @override
  String toString() {
    return 'AppException.forbidden()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ForbiddenExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? message, int? statusCode, String? stackTrace)
        network,
    required TResult Function(
            String message, int? statusCode, String? stackTrace)
        server,
    required TResult Function(String? message, String? stackTrace) unexpected,
    required TResult Function() noInternet,
    required TResult Function() timeout,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String? resource) notFound,
    required TResult Function(String message, Map<String, dynamic>? errors)
        validation,
    required TResult Function(String message) cache,
  }) {
    return forbidden();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult? Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult? Function(String? message, String? stackTrace)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? timeout,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String message, Map<String, dynamic>? errors)? validation,
    TResult? Function(String message)? cache,
  }) {
    return forbidden?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult Function(String? message, String? stackTrace)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? timeout,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String? resource)? notFound,
    TResult Function(String message, Map<String, dynamic>? errors)? validation,
    TResult Function(String message)? cache,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(ServerException value) server,
    required TResult Function(UnexpectedException value) unexpected,
    required TResult Function(NoInternetException value) noInternet,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ForbiddenException value) forbidden,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(ValidationException value) validation,
    required TResult Function(CacheException value) cache,
  }) {
    return forbidden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnexpectedException value)? unexpected,
    TResult? Function(NoInternetException value)? noInternet,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ForbiddenException value)? forbidden,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(CacheException value)? cache,
  }) {
    return forbidden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(ServerException value)? server,
    TResult Function(UnexpectedException value)? unexpected,
    TResult Function(NoInternetException value)? noInternet,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ForbiddenException value)? forbidden,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(ValidationException value)? validation,
    TResult Function(CacheException value)? cache,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden(this);
    }
    return orElse();
  }
}

abstract class ForbiddenException extends AppException {
  const factory ForbiddenException() = _$ForbiddenExceptionImpl;
  const ForbiddenException._() : super._();
}

/// @nodoc
abstract class _$$NotFoundExceptionImplCopyWith<$Res> {
  factory _$$NotFoundExceptionImplCopyWith(_$NotFoundExceptionImpl value,
          $Res Function(_$NotFoundExceptionImpl) then) =
      __$$NotFoundExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? resource});
}

/// @nodoc
class __$$NotFoundExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NotFoundExceptionImpl>
    implements _$$NotFoundExceptionImplCopyWith<$Res> {
  __$$NotFoundExceptionImplCopyWithImpl(_$NotFoundExceptionImpl _value,
      $Res Function(_$NotFoundExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resource = freezed,
  }) {
    return _then(_$NotFoundExceptionImpl(
      resource: freezed == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotFoundExceptionImpl extends NotFoundException {
  const _$NotFoundExceptionImpl({this.resource}) : super._();

  @override
  final String? resource;

  @override
  String toString() {
    return 'AppException.notFound(resource: $resource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundExceptionImpl &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resource);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundExceptionImplCopyWith<_$NotFoundExceptionImpl> get copyWith =>
      __$$NotFoundExceptionImplCopyWithImpl<_$NotFoundExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? message, int? statusCode, String? stackTrace)
        network,
    required TResult Function(
            String message, int? statusCode, String? stackTrace)
        server,
    required TResult Function(String? message, String? stackTrace) unexpected,
    required TResult Function() noInternet,
    required TResult Function() timeout,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String? resource) notFound,
    required TResult Function(String message, Map<String, dynamic>? errors)
        validation,
    required TResult Function(String message) cache,
  }) {
    return notFound(resource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult? Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult? Function(String? message, String? stackTrace)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? timeout,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String message, Map<String, dynamic>? errors)? validation,
    TResult? Function(String message)? cache,
  }) {
    return notFound?.call(resource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult Function(String? message, String? stackTrace)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? timeout,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String? resource)? notFound,
    TResult Function(String message, Map<String, dynamic>? errors)? validation,
    TResult Function(String message)? cache,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(resource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(ServerException value) server,
    required TResult Function(UnexpectedException value) unexpected,
    required TResult Function(NoInternetException value) noInternet,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ForbiddenException value) forbidden,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(ValidationException value) validation,
    required TResult Function(CacheException value) cache,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnexpectedException value)? unexpected,
    TResult? Function(NoInternetException value)? noInternet,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ForbiddenException value)? forbidden,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(CacheException value)? cache,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(ServerException value)? server,
    TResult Function(UnexpectedException value)? unexpected,
    TResult Function(NoInternetException value)? noInternet,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ForbiddenException value)? forbidden,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(ValidationException value)? validation,
    TResult Function(CacheException value)? cache,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundException extends AppException {
  const factory NotFoundException({final String? resource}) =
      _$NotFoundExceptionImpl;
  const NotFoundException._() : super._();

  String? get resource;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundExceptionImplCopyWith<_$NotFoundExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationExceptionImplCopyWith<$Res> {
  factory _$$ValidationExceptionImplCopyWith(_$ValidationExceptionImpl value,
          $Res Function(_$ValidationExceptionImpl) then) =
      __$$ValidationExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, Map<String, dynamic>? errors});
}

/// @nodoc
class __$$ValidationExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$ValidationExceptionImpl>
    implements _$$ValidationExceptionImplCopyWith<$Res> {
  __$$ValidationExceptionImplCopyWithImpl(_$ValidationExceptionImpl _value,
      $Res Function(_$ValidationExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? errors = freezed,
  }) {
    return _then(_$ValidationExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$ValidationExceptionImpl extends ValidationException {
  const _$ValidationExceptionImpl(
      {required this.message, final Map<String, dynamic>? errors})
      : _errors = errors,
        super._();

  @override
  final String message;
  final Map<String, dynamic>? _errors;
  @override
  Map<String, dynamic>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AppException.validation(message: $message, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_errors));

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationExceptionImplCopyWith<_$ValidationExceptionImpl> get copyWith =>
      __$$ValidationExceptionImplCopyWithImpl<_$ValidationExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? message, int? statusCode, String? stackTrace)
        network,
    required TResult Function(
            String message, int? statusCode, String? stackTrace)
        server,
    required TResult Function(String? message, String? stackTrace) unexpected,
    required TResult Function() noInternet,
    required TResult Function() timeout,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String? resource) notFound,
    required TResult Function(String message, Map<String, dynamic>? errors)
        validation,
    required TResult Function(String message) cache,
  }) {
    return validation(message, errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult? Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult? Function(String? message, String? stackTrace)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? timeout,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String message, Map<String, dynamic>? errors)? validation,
    TResult? Function(String message)? cache,
  }) {
    return validation?.call(message, errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult Function(String? message, String? stackTrace)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? timeout,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String? resource)? notFound,
    TResult Function(String message, Map<String, dynamic>? errors)? validation,
    TResult Function(String message)? cache,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message, errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(ServerException value) server,
    required TResult Function(UnexpectedException value) unexpected,
    required TResult Function(NoInternetException value) noInternet,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ForbiddenException value) forbidden,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(ValidationException value) validation,
    required TResult Function(CacheException value) cache,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnexpectedException value)? unexpected,
    TResult? Function(NoInternetException value)? noInternet,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ForbiddenException value)? forbidden,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(CacheException value)? cache,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(ServerException value)? server,
    TResult Function(UnexpectedException value)? unexpected,
    TResult Function(NoInternetException value)? noInternet,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ForbiddenException value)? forbidden,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(ValidationException value)? validation,
    TResult Function(CacheException value)? cache,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationException extends AppException {
  const factory ValidationException(
      {required final String message,
      final Map<String, dynamic>? errors}) = _$ValidationExceptionImpl;
  const ValidationException._() : super._();

  String get message;
  Map<String, dynamic>? get errors;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationExceptionImplCopyWith<_$ValidationExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CacheExceptionImplCopyWith<$Res> {
  factory _$$CacheExceptionImplCopyWith(_$CacheExceptionImpl value,
          $Res Function(_$CacheExceptionImpl) then) =
      __$$CacheExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CacheExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$CacheExceptionImpl>
    implements _$$CacheExceptionImplCopyWith<$Res> {
  __$$CacheExceptionImplCopyWithImpl(
      _$CacheExceptionImpl _value, $Res Function(_$CacheExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CacheExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CacheExceptionImpl extends CacheException {
  const _$CacheExceptionImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'AppException.cache(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheExceptionImplCopyWith<_$CacheExceptionImpl> get copyWith =>
      __$$CacheExceptionImplCopyWithImpl<_$CacheExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? message, int? statusCode, String? stackTrace)
        network,
    required TResult Function(
            String message, int? statusCode, String? stackTrace)
        server,
    required TResult Function(String? message, String? stackTrace) unexpected,
    required TResult Function() noInternet,
    required TResult Function() timeout,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String? resource) notFound,
    required TResult Function(String message, Map<String, dynamic>? errors)
        validation,
    required TResult Function(String message) cache,
  }) {
    return cache(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult? Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult? Function(String? message, String? stackTrace)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? timeout,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String message, Map<String, dynamic>? errors)? validation,
    TResult? Function(String message)? cache,
  }) {
    return cache?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, int? statusCode, String? stackTrace)?
        network,
    TResult Function(String message, int? statusCode, String? stackTrace)?
        server,
    TResult Function(String? message, String? stackTrace)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? timeout,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String? resource)? notFound,
    TResult Function(String message, Map<String, dynamic>? errors)? validation,
    TResult Function(String message)? cache,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(ServerException value) server,
    required TResult Function(UnexpectedException value) unexpected,
    required TResult Function(NoInternetException value) noInternet,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(ForbiddenException value) forbidden,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(ValidationException value) validation,
    required TResult Function(CacheException value) cache,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnexpectedException value)? unexpected,
    TResult? Function(NoInternetException value)? noInternet,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(ForbiddenException value)? forbidden,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(CacheException value)? cache,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(ServerException value)? server,
    TResult Function(UnexpectedException value)? unexpected,
    TResult Function(NoInternetException value)? noInternet,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(ForbiddenException value)? forbidden,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(ValidationException value)? validation,
    TResult Function(CacheException value)? cache,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class CacheException extends AppException {
  const factory CacheException({required final String message}) =
      _$CacheExceptionImpl;
  const CacheException._() : super._();

  String get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CacheExceptionImplCopyWith<_$CacheExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

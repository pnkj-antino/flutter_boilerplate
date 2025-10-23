import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

/// Base class for all application exceptions
@freezed
class AppException with _$AppException {
  /// Private constructor for freezed
  const AppException._();

  /// Network-related error
  const factory AppException.network({
    String? message,
    int? statusCode,
    String? stackTrace,
  }) = NetworkException;

  /// Server returned an error
  const factory AppException.server({
    required String message,
    int? statusCode,
    String? stackTrace,
  }) = ServerException;

  /// Unexpected error occurred
  const factory AppException.unexpected({String? message, String? stackTrace}) =
      UnexpectedException;

  /// No internet connection
  const factory AppException.noInternet() = NoInternetException;

  /// Timeout during request
  const factory AppException.timeout() = TimeoutException;

  /// Authentication error (unauthorized)
  const factory AppException.unauthorized() = UnauthorizedException;

  /// User doesn't have permission
  const factory AppException.forbidden() = ForbiddenException;

  /// Resource not found
  const factory AppException.notFound({String? resource}) = NotFoundException;

  /// Validation error
  const factory AppException.validation({
    required String message,
    Map<String, dynamic>? errors,
  }) = ValidationException;

  /// Cache-related error
  const factory AppException.cache({required String message}) = CacheException;

  /// Convert DioException to AppException
  factory AppException.fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const AppException.timeout();

      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
        return AppException.network(
          message: exception.message,
          stackTrace: exception.stackTrace.toString(),
        );

      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode;
        final data = exception.response?.data;

        if (statusCode == 401) {
          return const AppException.unauthorized();
        } else if (statusCode == 403) {
          return const AppException.forbidden();
        } else if (statusCode == 404) {
          return const AppException.notFound();
        } else if (statusCode != null && statusCode >= 500) {
          return AppException.server(
            message: _extractErrorMessage(data) ?? 'Server error',
            statusCode: statusCode,
            stackTrace: exception.stackTrace.toString(),
          );
        } else {
          // Handle validation errors (typically 400 or 422)
          if (statusCode == 400 || statusCode == 422) {
            return AppException.validation(
              message: _extractErrorMessage(data) ?? 'Validation error',
              errors: _extractValidationErrors(data),
            );
          }

          return AppException.server(
            message: _extractErrorMessage(data) ?? 'Unknown server error',
            statusCode: statusCode,
            stackTrace: exception.stackTrace.toString(),
          );
        }

      case DioExceptionType.cancel:
        return const AppException.unexpected(message: 'Request was cancelled');

      case DioExceptionType.unknown:
        if (exception.message?.contains('SocketException') ?? false) {
          return const AppException.noInternet();
        }
        return AppException.unexpected(
          message: exception.message,
          stackTrace: exception.stackTrace.toString(),
        );
    }
  }

  /// User-friendly error message
  String get userFriendlyMessage {
    return map(
      network: (_) => 'Network error. Please check your connection.',
      server: (e) => 'Server error: ${e.message}',
      unexpected: (e) => e.message ?? 'An unexpected error occurred.',
      noInternet: (_) => 'No internet connection. Please check your network.',
      timeout: (_) => 'Request timed out. Please try again.',
      unauthorized: (_) => 'Unauthorized. Please login again.',
      forbidden: (_) => 'You don\'t have permission to access this resource.',
      notFound: (e) => '${e.resource ?? 'Resource'} not found.',
      validation: (e) => e.message,
      cache: (e) => e.message,
    );
  }

  /// Extract error message from response data
  static String? _extractErrorMessage(dynamic data) {
    if (data == null) return null;

    if (data is Map<String, dynamic>) {
      // Check common error message fields
      final possibleMessageFields = [
        'message',
        'error',
        'error_message',
        'errorMessage',
        'error_description',
        'errors',
      ];

      for (final field in possibleMessageFields) {
        final value = data[field];
        if (value is String) return value;
        if (value is Map && value['message'] is String) {
          return value['message'] as String;
        }
        if (value is List && value.isNotEmpty) {
          final firstItem = value.first;
          if (firstItem is String) return firstItem;
          if (firstItem is Map && firstItem['message'] is String) {
            return firstItem['message'] as String;
          }
        }
      }
    }

    // Default fallback
    if (data is String) return data;
    return null;
  }

  /// Extract validation errors map
  static Map<String, dynamic>? _extractValidationErrors(dynamic data) {
    if (data is Map<String, dynamic> && data.containsKey('errors')) {
      final errors = data['errors'];
      if (errors is Map<String, dynamic>) {
        return errors;
      }
    }
    return null;
  }
}

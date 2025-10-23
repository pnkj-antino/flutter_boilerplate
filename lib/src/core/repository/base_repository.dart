import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/src/core/error/app_exception.dart';
import 'package:flutter_boilerplate/src/core/error/result.dart';
import 'package:flutter_boilerplate/src/core/utils/connectivity_service.dart';

/// Base repository class that handles error management and connectivity checks
abstract class BaseRepository {
  final ConnectivityService _connectivityService;

  BaseRepository(this._connectivityService);

  /// Execute a network request with proper error handling
  ///
  /// Wraps API calls in a standardized Result class with error handling
  Future<Result<T>> safeApiCall<T>({
    required Future<T> Function() apiCall,
    String? errorMessage,
  }) async {
    try {
      // Check for internet connection
      final isConnected = await _connectivityService.checkConnectivity();
      if (!isConnected) {
        return const Result.failure(AppException.noInternet());
      }

      // Execute the API call
      final response = await apiCall();
      return Result.success(response);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('DioException: ${e.message}');
      }
      return Result.failure(AppException.fromDioException(e));
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Unexpected error: $e');
        print('Stack trace: $stackTrace');
      }
      return Result.failure(
        AppException.unexpected(
          message: errorMessage ?? e.toString(),
          stackTrace: stackTrace.toString(),
        ),
      );
    }
  }

  /// Execute a database operation with proper error handling
  Future<Result<T>> safeDbCall<T>({
    required Future<T> Function() dbCall,
    String? errorMessage,
  }) async {
    try {
      final result = await dbCall();
      return Result.success(result);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Database error: $e');
        print('Stack trace: $stackTrace');
      }
      return Result.failure(
        AppException.cache(
          message: errorMessage ?? 'Database error: ${e.toString()}',
        ),
      );
    }
  }
}

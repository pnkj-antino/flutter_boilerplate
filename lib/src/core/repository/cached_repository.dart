import 'package:flutter_boilerplate/src/core/database/database_service.dart';
import 'package:flutter_boilerplate/src/core/error/result.dart';
import 'package:flutter_boilerplate/src/core/repository/base_repository.dart';
import 'package:flutter_boilerplate/src/core/utils/connectivity_service.dart';

/// Repository that implements caching for network requests
abstract class CachedRepository extends BaseRepository {
  final DatabaseService _databaseService;

  CachedRepository({
    required ConnectivityService connectivityService,
    required DatabaseService databaseService,
  }) : _databaseService = databaseService,
       super(connectivityService);

  /// Fetch data with cache support
  ///
  /// This method will:
  /// 1. Try to get the data from the cache first
  /// 2. If not in cache or expired, fetch from network
  /// 3. Cache the network response
  Future<Result<T>> fetchWithCache<T>({
    required String cacheKey,
    required Future<T> Function() networkCall,
    required T Function(Map<String, dynamic> data) fromJson,
    required Map<String, dynamic> Function(T data) toJson,
    required Duration cacheDuration,
    bool forceRefresh = false,
  }) async {
    // Skip cache if force refresh is requested
    if (!forceRefresh) {
      // Try to get from cache first
      final cachedData = _databaseService.getCachedObject(cacheKey);

      if (cachedData != null) {
        try {
          final result = fromJson(cachedData);
          return Result.success(result);
        } catch (e) {
          // If parsing fails, continue to network request
        }
      }
    }

    // If not in cache or forced refresh, get from network
    final networkResult = await safeApiCall(
      apiCall: networkCall,
      errorMessage: 'Failed to fetch data',
    );

    // If network call was successful, cache the response
    if (networkResult.isSuccess) {
      final data = networkResult.data;
      try {
        await _databaseService.cacheObject(
          key: cacheKey,
          data: toJson(data),
          expiration: cacheDuration,
        );
      } catch (e) {
        // Just log the error, don't fail the request
        // The request succeeded even if caching failed
      }
    }

    return networkResult;
  }

  /// Clear a specific cache entry
  Future<void> clearCache(String cacheKey) async {
    await _databaseService.removeCachedObject(cacheKey);
  }

  /// Clear all cached data
  Future<void> clearAllCache() async {
    await _databaseService.clearCache();
  }
}

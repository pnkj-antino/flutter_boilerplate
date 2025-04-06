import 'dart:convert';

import 'package:flutter_boilerplate/src/core/api/api_config.dart';
import 'package:flutter_boilerplate/src/core/api/api_service.dart';
import 'package:flutter_boilerplate/src/core/error/app_exception.dart';
import 'package:flutter_boilerplate/src/core/error/result.dart';
import 'package:flutter_boilerplate/src/core/models/auth_response.dart';
import 'package:flutter_boilerplate/src/core/models/user.dart';
import 'package:flutter_boilerplate/src/core/repository/cached_repository.dart';
import 'package:flutter_boilerplate/src/core/utils/shared_prefs.dart';

/// Repository for authentication related operations
class AuthRepository extends CachedRepository {
  final ApiService _apiService;
  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userKey = 'user_data';
  static const String _userCacheKey = 'cached_user';

  AuthRepository({
    required ApiService apiService,
    required super.connectivityService,
    required super.databaseService,
  }) : _apiService = apiService;

  /// Login with email and password
  Future<Result<AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    return safeApiCall(
      apiCall: () async {
        final response = await _apiService.post(
          ApiEndpoints.login,
          data: {
            'email': email,
            'password': password,
          },
        );

        final authResponse = AuthResponse.fromJson(response);

        // Save auth data locally
        await _saveAuthData(authResponse);

        return authResponse;
      },
      errorMessage: 'Failed to login. Please check your credentials.',
    );
  }

  /// Register a new user
  Future<Result<AuthResponse>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    return safeApiCall(
      apiCall: () async {
        final response = await _apiService.post(
          ApiEndpoints.register,
          data: {
            'name': name,
            'email': email,
            'password': password,
          },
        );

        final authResponse = AuthResponse.fromJson(response);

        // Save auth data locally
        await _saveAuthData(authResponse);

        return authResponse;
      },
      errorMessage: 'Failed to register. Please try again.',
    );
  }

  /// Logout the current user
  Future<Result<bool>> logout() async {
    return safeDbCall(
      dbCall: () async {
        await SharedPrefs.remove(_tokenKey);
        await SharedPrefs.remove(_refreshTokenKey);
        await SharedPrefs.remove(_userKey);
        return true;
      },
      errorMessage: 'Failed to logout. Please try again.',
    );
  }

  /// Refresh the access token
  Future<Result<AuthResponse>> refreshToken() async {
    final refreshToken = SharedPrefs.getString(_refreshTokenKey);

    if (refreshToken == null) {
      await logout();
      return const Result.failure(AppException.unauthorized());
    }

    return safeApiCall(
      apiCall: () async {
        final response = await _apiService.post(
          ApiEndpoints.refreshToken,
          data: {
            'refresh_token': refreshToken,
          },
        );

        final authResponse = AuthResponse.fromJson(response);

        // Save auth data locally
        await _saveAuthData(authResponse);

        return authResponse;
      },
      errorMessage: 'Failed to refresh token. Please login again.',
    );
  }

  /// Get the current authenticated user
  Future<Result<User?>> getCurrentUser() async {
    final authToken = getAuthToken();

    // If no token, return null
    if (authToken == null) {
      return const Result.success(null);
    }

    // First try to get from SharedPrefs (for backward compatibility)
    final userData = SharedPrefs.getString(_userKey);
    if (userData != null) {
      try {
        final user =
            User.fromJson(jsonDecode(userData) as Map<String, dynamic>);
        return Result.success(user);
      } catch (e) {
        // If parsing fails, continue to cached version
      }
    }

    // Try to get from API with caching
    return fetchWithCache<User?>(
      cacheKey: _userCacheKey,
      networkCall: () async {
        final response = await _apiService.get(ApiEndpoints.userProfile);
        return User.fromJson(response);
      },
      fromJson: (data) => data.isEmpty ? null : User.fromJson(data),
      toJson: (user) => user?.toJson() ?? {},
      cacheDuration: const Duration(days: 1),
    );
  }

  /// Check if a user is logged in
  Future<bool> isLoggedIn() async {
    await SharedPrefs.init();
    return SharedPrefs.containsKey(_tokenKey) &&
        SharedPrefs.containsKey(_refreshTokenKey);
  }

  /// Get the current auth token
  String? getAuthToken() {
    return SharedPrefs.getString(_tokenKey);
  }

  /// Save authentication data locally
  Future<void> _saveAuthData(AuthResponse authResponse) async {
    await SharedPrefs.init();
    await SharedPrefs.setString(_tokenKey, authResponse.accessToken);
    await SharedPrefs.setString(_refreshTokenKey, authResponse.refreshToken);
    await SharedPrefs.setString(
        _userKey, jsonEncode(authResponse.user.toJson()));
  }
}

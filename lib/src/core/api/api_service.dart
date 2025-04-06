import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/src/core/api/dio_client.dart';

/// Service to handle API requests
class ApiService {
  final DioClient _dioClient;

  ApiService(this._dioClient);

  /// Generic GET request
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dioClient.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
      
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  /// Generic POST request
  Future<dynamic> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dioClient.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  /// Generic PUT request
  Future<dynamic> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dioClient.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  /// Generic DELETE request
  Future<dynamic> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dioClient.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  /// Generic PATCH request
  Future<dynamic> patch(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dioClient.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
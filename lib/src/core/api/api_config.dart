/// API configuration for the application
class ApiConfig {
  /// Base URL for the API
  static const String baseUrl = 'https://api.example.com';
  
  /// API version
  static const String apiVersion = 'v1';
  
  /// Full API URL with version
  static String get fullUrl => '$baseUrl/$apiVersion';
  
  /// Timeout duration in seconds
  static const int timeoutDuration = 30;
}

/// API endpoints
class ApiEndpoints {
  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh-token';
  
  // User endpoints
  static const String userProfile = '/user/profile';
  static const String updateProfile = '/user/profile';
  
  // Example endpoints
  static const String getItems = '/items';
  static const String getItemDetails = '/items/{id}';
}
import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/src/core/error/app_exception.dart';
import 'package:flutter_boilerplate/src/core/models/user.dart';

/// Auth states
enum AuthStatus {
  /// Initial state
  initial,
  
  /// Loading authentication
  loading,
  
  /// User is authenticated
  authenticated,
  
  /// User is not authenticated
  unauthenticated,
  
  /// Authentication failed
  error,
}

/// Authentication state
class AuthState extends Equatable {
  /// Current auth status
  final AuthStatus status;
  
  /// Currently authenticated user
  final User? user;
  
  /// Error message if auth failed
  final AppException? error;
  
  /// Is currently loading
  bool get isLoading => status == AuthStatus.loading;
  
  /// Is authenticated
  bool get isAuthenticated => status == AuthStatus.authenticated;
  
  /// Is not authenticated
  bool get isUnauthenticated => status == AuthStatus.unauthenticated;
  
  /// Is in error state
  bool get isError => status == AuthStatus.error;

  /// Constructor
  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.error,
  });

  /// Initial state
  factory AuthState.initial() => const AuthState();
  
  /// Loading state
  factory AuthState.loading() => const AuthState(status: AuthStatus.loading);
  
  /// Authenticated state
  factory AuthState.authenticated(User user) => AuthState(
    status: AuthStatus.authenticated,
    user: user,
  );
  
  /// Unauthenticated state
  factory AuthState.unauthenticated() => const AuthState(
    status: AuthStatus.unauthenticated,
  );
  
  /// Error state
  factory AuthState.error(AppException error) => AuthState(
    status: AuthStatus.error,
    error: error,
  );
  
  /// Copy with new values
  AuthState copyWith({
    AuthStatus? status,
    User? user,
    AppException? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
  
  @override
  List<Object?> get props => [status, user, error];
}
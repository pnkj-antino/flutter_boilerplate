import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/src/core/error/app_exception.dart';
import 'package:flutter_boilerplate/src/core/models/user.dart';

/// Authentication state
class AuthState extends Equatable {
  /// Is loading
  final bool isLoading;
  
  /// Currently authenticated user
  final User? user;
  
  /// Error if auth failed
  final AppException? error;
  
  /// Is authenticated
  bool get isAuthenticated => user != null && !isLoading && error == null;
  
  /// Is not authenticated
  bool get isUnauthenticated => user == null && !isLoading && error == null;
  
  /// Constructor
  const AuthState({
    this.isLoading = false,
    this.user,
    this.error,
  });

  /// Initial state
  factory AuthState.initial() => const AuthState();
  
  /// Copy with new values
  AuthState copyWith({
    bool? isLoading,
    User? user,
    AppException? error,
    bool clearUser = false,
    bool clearError = false,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: clearUser ? null : (user ?? this.user),
      error: clearError ? null : (error ?? this.error),
    );
  }
  
  @override
  List<Object?> get props => [isLoading, user, error];
}
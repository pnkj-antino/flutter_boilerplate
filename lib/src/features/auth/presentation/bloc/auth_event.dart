import 'package:equatable/equatable.dart';

/// Base class for authentication events
abstract class AuthEvent extends Equatable {
  const AuthEvent();
  
  @override
  List<Object?> get props => [];
}

/// Initialize authentication
class AuthInitialize extends AuthEvent {
  const AuthInitialize();
}

/// Login with email and password
class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  
  const AuthLoginRequested({
    required this.email,
    required this.password,
  });
  
  @override
  List<Object> get props => [email, password];
}

/// Register a new user
class AuthRegisterRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;
  
  const AuthRegisterRequested({
    required this.name,
    required this.email,
    required this.password,
  });
  
  @override
  List<Object> get props => [name, email, password];
}

/// Logout
class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested();
}

/// Get current user
class AuthGetCurrentUserRequested extends AuthEvent {
  const AuthGetCurrentUserRequested();
}

/// Refresh token
class AuthRefreshTokenRequested extends AuthEvent {
  const AuthRefreshTokenRequested();
}
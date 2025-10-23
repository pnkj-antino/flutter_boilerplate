import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/src/features/auth/data/auth_repository.dart';
import 'package:flutter_boilerplate/src/features/auth/presentation/cubit/auth_state.dart';

/// Cubit for authentication
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  /// Constructor
  AuthCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(AuthState.initial());

  /// Initialize authentication state
  Future<void> initialize() async {
    emit(state.copyWith(isLoading: true, clearError: true));

    final isLoggedIn = await _authRepository.isLoggedIn();

    if (isLoggedIn) {
      final result = await _authRepository.getCurrentUser();

      result.when(
        success: (user) {
          if (user != null) {
            emit(state.copyWith(isLoading: false, user: user));
          } else {
            emit(state.copyWith(isLoading: false, clearUser: true));
          }
        },
        failure: (exception) {
          emit(state.copyWith(isLoading: false, clearUser: true));
        },
      );
    } else {
      emit(state.copyWith(isLoading: false, clearUser: true));
    }
  }

  /// Login with email and password
  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true, clearError: true));

    final result = await _authRepository.login(
      email: email,
      password: password,
    );

    result.when(
      success: (authResponse) {
        emit(state.copyWith(isLoading: false, user: authResponse.user));
      },
      failure: (exception) {
        emit(state.copyWith(isLoading: false, error: exception));
      },
    );
  }

  /// Register a new user
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true, clearError: true));

    final result = await _authRepository.register(
      name: name,
      email: email,
      password: password,
    );

    result.when(
      success: (authResponse) {
        emit(state.copyWith(isLoading: false, user: authResponse.user));
      },
      failure: (exception) {
        emit(state.copyWith(isLoading: false, error: exception));
      },
    );
  }

  /// Logout
  Future<void> logout() async {
    emit(state.copyWith(isLoading: true, clearError: true));

    final result = await _authRepository.logout();

    result.when(
      success: (_) {
        emit(state.copyWith(isLoading: false, clearUser: true));
      },
      failure: (exception) {
        emit(state.copyWith(isLoading: false, error: exception));
      },
    );
  }

  /// Get current user
  Future<void> getCurrentUser() async {
    emit(state.copyWith(isLoading: true, clearError: true));

    final result = await _authRepository.getCurrentUser();

    result.when(
      success: (user) {
        if (user != null) {
          emit(state.copyWith(isLoading: false, user: user));
        } else {
          emit(state.copyWith(isLoading: false, clearUser: true));
        }
      },
      failure: (exception) {
        emit(state.copyWith(isLoading: false, error: exception));
      },
    );
  }

  /// Refresh token
  Future<void> refreshToken() async {
    // Don't show loading indicator for token refresh
    final result = await _authRepository.refreshToken();

    result.when(
      success: (authResponse) {
        emit(state.copyWith(user: authResponse.user, clearError: true));
      },
      failure: (exception) {
        // If token refresh fails with unauthorized, log the user out
        if (exception.userFriendlyMessage.contains('Unauthorized')) {
          emit(state.copyWith(clearUser: true));
        }
      },
    );
  }

  /// Clear any error
  void clearError() {
    emit(state.copyWith(clearError: true));
  }
}

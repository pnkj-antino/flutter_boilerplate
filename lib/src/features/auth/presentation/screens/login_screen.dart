import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_boilerplate/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_boilerplate/src/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_boilerplate/src/features/auth/presentation/widgets/auth_form.dart';

/// Login screen
class LoginScreen extends StatelessWidget {
  /// Route name
  static const String routeName = '/login';

  /// Constructor
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // Handle auth state changes
          if (state.isAuthenticated) {
            // Navigate to home when authenticated
            context.go('/');
          }
          
          // Show error snackbar if needed
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!.userFriendlyMessage),
                backgroundColor: Colors.red,
              ),
            );
            
            // Clear the error
            context.read<AuthCubit>().clearError();
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.lock_outline,
                      size: 80,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Welcome Back',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to continue',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    // Login form
                    AuthForm(
                      isLogin: true,
                      isLoading: state.isLoading,
                      onSubmit: (email, password, name) {
                        context.read<AuthCubit>().login(
                          email: email,
                          password: password,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: state.isLoading
                          ? null
                          : () => context.push('/register'),
                      child: const Text('Don\'t have an account? Sign up'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
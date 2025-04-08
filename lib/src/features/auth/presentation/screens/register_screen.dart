import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_boilerplate/src/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_boilerplate/src/features/auth/presentation/widgets/auth_form.dart';
import 'package:go_router/go_router.dart';

/// Registration screen
class RegisterScreen extends StatelessWidget {
  /// Route name
  static const String routeName = '/register';

  /// Constructor
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
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
                      Icons.person_add_outlined,
                      size: 80,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Create Account',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign up to get started',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    // Registration form
                    AuthForm(
                      isLogin: false,
                      isLoading: state.isLoading,
                      onSubmit: (email, password, name) {
                        context.read<AuthCubit>().register(
                              name: name!,
                              email: email,
                              password: password,
                            );
                      },
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: state.isLoading ? null : () => context.pop(),
                      child: const Text('Already have an account? Sign in'),
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

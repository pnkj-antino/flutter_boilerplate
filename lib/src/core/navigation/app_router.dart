import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_boilerplate/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_boilerplate/src/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_boilerplate/src/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter_boilerplate/src/features/home/home_screen.dart';
import 'package:flutter_boilerplate/src/settings/settings_controller.dart';
import 'package:flutter_boilerplate/src/settings/settings_view.dart';

/// Application router using GoRouter for navigation
class AppRouter {
  final SettingsController settingsController;
  final AuthCubit authCubit;

  AppRouter({
    required this.settingsController,
    required this.authCubit,
  });

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    redirect: (context, state) {
      final isAuthenticated = authCubit.state.isAuthenticated;
      final isAuthRoute = state.matchedLocation == LoginScreen.routeName || 
                          state.matchedLocation == RegisterScreen.routeName;
      
      // If not authenticated and not on an auth route, redirect to login
      if (!isAuthenticated && !isAuthRoute) {
        return LoginScreen.routeName;
      }
      
      // If authenticated and on an auth route, redirect to home
      if (isAuthenticated && isAuthRoute) {
        return '/';
      }
      
      // No redirection needed
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    routes: [
      // Auth routes
      GoRoute(
        path: LoginScreen.routeName,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RegisterScreen.routeName,
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      
      // App routes
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'settings',
            name: 'settings',
            builder: (context, state) => SettingsView(
              controller: settingsController,
            ),
          ),
          GoRoute(
            path: 'details/:id',
            name: 'details',
            builder: (context, state) {
              final id = state.pathParameters['id'] ?? '';
              return DetailScreen(id: id);
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(state.error),
  );
}

/// Helper class to convert a Stream to a Listenable for GoRouter
class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

/// Error Screen shown when a route is not found
class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            const SizedBox(height: 16),
            Text(
              'Route not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (error != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(error.toString()),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Detail Screen (placeholder)
class DetailScreen extends StatelessWidget {
  final String id;

  const DetailScreen({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Item Details',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'ID: $id',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
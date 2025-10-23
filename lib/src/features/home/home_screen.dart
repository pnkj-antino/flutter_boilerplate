import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_boilerplate/src/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_boilerplate/src/localization/app_localizations.dart';
import 'package:go_router/go_router.dart';

/// Home screen of the application
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final userName = state.user?.name ?? 'User';

        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.appTitle),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Settings',
                onPressed: () => context.pushNamed('settings'),
              ),
              IconButton(
                icon: const Icon(Icons.logout),
                tooltip: 'Logout',
                onPressed: () => _showLogoutDialog(context),
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/flutter_logo.png'),
                  width: 100,
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.helloWorld,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.helloUser(userName),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 48),
                _buildSampleItems(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('LOGOUT'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      context.read<AuthCubit>().logout();
    }
  }

  Widget _buildSampleItems(BuildContext context) {
    final items = List.generate(
      3,
      (index) => ListTile(
        leading: const Icon(Icons.info),
        title: Text('Item ${index + 1}'),
        subtitle: Text('Tap to see details for item ${index + 1}'),
        onTap: () => context.pushNamed(
          'details',
          pathParameters: {'id': '${index + 1}'},
        ),
      ),
    );

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Sample Items',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const Divider(),
            ...items,
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

/// Service to monitor and check network connectivity
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final ValueNotifier<bool> isConnected = ValueNotifier<bool>(true);

  ConnectivityService() {
    _initConnectivity();
    _setupConnectivityListener();
  }

  /// Initialize connectivity checking
  Future<void> _initConnectivity() async {
    try {
      final List<ConnectivityResult> connectivityResults = await _connectivity
          .checkConnectivity();
      _updateConnectionStatus(connectivityResults);
    } catch (e) {
      if (kDebugMode) {
        print('Connectivity check failed: $e');
      }
      isConnected.value = false;
    }
  }

  /// Setup listener for connectivity changes
  void _setupConnectivityListener() {
    _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      _updateConnectionStatus(results);
    });
  }

  /// Update connection status based on connectivity results
  void _updateConnectionStatus(List<ConnectivityResult> results) {
    // We're connected if any result is not "none"
    isConnected.value = results.any(
      (result) => result != ConnectivityResult.none,
    );
  }

  /// Check if device is currently connected to the network
  Future<bool> checkConnectivity() async {
    final List<ConnectivityResult> connectivityResults = await _connectivity
        .checkConnectivity();
    return connectivityResults.any(
      (result) => result != ConnectivityResult.none,
    );
  }
}

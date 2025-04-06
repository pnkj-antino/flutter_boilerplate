import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/src/core/error/crash_reporting_service.dart';

/// A widget that catches errors in its child widget subtree and displays a fallback UI.
class ErrorBoundaryWidget extends StatefulWidget {
  /// The child widget that might throw errors
  final Widget child;
  
  /// Fallback widget to show when an error occurs
  final Widget? fallbackWidget;
  
  /// Whether to allow retrying the child widget
  final bool allowRetry;

  /// Constructor
  const ErrorBoundaryWidget({
    super.key,
    required this.child,
    this.fallbackWidget,
    this.allowRetry = true,
  });

  @override
  State<ErrorBoundaryWidget> createState() => _ErrorBoundaryWidgetState();
}

class _ErrorBoundaryWidgetState extends State<ErrorBoundaryWidget> {
  bool _hasError = false;
  dynamic _error;
  StackTrace? _stackTrace;

  @override
  void initState() {
    super.initState();
    _hasError = false;
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      // Report the error to the crash reporting service
      try {
        final crashReportingService = 
            context.read<CrashReportingService>();
        
        crashReportingService.logError(
          _error,
          _stackTrace ?? StackTrace.current,
          reason: 'UI Error Boundary caught an error',
          information: {
            'widget': widget.runtimeType.toString(),
            'errorType': _error.runtimeType.toString(),
          },
        );
      } catch (e) {
        // Fallback silently if crash reporting is not available
        if (kDebugMode) {
          print('Could not report error: $e');
        }
      }
      
      // Use custom fallback or default error widget
      return widget.fallbackWidget ?? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 48,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Something went wrong',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (kDebugMode) ...[
                  const SizedBox(height: 8),
                  Text(
                    _error.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if (widget.allowRetry) ...[
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _hasError = false;
                      });
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    }

    // If no error, render the child widget inside an error catcher
    return ErrorCatcher(
      onError: (error, stackTrace) {
        if (mounted) {
          setState(() {
            _hasError = true;
            _error = error;
            _stackTrace = stackTrace;
          });
        }
      },
      child: widget.child,
    );
  }
}

/// Widget that catches errors in its child and reports them
class ErrorCatcher extends StatefulWidget {
  /// The child widget that might throw errors
  final Widget child;
  
  /// Callback when an error occurs
  final void Function(dynamic error, StackTrace stackTrace) onError;

  /// Constructor
  const ErrorCatcher({
    super.key,
    required this.child,
    required this.onError,
  });

  @override
  State<ErrorCatcher> createState() => _ErrorCatcherState();
}

class _ErrorCatcherState extends State<ErrorCatcher> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    
    // Register the global error handler
    final originalOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {
      widget.onError(details.exception, details.stack ?? StackTrace.current);
      // Pass to original handler
      if (originalOnError != null) {
        originalOnError(details);
      }
    };
  }
}
import 'package:flutter/material.dart';

import '../../domain/entities/app_error.dart';
import '../theme/theme.dart';
import 'error_with_entity.dart';
import 'loading_widget.dart';

class NetworkResource extends StatelessWidget {
  const NetworkResource({
    super.key,
    required this.retry,
    required this.appError,
    required this.child,
    this.loadingWidget,
    required this.loading,
  });

  final VoidCallback retry;
  final AppError? appError;
  final Widget? child;
  final Widget? loadingWidget;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
          switchInCurve: Curves.ease,
          switchOutCurve: Curves.ease,
          duration: defaultAnimationDuration,
          child: loading
              ? loadingWidget ?? const LoadingWidgetBounce()
              : appError != null
                  ? ErrorWithRetry(
                      appError: appError!,
                      retry: retry,
                    )
                  : child!),
    );
  }
}

import 'package:flutter/material.dart';
import 'loading_widget.dart';

class PaginationIndicator extends StatelessWidget {
  const PaginationIndicator(
      {super.key, required this.isLoading, required this.moreItemsAvailable});

  final bool isLoading;
  final bool moreItemsAvailable;

  @override
  Widget build(BuildContext context) {
    return !moreItemsAvailable
        ? const SizedBox.shrink()
        : isLoading
            ? const LoadingWidgetBounce()
            : const SizedBox(
                width: 0,
                height: 0,
              );
  }
}

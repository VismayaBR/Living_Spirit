import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme/theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.color = whiteColor,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      color: color,
      size: defaultPadding * 1.5,
      lineWidth: defaultPadding / 4,
    );
  }
}

class LoadingWidgetBounce extends StatelessWidget {
  const LoadingWidgetBounce({
    super.key,
    this.color = primaryColor,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(color: color);
  }
}

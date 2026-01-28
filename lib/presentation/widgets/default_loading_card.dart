import 'package:flutter/widgets.dart';

import '../theme/theme.dart';
import 'skelton.dart';

class DefaultLoadingCard extends StatelessWidget {
  const DefaultLoadingCard({
    super.key,
    this.width,
    this.height,
    this.borderRadius = defaultPadding * .5,
    this.baseColor = brownColor,
    this.highlightColor = brownColor,
  });

  final double? width;
  final double? height;
  final double borderRadius;
  final Color baseColor;
  final Color highlightColor;

  @override
  Widget build(BuildContext context) {
    return Skelton(
      borderRadius: borderRadius,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(defaultPadding * .35),
      ),
    );
  }
}

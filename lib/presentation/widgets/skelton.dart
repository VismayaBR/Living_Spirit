import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/theme.dart';

class Skelton extends StatelessWidget {
  const Skelton(
      {super.key,
      this.width,
      this.height,
      this.borderRadius = defaultPadding * .5,
      this.baseColor = brownColor,
      this.highlightColor = brownColor,
      this.child});

  final double? width;
  final double? height;
  final double borderRadius;
  final Widget? child;
  final Color baseColor;
  final Color highlightColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Shimmer.fromColors(
            baseColor: baseColor.withOpacity(.4),
            highlightColor: highlightColor.withOpacity(.8),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: whiteColor),
              child: child,
            )),
      ],
    );
  }
}

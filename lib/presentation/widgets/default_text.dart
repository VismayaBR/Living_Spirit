import 'package:flutter/material.dart';

import '../theme/theme.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(
      {super.key,
      required this.title,
      this.color = blackColor,
      this.fontSize = defaultPadding * .6,
      this.isBold = false,
      this.isWordHieght = false,
      this.isCenter = false,
      this.fontFamily="Poppins-Bold",
      this.maxLine,
      this.wordHeight});

  final String title;
  final Color color;
  final double fontSize;
  final bool isBold;
  final bool isWordHieght;
  final bool isCenter;
  final int? maxLine;
  final String fontFamily;
  final double? wordHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: isCenter ? TextAlign.center : null,
      maxLines: maxLine,
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: color,
          fontSize: fontSize,
          height: isWordHieght ? 1.5 : wordHeight,
          fontFamily: fontFamily,
          letterSpacing: 0,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}

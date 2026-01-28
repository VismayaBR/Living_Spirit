import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultIconButton extends StatelessWidget {
  const DefaultIconButton({
    super.key,
    required this.imageUrl,
    this.size,
    required this.onTap,
  });

  final String imageUrl;
  final double? size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        imageUrl,
        width: size,
        height: size,
      ),
    );
  }
}

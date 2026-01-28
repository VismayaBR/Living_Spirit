import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:livingspirit/domain/entities/brand_entity.dart';
import 'package:livingspirit/utils/formater.dart';
import '../../../theme/theme.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    super.key,
    required this.brandEntity,
    required this.isSelected,
    required this.onTap,
  });

  final BrandEntity brandEntity;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
  final shortestSide = size.shortestSide;
  final isTablet = shortestSide >= 600;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isTablet ? shortestSide * 0.3 : shortestSide * 0.25,
      height: isTablet ? shortestSide * 0.3 : shortestSide * 0.4,
        decoration: BoxDecoration(
          color: whiteColor,
          // borderRadius: BorderRadius.circular(defaultPadding * 4),
        ),
        child: Column(
          children: [
            Container(
             width: isTablet ? shortestSide * 0.25 : shortestSide * 0.3,
            height: isTablet ? shortestSide * 0.25 : shortestSide * 0.25,
              padding: const EdgeInsets.all(defaultPadding * .5),
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(
                  color: isSelected ? primaryColor : borderColor,
                  width: isSelected ? 3 : 1,
                ),
                borderRadius: BorderRadius.circular(defaultPadding * .3),
              ),
              child: CachedNetworkImage(
                width: defaultPadding * 4,
                height: defaultPadding * 4,
                imageUrl: brandEntity.brandImage!,
                fit: BoxFit.contain,
                errorWidget: (context, url, error) => ClipRRect(
                  borderRadius: BorderRadius.circular(defaultPadding * .5),
                  child: Image.asset("assets/brand.png"),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding * .25),
            Text(
              brandEntity.brandName,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: blackColor,
                fontSize: isTab() ? defaultPadding * 1.2 : defaultPadding * .7,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

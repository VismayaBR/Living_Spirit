// ignore_for_file: use_super_parameters

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:livingspirit/utils/debug_utils.dart';

import '../../../../domain/entities/banner_entity.dart';
import '../../../theme/theme.dart';

class HomeBannerItem extends StatelessWidget {
  const HomeBannerItem({Key? key, required this.item}) : super(key: key);
  final BannerEntity item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        consoleLog("bannerClick");
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(defaultPadding),
          child: CachedNetworkImage(
            imageUrl: item.imageUrl,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Image.asset(
              "assets/app_logo.png",
            ),
          ),
        ),
      ),
    );
  }
}

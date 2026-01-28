import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:livingspirit/domain/entities/banner_entity.dart';

import '../../../theme/theme.dart';

class DetailsBannerItem extends StatelessWidget {
  const DetailsBannerItem({super.key, required this.item});

  final BannerEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .3,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(defaultPadding * .5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            width: MediaQuery.of(context).size.width * .6,
            imageUrl: item.imageUrl,
            fit: BoxFit.contain,
            errorWidget: (context, url, error) => ClipRRect(
              borderRadius: BorderRadius.circular(defaultPadding * .5),
              child: Image.asset("assets/ic_no_image.png"),
            ),
          ),
        ],
      ),
    );
  }
}

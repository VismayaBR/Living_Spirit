
// ignore_for_file: library_private_types_in_public_api

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:livingspirit/presentation/screens/product_details_screen/components/details_banner_item.dart';
import '../../../../domain/entities/banner_entity.dart';
import '../../../theme/theme.dart';

class ProductDeatailsCarouselPage extends StatefulWidget {
  final List<BannerEntity> items;
  final List<String> image_360s;

  const ProductDeatailsCarouselPage({
    Key? key,
    required this.items,
    required this.image_360s,
  }) : super(key: key);

  @override
  _ProductDeatailsCarouselPageState createState() =>
      _ProductDeatailsCarouselPageState();
}

class _ProductDeatailsCarouselPageState
    extends State<ProductDeatailsCarouselPage> {
  int activeIndex = 0;

  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.45,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          if (widget.items.isEmpty)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.circular(defaultPadding * .5),
              ),
            ),
          CarouselSlider(
            options: CarouselOptions(
              height: screenHeight * 0.45,
              onPageChanged: (index, reason) => setActiveDot(index),
              autoPlay: false,
              autoPlayCurve: Curves.ease,
              autoPlayAnimationDuration: const Duration(seconds: 5),
              viewportFraction: 1,
            ),
            items: widget.items
                .map((item) => DetailsBannerItem(item: item))
                .toList(),
          ),
          Positioned(
            left: defaultPadding * .8,
            bottom: defaultPadding * .8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * .7,
                vertical: defaultPadding * .2,
              ),
              decoration: BoxDecoration(
                color: widget.items.isEmpty
                    ? whiteColor
                    : blackColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(defaultPadding),
              ),
              child: Text(
                "${activeIndex + 1}/${widget.items.length}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: defaultPadding * .5,
                  color: blackColor,
                ),
              ),
            ),
          ),
          // if (widget.image_360s.isNotEmpty)
          //   Positioned(
          //     right: defaultPadding * .8,
          //     bottom: defaultPadding * .4,
          //     child: GestureDetector(
          //       onTap: () {
          //         Get.toNamed(
          //           RouteList.product360View,
          //           arguments: widget.image_360s,
          //         );
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //           color: Colors.transparent,
          //           borderRadius: BorderRadius.circular(defaultPadding),
          //         ),
          //         child: SvgPicture.asset(
          //           "assets/ic_360.svg",
          //           width: MediaQuery.of(context).size.width * .1,
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
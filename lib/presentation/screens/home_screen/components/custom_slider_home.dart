// ignore_for_file: library_private_types_in_public_api, use_super_parameters

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:livingspirit/presentation/screens/home_screen/components/home_banner_item.dart';
import 'package:livingspirit/utils/formater.dart';
import '../../../../domain/entities/banner_entity.dart';
import '../../../theme/theme.dart';

class CustomCarouselHomePage extends StatefulWidget {
  final List<BannerEntity> items;
  final bool isOffer;

  const CustomCarouselHomePage(
      {Key? key, required this.items, this.isOffer = false})
      : super(key: key);

  @override
  _CustomCarouselHomePageState createState() => _CustomCarouselHomePageState();
}

class _CustomCarouselHomePageState extends State<CustomCarouselHomePage> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio:isTab()?18 / 8: 16 / 9,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 2,
              onPageChanged: (index, reason) {
                setActiveDot(index);
              },
              // autoPlay: widget.items.length == 1 ? false : true,
              autoPlay: false,
              autoPlayCurve: Curves.ease,
              autoPlayAnimationDuration: const Duration(seconds: 5),
              viewportFraction: 1,
            ),
            items:
                widget.items.map((item) => HomeBannerItem(item: item)).toList(),
          ),
          if (widget.items.length != 1)
            Positioned(
              left: 0,
              right: 0,
              bottom:isTab()? defaultPadding * 1.9: defaultPadding * 1.4,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.items.length, (idx) {
                    return activeIndex == idx
                        ? const ActiveDot()
                        : const InactiveDot();
                  })),
            )
        ],
      ),
    );
  }
}

class ActiveDot extends StatelessWidget {
  const ActiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width:isTab()?defaultPadding: defaultPadding * .9,
        height:isTab()?defaultPadding*.4:  defaultPadding * .2,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width:isTab()?defaultPadding*.8:defaultPadding * .5,
        height:isTab()?defaultPadding*.4: defaultPadding * .2,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

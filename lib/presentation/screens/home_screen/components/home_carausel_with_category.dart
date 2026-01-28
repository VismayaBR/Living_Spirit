import 'package:flutter/material.dart';
import 'package:livingspirit/presentation/screens/home_screen/components/custom_slider_home.dart';
import '../home_screen_controller.dart';

class HomeCarouselWithCategory extends StatelessWidget {
  const HomeCarouselWithCategory({
    super.key,
    required this.homeScreenController,
  });

  final HomeScreenController homeScreenController;

  @override
  Widget build(BuildContext context) {
    return CustomCarouselHomePage(items: homeScreenController.homeBanner);
  }
}

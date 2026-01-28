import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/presentation/screens/home_screen/components/home_appbar.dart';
import 'package:livingspirit/presentation/screens/home_screen/components/home_carausel_with_category.dart';
import 'package:livingspirit/presentation/screens/home_screen/components/new_arrival_section.dart';
import 'package:livingspirit/presentation/screens/home_screen/components/shop_by_brand_or_size_section.dart';
import 'package:livingspirit/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:livingspirit/presentation/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.find();
    homeScreenController.getData();
    return AnimatedBuilder(
      animation: homeScreenController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: HomeAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                HomeCarouselWithCategory(
                  homeScreenController: homeScreenController,
                ),
                ShopByBrandOrSizeSection(),
                defaultSpacer,
                NewArrivalSection(homeScreenController: homeScreenController),
              ],
            ),
          ),
        );
      },
    );
  }
}

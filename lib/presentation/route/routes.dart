import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/presentation/screens/brand_selection_screen/brand_selection_screen.dart';
import 'package:livingspirit/presentation/screens/home_screen/home_screen.dart';
import 'package:livingspirit/presentation/screens/product_360_view/product_360_view.dart';
import 'package:livingspirit/presentation/screens/product_details_screen/product_details_screen.dart';
import 'package:livingspirit/presentation/screens/product_list_screen/product_list_screen.dart';
import 'package:livingspirit/presentation/screens/category_selection_screen/category_selection_screen.dart';

import '../core/auth_wrapper/auth_wrapper.dart';
import '../screens/splash_screen/splash_screen.dart';
import 'route_constants.dart';

class Routes {
  static Map<String, Widget> routes() => {
        RouteList.initial: const AuthWrapper(),
        RouteList.authWrapper: const AuthWrapper(),
        RouteList.splash: const SplashScreen(),
        RouteList.homeScreen: const HomeScreen(),
        RouteList.brandSelectionScreen: const BrandSelectionScreen(),
        RouteList.categorySelectionScreen: const CategorySelectionScreen(),
        RouteList.productListScreen:  ProductListScreen(),
        RouteList.productDetailsScreen: const ProductDetailsScreen(),
        RouteList.product360View: const Product360View(),
        // RouteList.kidsSizeList: const KidsSizeListScreen(),
      };

  static List<GetPage> getPages() {
    List<GetPage> pages = [];
    routes().forEach((key, value) {
      pages.add(GetPage(name: key, page: () => value));
    });
    return pages;
  }
}

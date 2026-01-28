// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:livingspirit/presentation/screens/splash_screen/splash.dart';
import 'package:livingspirit/presentation/screens/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenController splashScreenController = Get.find();
    splashScreenController.checkVersion();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: AnimatedBuilder(
          animation: splashScreenController,
          builder: (BuildContext context, Widget? child) {
            return const Splash();
          },
        ),
      ),
    );
  }
}

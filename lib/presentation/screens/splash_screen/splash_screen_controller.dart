import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/presentation/route/route_constants.dart';

import '../../../data/core/api_constants.dart';
import '../../../domain/entities/app_error.dart';
import '../../../utils/url_laucher_services.dart';
import '../../core/auth_wrapper/auth_controller.dart';

class SplashScreenController extends ChangeNotifier {
  bool isLoading = true;
  bool forceUpdate = false;

  AuthController authController = Get.find();

  AppError? appError;
  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  retry() async {
    makeLoading();
    await Future.delayed(const Duration(seconds: 2));
    makeNotLoading();
  }

  pushAuthWrapper() {
    Get.offAllNamed(RouteList.initial);
  }

  updateLater() {
    pushAuthWrapper();
  }

  updateNow() {
    UrlLauncherServices.launchInBrowser(
      Platform.isAndroid ? ApiConstants.playStoreUrl : ApiConstants.appStoreUrl,
    );
  }

  checkVersion() async {
    makeLoading();
    await Future.delayed(const Duration(seconds: 2));
    pushAuthWrapper();
    makeNotLoading();
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/theme.dart';
import 'loading_widget.dart';

showDefaultLoading() {
  showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Container(
                width: MediaQuery.of(context).size.width * .25,
                height: MediaQuery.of(context).size.width * .25,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(defaultPadding * .5)),
                child: const LoadingWidgetBounce()),
          ),
        );
      });
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/presentation/widgets/default_text.dart';

import '../presentation/theme/theme.dart';

showMessage(String message) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
    content: Row(
      children: [
        Expanded(
            child: DefaultText(
          title: message,
          fontSize: defaultPadding * .7,
          isBold: true,
          color: whiteColor,
        ))
      ],
    ),
    elevation: 0,
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: blackColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5)),
  ));
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:get/get.dart';

showCustomMessage(String message, String imageUrl) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
    content: Row(
      children: [
        SvgPicture.asset(imageUrl),
        defaultSpacerHorizontal,
        Expanded(
            child: Text(
          message,
          style: Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(
              fontSize: defaultPadding * .7, fontWeight: FontWeight.bold),
        ))
      ],
    ),
    elevation: 6.0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: whiteColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5)),
  ));
}

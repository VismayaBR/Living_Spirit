// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livingspirit/l10n/app_localizations.dart';
import 'package:livingspirit/utils/formater.dart';
import '../theme/theme.dart';

class DefaultAnimatedSearch extends StatelessWidget {
  const DefaultAnimatedSearch(
      {super.key,
      this.height = kToolbarHeight,
      this.fillColor = whiteColor,
      this.textColor = blackColor,
      this.isBold = false});

  final double height;
  final Color fillColor;
  final Color textColor;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: () {
        // Get.toNamed(RouteList.searchScreen);
      },
      child: Container(
        width: double.infinity,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding * .8),
        decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(defaultPadding*3)),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/ic_search.svg",
              color: blackColor,
            ),
            const SizedBox(
              width: defaultPadding * .7,
            ),
            Text(
              AppLocalizations.of(context)!.search,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize:isTab()?defaultPadding: defaultPadding * .7,
                  color: textColor,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
            ),
            const SizedBox(
              width: defaultPadding * .3,
            ),
            // AnimatedTextKit(
            //   repeatForever: true,
            //   animatedTexts: [
            //     ...List.generate(
            //       searchHints.length,
            //       (index) => FadeAnimatedText(searchHints[index],
            //           textStyle: Theme.of(context)
            //               .textTheme
            //               .bodyLarge!
            //               .copyWith(
            //                   fontSize: defaultPadding * .7,
            //                   color: textColor,
            //                   fontWeight:
            //                       isBold ? FontWeight.bold : FontWeight.normal),
            //           textAlign: TextAlign.center),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

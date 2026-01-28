import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livingspirit/l10n/app_localizations.dart';
import 'package:livingspirit/utils/formater.dart';
import '../../../../utils/debug_utils.dart';
import '../../../theme/theme.dart';

// ignore: must_be_immutable
class AboutProduct extends StatelessWidget {
   AboutProduct({
    super.key,required this.discription,
  });
  String? discription;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: kToolbarHeight * .5,
        ),
        const Divider(
          color: borderColor,
        ),
        defaultSpacerSmall,
        GestureDetector(
          onTap: () {
            consoleLog("aboutProductClick...");
          },
          child: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.about_product,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize:isTab()?defaultPadding*1.4: defaultPadding * .8,
                          color: labelTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    RotatedBox(
                        quarterTurns: 3,
                        child: SvgPicture.asset(
                            "assets/ic_arrow_right_large.svg")),
                  ],
                ),
                defaultSpacerSmall,
                Text(
                  discription.toString(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize:isTab()?defaultPadding*1.2: defaultPadding * .6, color: blackColor),
                ),
               
              ],
            ),
          ),
        ),
       
      ],
    );
  }
}

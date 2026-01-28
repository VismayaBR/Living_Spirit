import 'package:flutter/material.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:livingspirit/presentation/widgets/default_animated_search.dart';
import 'package:livingspirit/presentation/widgets/default_header.dart';
import 'package:livingspirit/utils/formater.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight:isTab()? kToolbarHeight*4:null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(defaultPadding * .7),
        ),
      ),
      backgroundColor: primaryColor,
      titleSpacing: defaultPadding,
      automaticallyImplyLeading: false,
      title: const DefaultHeader(isMenu: false),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight * 2.5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding * .5),
              child: DefaultAnimatedSearch(
                height:isTab()?kToolbarHeight*1.3: kToolbarHeight * .9,
                fillColor: whiteColor,
                textColor: const Color.fromARGB(189, 21, 35, 190),
                isBold: true,
              ),
            ),
            defaultSpacerSmall,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(isTab()?kToolbarHeight*4.5: kToolbarHeight * 2.5); // Adjust AppBar Height
}

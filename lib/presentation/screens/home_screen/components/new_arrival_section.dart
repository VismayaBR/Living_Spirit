import 'package:flutter/material.dart';
import 'package:livingspirit/l10n/app_localizations.dart';
import 'package:livingspirit/presentation/screens/home_screen/components/category_title_with_product.dart';
import 'package:livingspirit/utils/debug_utils.dart';

import '../../../theme/theme.dart';
import '../home_screen_controller.dart';

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({
    super.key,
    required this.homeScreenController,
  });

  final HomeScreenController homeScreenController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding * .5),
      child:  CategoryTitleWithProduct(
        title: AppLocalizations.of(context)!.new_arraivals,
        productList: homeScreenController.newArrivals,
        onTap: () {
          consoleLog("newArrivalsClick");
        },
      ),
    );
  }
}

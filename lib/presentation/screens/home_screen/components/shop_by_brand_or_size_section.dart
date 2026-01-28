
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/domain/entities/type_entity.dart';
import 'package:livingspirit/l10n/app_localizations.dart';
import 'package:livingspirit/presentation/route/route_constants.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:livingspirit/presentation/widgets/default_button.dart';

class ShopByBrandOrSizeSection extends StatelessWidget {
  const ShopByBrandOrSizeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding*.5),
      child: Row(
        children: [
          Expanded(
            child: DefaultButton(
              borderRadius: defaultPadding * .5,
              fontFamily: "Poppins-Regular",
              text: AppLocalizations.of(context)!.shop_by_brand,
              onPressed: () {
                Get.toNamed(RouteList.brandSelectionScreen,arguments: TypeEntity(from: "brand",isEnglish: true));
              },
              isLoading: false,
            ),
          ),
          defaultSpacerHorizontalSmall,
          Expanded(
            child: DefaultButton(
              fontFamily: "Poppins-Regular",
              borderRadius: defaultPadding * .5,
              text: AppLocalizations.of(context)!.shop_by_category,
              onPressed: () {
                 Get.toNamed(RouteList.sizeSelectionScreen,arguments: TypeEntity(from: "size",isEnglish: true));
              },
              isLoading: false,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/l10n/app_localizations.dart';
import 'package:livingspirit/presentation/screens/brand_selection_screen/brand_selection_controller.dart';
import 'package:livingspirit/presentation/screens/brand_selection_screen/components/brand_grid_view.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:livingspirit/presentation/widgets/default_text.dart';
import 'package:livingspirit/utils/formater.dart';

class BrandSelectionScreen extends StatelessWidget {
  const BrandSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BrandSelectionController brandSelectionController = Get.find();
    brandSelectionController.getData();

    return AnimatedBuilder(
      animation: brandSelectionController,
      builder: (context, child) {
        return Scaffold(
           appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.keyboard_arrow_left_outlined,
                color: blackColor,
                size: isTab()?defaultPadding*2:defaultPadding,
              ),
            ),
            titleSpacing: -(defaultPadding * .5),
            title: SizedBox(width: MediaQuery.of(context).size.width * .85),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Image.asset(
                  "assets/logo.png",
                  width: isTab() ? defaultPadding * 9 : defaultPadding * 5,
                ),
                defaultSpacer,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultText(
                        title: brandSelectionController.args.isEnglish
                            ? "${AppLocalizations.of(context)!.selected_category} : "
                            : "المقاس المحدد : ",
                        fontSize: isTab()
                            ? defaultPadding * 2
                            : defaultPadding * .9,
                        fontFamily: "Poppins-Medium",
                      ),
                      DefaultText(
                        title: brandSelectionController.args.size!,
                        fontSize: isTab()
                            ? defaultPadding * 1.5
                            : defaultPadding * .9,
                        fontFamily: "Poppins-Medium",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                  ),
                  child: brandSelectionController.args.isEnglish
                      ? DefaultText(
                          title: AppLocalizations.of(context)!.brands,
                          fontSize: isTab()
                              ? defaultPadding * 1.5
                              : defaultPadding * .9,
                        )
                      : DefaultText(
                          title: "اي ماركة تحب؟",
                          fontSize: isTab()
                              ? defaultPadding * 1.5
                              : defaultPadding * .9,
                          isBold: true,
                        ),

                  //
                ),
                Expanded(
                  child: BrandGridView(
                    
                    brandList: brandSelectionController.brandList,
                    isLoadingMore: brandSelectionController.isLoadingMore,
                    moreItemsAvailable:
                        brandSelectionController.moreItemsAvailable,
                    scrollController: brandSelectionController.scrollController,
                    isLoading: brandSelectionController.isLoading,
                  ),
                ),
              ],
            ),
          ),
          
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/domain/entities/type_entity.dart';
import 'package:livingspirit/l10n/app_localizations.dart';
import 'package:livingspirit/presentation/route/route_constants.dart';
import 'package:livingspirit/presentation/screens/category_selection_screen/category_selection_controller.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:livingspirit/presentation/widgets/default_button.dart';
import 'package:livingspirit/presentation/widgets/default_text.dart';
import 'package:livingspirit/presentation/widgets/loading_widget.dart';
import 'package:livingspirit/utils/debug_utils.dart';
import 'package:livingspirit/utils/formater.dart';
import 'package:livingspirit/utils/snackbar_utils.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  bool isEnglishSelected = true;
  String? selectedSizeKid;

  @override
  Widget build(BuildContext context) {
    final CategorySelectionController categorySelectionController = Get.find();
    categorySelectionController.getData();

    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: categorySelectionController,
          builder: (context, child) {
            return Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: isTab() ? defaultPadding * 7 : defaultPadding * 5,
                  ),
                  defaultSpacer,

                  /// 📏 Size List
                  Expanded(
                    child: categorySelectionController.isLoading
                        ? LoadingWidgetBounce(color: primaryColor)
                        : SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                categorySelectionController.categories.length,
                                (index) {
                                  final isSelectedKid =
                                      categorySelectionController
                                          .selectedCategoryIndex ==
                                      index;

                                  return GestureDetector(
                                    onTap: () {
                                      categorySelectionController.selectCategory(index);
                                      setState(() {
                                        selectedSizeKid = categorySelectionController.categories[index].categories;
                                        consoleLog("selected : $selectedSizeKid");
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      padding: EdgeInsets.symmetric(
                                        vertical: isTab() ? 25 : 16,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelectedKid
                                            ? primaryColor.withOpacity(0.1)
                                            : const Color(0xFFEDEDED),
                                        borderRadius: BorderRadius.circular(6),
                                        border: isSelectedKid
                                            ? Border.all(
                                                color: primaryColor,
                                                width: 1.5,
                                              )
                                            : null,
                                      ),
                                      child: Center(
                                        child: DefaultText(
                                          title: categorySelectionController
                                              .categories[index]
                                              .categories,
                                          fontSize: isTab()
                                              ? defaultPadding * 1.2
                                              : defaultPadding * .7,
                                          fontFamily: isTab()
                                              ? "Poppins-Medium"
                                              : "Poppins-Bold",
                                          isBold: isSelectedKid,
                                          color: isSelectedKid
                                              ? primaryColor
                                              : blackColor,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

      /// 🔘 Bottom Buttons
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding * .2,
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: DefaultButton(
                  height: isTab() ? defaultPadding * 3 : defaultPadding * 2.5,
                  text: AppLocalizations.of(context)!.back,
                  onPressed: () {
                    Get.back();
                  },
                  isLoading: false,
                ),
              ),
              defaultSpacerHorizontalSmall,
              Expanded(
                child: DefaultButton(
                  height: isTab() ? defaultPadding * 3 : defaultPadding * 2.5,
                  text: AppLocalizations.of(context)!.next,
                  onPressed: () {
                    if (categorySelectionController.selectedCategoryIndex != -1) {
                      Get.toNamed(
                        RouteList.brandSelectionScreen,
                        arguments: TypeEntity(
                          from: "size",
                          isEnglish: isEnglishSelected,
                          size: selectedSizeKid,
                          // branch: categorySelectionController.args.optionId
                        ),
                      );
                    } else {
                      showMessage("Please select a size!");
                    }
                  },
                  isLoading: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

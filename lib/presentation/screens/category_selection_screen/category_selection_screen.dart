

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/l10n/app_localizations.dart';
import 'package:livingspirit/presentation/screens/category_selection_screen/components/category_grid_view.dart';
import 'package:livingspirit/presentation/screens/category_selection_screen/category_selection_controller.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:livingspirit/presentation/widgets/default_text.dart';
import 'package:livingspirit/utils/formater.dart';

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  State<CategorySelectionScreen> createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  bool isEnglishSelected = true;
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    final CategorySelectionController categorySelectionController = Get.find();
    categorySelectionController.getData();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: blackColor,
            size: isTab() ? defaultPadding * 2 : defaultPadding,
          ),
        ),
        titleSpacing: -(defaultPadding * .5),
        title: SizedBox(width: MediaQuery.of(context).size.width * .85),
      ),
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
                    width: isTab() ? defaultPadding * 9 : defaultPadding * 5,
                  ),
                  defaultSpacer,
                  Row(
                    children: [
                      Expanded(flex: 5, child: TextFormField()),
                      defaultSpacerHorizontalSmall,
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          decoration:BoxDecoration(shape: BoxShape.circle,color: blackColor,),
                          
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Center(
                              child: Icon(Icons.search, color: whiteColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  defaultSpacer,
                  DefaultText(
                    title: AppLocalizations.of(context)!.categories,
                    fontSize: isTab()
                        ? defaultPadding * 1.5
                        : defaultPadding * .9,
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: defaultPadding * .8,
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: DefaultButton(
                  //           height: isTab()
                  //               ? defaultPadding * 3
                  //               : defaultPadding * 2.5,
                  //           text: AppLocalizations.of(context)!.what_is_your_size,
                  //           fontSize:isTab()?defaultPadding*.7: defaultPadding * .65,
                  //           fontFamily: "Poppins-Regular",
                  //           onPressed: () {
                  //             setState(() => isEnglishSelected = true);
                  //           },
                  //           borderRadius: 5,
                  //           isLoading: false,
                  //           backgroundColor: isEnglishSelected
                  //               ? primaryColor
                  //               : whiteColor,
                  //           textColor: isEnglishSelected
                  //               ? whiteColor
                  //               : primaryColor,
                  //         ),
                  //       ),
                  //       defaultSpacerHorizontalSmall,
                  //       Expanded(
                  //         child: DefaultButton(
                  //           height: isTab()
                  //               ? defaultPadding * 3
                  //               : defaultPadding * 2.5,
                  //           fontSize: isTab()
                  //               ?defaultPadding*.7: defaultPadding * .9,
                  //           fontFamily: "Poppins-Regular",
                  //           text: "كم مقاسك؟",
                  //           borderRadius: 5,
                  //           onPressed: () {
                  //             setState(() => isEnglishSelected = false);
                  //           },
                  //           isLoading: false,
                  //           backgroundColor: !isEnglishSelected
                  //               ? primaryColor
                  //               : whiteColor,
                  //           textColor: !isEnglishSelected
                  //               ? whiteColor
                  //               : primaryColor,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  defaultSpacerSmall,

                  Expanded(
                    child: CategoryGridView(
                      isEnglishSelected: isEnglishSelected,
                      categoryList: categorySelectionController.categories,
                      isLoading: categorySelectionController.isLoading,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

      /// 🔘 Bottom Buttons
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: defaultPadding,
      //     vertical: defaultPadding * .2,
      //   ),
      //   child: SafeArea(
      //     child: Row(
      //       children: [
      //         Expanded(
      //           child: DefaultButton(
      //             height: isTab() ? defaultPadding * 3 : defaultPadding * 2.5,
      //             text: isEnglishSelected
      //                 ? AppLocalizations.of(context)!.back
      //                 : "خلف",
      //             onPressed: () {
      //               Get.back();
      //             },
      //             isLoading: false,
      //           ),
      //         ),
      //         defaultSpacerHorizontalSmall,
      //         Expanded(
      //           child: DefaultButton(
      //             height: isTab() ? defaultPadding * 3 : defaultPadding * 2.5,
      //             text: isEnglishSelected
      //                 ? AppLocalizations.of(context)!.next
      //                 : "التالي",
      //             onPressed: () {
      //               consoleLog(">>>>>>>>>>>>>>>${sizeSelectionController
      //                         .selectedSize}");
      //               // if (sizeSelectionController.selectedSizeIndex != -1) {
      //               //   Get.toNamed(
      //               //     RouteList.brandSelectionScreen,
      //               //     arguments: TypeEntity(
      //               //       from: "size",
      //               //       isEnglish: isEnglishSelected,
      //               //       size: sizeSelectionController
      //               //                     .otherSizes[sizeSelectionController
      //               //                         .selectedSizeIndex]
      //               //                     .sizes,
      //               //       branch: sizeSelectionController.args.optionId,
      //               //     ),
      //               //   );
      //               // }

      //               if (sizeSelectionController.selectedSizeIndex != -1) {
      //                 consoleLog("branch : ${sizeSelectionController.args.optionId}");
      //                 Get.toNamed(
      //                   RouteList.brandSelectionScreen,
      //                   arguments: TypeEntity(
      //                     from: "size",
      //                     isEnglish: isEnglishSelected,
      //                     size: sizeSelectionController
      //                         .selectedSize,
      //                     branch: sizeSelectionController.args.optionId,
      //                   ),
      //                 );
      //               } else {
      //                 showMessage("Please select a size!");
      //               }
      //             },
      //             isLoading: false,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
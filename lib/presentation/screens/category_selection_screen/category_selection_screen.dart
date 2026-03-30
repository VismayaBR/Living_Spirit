import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/domain/params/product_details_args.dart';
import 'package:livingspirit/l10n/app_localizations.dart';
import 'package:livingspirit/presentation/route/route_constants.dart';
import 'package:livingspirit/presentation/screens/category_selection_screen/components/category_grid_view.dart';
import 'package:livingspirit/presentation/screens/category_selection_screen/category_selection_controller.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:livingspirit/presentation/widgets/default_text.dart';
import 'package:livingspirit/utils/formater.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  State<CategorySelectionScreen> createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  CategorySelectionController categorySelectionController = Get.find();

  @override
  void initState() {
    super.initState();
    categorySelectionController = Get.find();
    categorySelectionController.getData(); // ✅ CALL ONCE
  }

  bool isEnglishSelected = true;
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    // final CategorySelectionController categorySelectionController = Get.find();
    // categorySelectionController.getData();

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
              padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                bottom: defaultPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: isTab() ? defaultPadding * 9 : defaultPadding * 5,
                  ),
                  defaultSpacer,
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          var res = await Get.to(() => const SimpleBarcodeScannerPage());
                          if (res is String && res != '-1') {
                            categorySelectionController.barcodeController.text = res;
                            Get.toNamed(
                              RouteList.productDetailsScreen,
                              arguments: ProductDetailsArgs(
                                barcode: res,
                                isEnglish: true,
                              ),
                            );
                          }
                        },
                        child: Icon(
                          Icons.qr_code_scanner,
                          size: isTab() ? defaultPadding * 2 : defaultPadding,
                        ),
                      ),
                      defaultSpacerHorizontalSmall,
                      Expanded(
                        flex: 5,
                        child: TextFormField(
                          controller:
                              categorySelectionController.barcodeController,
                          focusNode:
                              categorySelectionController.barcodeFocusNode,
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: "Scan barcode",
                            border: OutlineInputBorder(),
                          ),
                          onFieldSubmitted: (value) {
                            // Called when scanner sends ENTER
                            // categorySelectionController.handleBarcode(value);
                            Get.toNamed(
                              RouteList.productDetailsScreen,
                              arguments: ProductDetailsArgs(
                                barcode: categorySelectionController
                                    .barcodeController
                                    .text,
                                isEnglish: true,
                              ),
                            );
                          },
                        ),
                      ),
                      defaultSpacerHorizontalSmall,
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            RouteList.productDetailsScreen,
                            arguments: ProductDetailsArgs(
                              barcode: categorySelectionController
                                  .barcodeController
                                  .text,
                              isEnglish: true,
                            ),
                          );
                          // categorySelectionController.getProduct(categorySelectionController.barcodeController.text);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: blackColor,
                          ),

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
    );
  }
}

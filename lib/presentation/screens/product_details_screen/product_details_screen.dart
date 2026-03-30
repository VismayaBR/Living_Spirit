import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/l10n/app_localizations.dart';
import 'package:livingspirit/presentation/route/route_constants.dart';
import 'package:livingspirit/presentation/screens/product_details_screen/components/about_product.dart';
import 'package:livingspirit/presentation/screens/product_details_screen/components/product_details_carousel.dart';
import 'package:livingspirit/presentation/screens/product_details_screen/components/product_item.dart';
import 'package:livingspirit/presentation/screens/product_details_screen/product_details_screen_controller.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:livingspirit/presentation/widgets/default_button.dart';
import 'package:livingspirit/presentation/widgets/default_text.dart';
import 'package:livingspirit/presentation/widgets/loading_widget.dart';
import 'package:livingspirit/presentation/widgets/skelton.dart';
import 'package:livingspirit/utils/formater.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsScreenController productDetailsScreenController = Get.find();

  @override
  void initState() {
    productDetailsScreenController.loadData();
    super.initState();
  }

  @override
  void dispose() {
    productDetailsScreenController.stopPeriodicApiCalls();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: productDetailsScreenController,
      builder: (BuildContext context, Widget? child) {
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
          body: productDetailsScreenController.isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [LoadingWidgetBounce()],
                )
              : !productDetailsScreenController.isLoading &&
                    productDetailsScreenController.productData == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [DefaultText(title: "Invalid Barcode!")],
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: defaultPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: defaultPadding * .2),
                        productDetailsScreenController.isLoading == true
                            ? Skelton(
                                child: Text("data........................."),
                              )
                            : Row(
                                mainAxisAlignment:
                                    (!productDetailsScreenController
                                            .args
                                            .isEnglish &&
                                        productDetailsScreenController
                                                .productData!
                                                .productArabicName !=
                                            '')
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  if (productDetailsScreenController
                                          .productData !=
                                      null)
                                    Expanded(
                                      child: DefaultText(
                                        // style: Theme.of(context).textTheme.bodyLarge!
                                        //     .copyWith(
                                        //       fontSize:
                                        //       color: blackColor,
                                        //       fontWeight: FontWeight.bold,

                                        // ),
                                        title:
                                            productDetailsScreenController
                                                    .args
                                                    .isEnglish ||
                                                productDetailsScreenController
                                                        .productData!
                                                        .productArabicName ==
                                                    ''
                                            ? productDetailsScreenController
                                                  .productData!
                                                  .productName
                                            : productDetailsScreenController
                                                  .productData!
                                                  .productArabicName,
                                        fontSize: isTab()
                                            ? defaultPadding * 1.7
                                            : defaultPadding,
                                        color: blackColor,
                                        maxLine: 2,
                                      ),
                                    ),
                                ],
                              ),
                        const SizedBox(height: defaultPadding * .5),
                        productDetailsScreenController.productData != null
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    defaultPadding,
                                  ),
                                  color: primaryColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding * .7,
                                  ),
                                  child:
                                      productDetailsScreenController
                                              .productData!
                                              .productBrand !=
                                          null
                                      ? Text(
                                          productDetailsScreenController
                                              .productData!
                                              .productBrand!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: isTab()
                                                    ? defaultPadding
                                                    : defaultPadding * .6,
                                                color: whiteColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )
                                      : SizedBox.shrink(),
                                ),
                              )
                            : SizedBox.shrink(),
                        defaultSpacer,
                        ProductDeatailsCarouselPage(
                          items: productDetailsScreenController.productBanner,
                          image_360s: productDetailsScreenController.image_360s,
                        ),
                        defaultSpacer,

                        Text(
                          AppLocalizations.of(context)!.available_category,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(
                                fontSize: isTab()
                                    ? defaultPadding * 1.2
                                    : defaultPadding * .8,
                                color: labelTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        defaultSpacerSmall,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:
                              productDetailsScreenController.productData != null
                              ? Row(
                                  children: List.generate(
                                    productDetailsScreenController
                                        .productData!
                                        .relatedSizeList!
                                        .length,
                                    (index) {
                                      final isSelected =
                                          productDetailsScreenController
                                              .selectedCategoryIndex ==
                                          index;

                                      return Container(
                                        margin: const EdgeInsets.only(
                                          right: defaultPadding * .5,
                                        ),
                                        child: ProductItem(
                                          size: productDetailsScreenController
                                              .productData!
                                              .relatedSizeList![index]
                                              .size
                                              .toString(),
                                          imageUrl:
                                              productDetailsScreenController
                                                  .productBanner
                                                  .isNotEmpty
                                              ? productDetailsScreenController
                                                    .productBanner[0]
                                                    .imageUrl
                                              : "",
                                          borderColor: isSelected
                                              ? primaryColor
                                              : hintColorColor,
                                          onTap: () {
                                            productDetailsScreenController
                                                .selectCategory(index);
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : SizedBox.shrink(),
                        ),

                        defaultSpacerSmall,
                        productDetailsScreenController.isLoading == true
                            ? Skelton(child: Text("data"))
                            : Row(
                                children: [
                                  if (productDetailsScreenController
                                          .productData !=
                                      null)
                                    Expanded(
                                      child: RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: defaultPadding * .7,
                                              ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  "QAR ${productDetailsScreenController.productData!.productPrice}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    fontSize: isTab()
                                                        ? defaultPadding * 1.9
                                                        : defaultPadding * 1.2,
                                                    color: blackColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),

                                            //  TextSpan(
                                            //   text: '\u0024 534,33',
                                            //   style: TextStyle(
                                            //     color: blackColor,
                                            //     decoration: TextDecoration.lineThrough,
                                            //     decorationColor: blackColor,
                                            //     fontSize: isTab()?defaultPadding*1.3:null
                                            //   ),
                                            // ),
                                            //  TextSpan(
                                            //   text: ' 24% Off',
                                            //   style: TextStyle(
                                            //     color: primaryColor,
                                            //     fontWeight: FontWeight.bold,
                                            //     fontSize: isTab()?defaultPadding*1.3:null
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),

                                  defaultSpacerHorizontalSmall,
                                  if (productDetailsScreenController
                                          .productData !=
                                      null)
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: defaultPadding * .7,
                                        vertical: defaultPadding * .3,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            productDetailsScreenController
                                                    .productData!
                                                    .productStock ==
                                                "0"
                                            ? outOfStockColor.withOpacity(.1)
                                            : inStockColor.withOpacity(.1),
                                        border: Border.all(
                                          color:
                                              productDetailsScreenController
                                                      .productData!
                                                      .productStock ==
                                                  "0"
                                              ? outOfStockColor
                                              : inStockColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          defaultPadding * .25,
                                        ),
                                      ),
                                      child: DefaultText(
                                        title:
                                            productDetailsScreenController
                                                    .productData!
                                                    .productStock ==
                                                "0"
                                            ? AppLocalizations.of(
                                                context,
                                              )!.out_of_stock
                                            : AppLocalizations.of(
                                                context,
                                              )!.in_stock,
                                        color:
                                            productDetailsScreenController
                                                    .productData!
                                                    .productStock ==
                                                "0"
                                            ? outOfStockColor
                                            : inStockColor,
                                        fontFamily: "Poppins-Medium",
                                        fontSize: isTab()
                                            ? defaultPadding
                                            : defaultPadding * .5,
                                      ),
                                    ),
                                ],
                              ),
                        defaultSpacer,

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     if(productDetailsScreenController.selectedSizeIndex!=null)
                        //      if (productDetailsScreenController
                        //             .availableBranches
                        //             .isNotEmpty)
                        //     Text(
                        //       AppLocalizations.of(context)!.available_in,
                        //       style: Theme.of(context).textTheme.bodySmall!
                        //           .copyWith(
                        //             fontSize:isTab()?defaultPadding*1.2: defaultPadding * .6,
                        //             color: primaryColor,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //     ),

                        //   if(productDetailsScreenController.selectedSizeIndex!=null)
                        //      if (productDetailsScreenController
                        //             .availableBranches
                        //             .isNotEmpty)
                        //           Text(
                        //             " (${productDetailsScreenController.availableBranches
                        //                 .join(", ")})",
                        //             textAlign: TextAlign.center,
                        //             style: Theme.of(context).textTheme.bodySmall!
                        //                 .copyWith(
                        //                   fontSize:isTab()?defaultPadding*1.2: defaultPadding * .6,
                        //                   color: blackColor,
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //           )
                        //         else
                        //          if(productDetailsScreenController.selectedSizeIndex!=null)
                        //           Text(
                        //            "Sorry! Currently, Not available in our branches.",
                        //             style: Theme.of(context).textTheme.bodySmall!
                        //                 .copyWith(
                        //                   fontSize: defaultPadding * .6,
                        //                   color: blackColor,
                        //                 ),
                        //           ),
                        //   ],
                        // ),
                        if (productDetailsScreenController
                                .selectedCategoryIndex !=
                            null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Builder(
                                builder: (_) {
                                  final status = productDetailsScreenController
                                      .branchAvailabilityStatus;

                                  switch (status) {
                                    // case BranchAvailabilityStatus.availableHere:
                                    //   return Text(
                                    //     AppLocalizations.of(context)!.available_in,
                                    //     style: Theme.of(context).textTheme.bodySmall!
                                    //         .copyWith(
                                    //           color: inStockColor,
                                    //           fontWeight: FontWeight.bold,
                                    //         ),
                                    //   );

                                    case BranchAvailabilityStatus
                                        .availableOtherBranches:
                                      final otherBranches =
                                          productDetailsScreenController
                                              .otherAvailableBranchNames;

                                      // 🔴 SAFETY CHECK
                                      if (otherBranches.isEmpty) {
                                        return Text(
                                          "Sorry! Currently not available in other branches.",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: isTab()
                                                    ? defaultPadding * 1.2
                                                    : defaultPadding * .6,
                                                color: primaryColor,
                                              ),
                                        );
                                      }
                                      final List<String> uniqueBranches =
                                          otherBranches.toSet().toList();

                                      // ✅ Only show when branches exist
                                      return Column(
                                        children: [
                                          Text(
                                            "Available in other branches",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  fontSize: isTab()
                                                      ? defaultPadding * 1.2
                                                      : defaultPadding * .7,
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          defaultSpacerSmall,

                                          ...List.generate(
                                            uniqueBranches.length,
                                            (index) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical:
                                                        defaultPadding * .2,
                                                  ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: blackColor,
                                                    ),
                                                    width: defaultPadding * .3,
                                                    height: defaultPadding * .3,
                                                  ),
                                                  defaultSpacerHorizontalSmall,
                                                  Text(
                                                    uniqueBranches[index],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          fontSize: isTab()
                                                              ? defaultPadding *
                                                                    1.2
                                                              : defaultPadding *
                                                                    .6,
                                                          color: blackColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );

                                    case BranchAvailabilityStatus.notAvailable:
                                      return Text(
                                        "Sorry! Currently not available in other branches.",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontSize: isTab()
                                                  ? defaultPadding * 1.2
                                                  : defaultPadding * .6,
                                              color: primaryColor,
                                            ),
                                      );
                                  }
                                },
                              ),
                            ],
                          ),

                        productDetailsScreenController.productData != null &&
                                productDetailsScreenController
                                        .productData!
                                        .productDescription !=
                                    null
                            ? AboutProduct(
                                discription: productDetailsScreenController
                                    .productData!
                                    .productDescription,
                              )
                            : SizedBox.shrink(),

                        defaultSpacer,
                      ],
                    ),
                  ),
                ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding * .2),
            child: SafeArea(
              child: DefaultButton(
                text: AppLocalizations.of(context)!.back_to_home,
                onPressed: () {
                  Get.until((route) => Get.currentRoute == RouteList.initial);
                },
                borderRadius: 0,
                isLoading: false,
              ),
            ),
          ),
        );
      },
    );
  }
}

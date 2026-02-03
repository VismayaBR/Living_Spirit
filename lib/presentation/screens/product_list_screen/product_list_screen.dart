
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/l10n/app_localizations.dart';
import 'package:livingspirit/presentation/route/route_constants.dart';
import 'package:livingspirit/presentation/screens/home_screen/components/product_card.dart';
import 'package:livingspirit/presentation/screens/product_list_screen/product_list_screen_controller.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:livingspirit/presentation/widgets/default_button.dart';
import 'package:livingspirit/presentation/widgets/default_loading_card.dart';
import 'package:livingspirit/presentation/widgets/default_text.dart';
import 'package:livingspirit/utils/formater.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    ProductListScreenController controller = Get.find();
    controller.getData();

    // Listen for scroll
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          controller.moreItemsAvailable &&
          !controller.isLoadingMore) {
        controller.loadMore();
      }
    });

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
                size: isTab()?defaultPadding*2:defaultPadding,
              ),
            ),
            titleSpacing: -(defaultPadding * .5),
            title: SizedBox(width: MediaQuery.of(context).size.width * .85),
          ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.all(defaultPadding * 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                defaultSpacer,
                defaultSpacer,
                Image.asset(
                  "assets/logo.png",
                  width: isTab() ? defaultPadding * 8 : defaultPadding * 5,
                ),
                defaultSpacer,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultText(
                            title: controller.args.isEnglish
                                ? "${AppLocalizations.of(context)!.selected_category} : "
                                : "الحجم المحدد : ",
                            fontSize: isTab()
                                ? defaultPadding * 1.5
                                : defaultPadding * .8,
                            fontFamily: "Poppins-Medium",
                            isBold: true,
                          ),
                          DefaultText(
                            title: controller.args.mainCategory.toString(),
                            fontSize: isTab()
                                ? defaultPadding * 1.5
                                : defaultPadding * .8,
                            fontFamily: "Poppins-Medium",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultText(
                            title: controller.args.isEnglish
                                ? "${AppLocalizations.of(context)!.selected_brand} : "
                                : "العلامة التجارية المختارة : ",
                            fontSize: isTab()
                                ? defaultPadding * 1.5
                                : defaultPadding * .8,
                            fontFamily: "Poppins-Medium",
                            isBold: true,
                          ),
                          Expanded(
                            child: DefaultText(
                              title: controller.args.brandName,
                              maxLine: 1,
                              
                              fontSize: isTab()
                                  ? defaultPadding * 1.5
                                  : defaultPadding * .8,
                              fontFamily: "Poppins-Medium",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                  ),
                  child: DefaultText(
                    title: controller.args.isEnglish
                        ? AppLocalizations.of(context)!.products
                        : "منتجات",
                    fontSize: isTab()
                        ? defaultPadding * 1.5
                        : defaultPadding * .9,
                    isBold: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding * .5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultSpacer,
                      // 🔍 Search + Sort Row
                      Row(
                        children: [
                          // Search Field
                          Expanded(
                            child: TextField(
                              controller: controller.searchController,
                              onChanged: (value) => {
                                controller.getData()
                              },
                              
                              decoration: InputDecoration(
                                hintText: controller.args.isEnglish
                                    ? "Search products"
                                    : "ابحث عن المنتجات",
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: isTab() ? 22 : 12,
                                  horizontal: 12,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          // Sort button
                          PopupMenuButton<String>(
                            // ignore: sort_child_properties_last
                            child: Image.asset(
                              "assets/sort.png",
                              height:isTab()?defaultPadding*2: defaultPadding,
                            ),
                            // icon: const Icon(Icons.sort),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onSelected: (value) => {
                              controller.sortingOrder(value),
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: "asc",
                                child: DefaultText(
                                 title:  controller.args.isEnglish
                                      ? "Price Low → High"
                                      : "السعر من الأقل للأعلى",
                                      fontFamily: "Poppins-Regular",
                                ),
                              ),
                            const PopupMenuDivider(height: 1),
                              PopupMenuItem(
                                
                                value: "desc",
                                child: DefaultText(
                                title:   controller.args.isEnglish
                                      ? "Price High → Low"
                                      : "السعر من الأعلى للأقل",
                                       fontFamily: "Poppins-Regular",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // defaultSpacerSmall,
                controller.products.isEmpty && controller.isLoading == false
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/no_products.png",
                                height: isTab() ? null : defaultPadding * 12,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                          controller: _scrollController,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: defaultPadding * 0.7,
                                crossAxisSpacing: defaultPadding * 0.1,
                                childAspectRatio: isTab() ? 0.85 : 0.7,
                              ),
                          itemCount: controller.isLoading
                              ? 4
                              : controller.products.length +
                                    (controller.isLoadingMore ? 2 : 0),
                          itemBuilder: (context, index) {
                            if (controller.isLoading ||
                                index < controller.products.length) {
                              if (controller.isLoading) {
                                return DefaultLoadingCard(
                                  width:
                                      MediaQuery.of(context).size.width * .46,
                                  height:
                                      MediaQuery.of(context).size.height * .33,
                                  borderRadius: 0,
                                );
                              } else {
                                return ProductCard(
                                  productEntity: controller.products[index],
                                  isEnglish: controller.args.isEnglish,
                                  
                                );
                              }
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: primaryColor,
                                ),
                              );
                            }
                          },
                        ),
                      ),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding * .2),
        child: SafeArea(
          child: DefaultButton(
            text: AppLocalizations.of(context)!.back_to_home,
            onPressed: () {
              Get.until(
                (route) => Get.currentRoute == RouteList.initial,
              );
            },
            borderRadius: 0,
            isLoading: false,
          ),
        ),
      ),
    );
  }
}
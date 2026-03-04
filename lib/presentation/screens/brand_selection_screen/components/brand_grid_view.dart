

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/domain/params/product_list_args.dart';
import 'package:livingspirit/presentation/route/route_constants.dart';
import 'package:livingspirit/presentation/screens/brand_selection_screen/brand_selection_controller.dart';
import 'package:livingspirit/presentation/screens/brand_selection_screen/components/barnd_item.dart';
import 'package:livingspirit/presentation/widgets/default_loading_card.dart';
import 'package:livingspirit/utils/snackbar_utils.dart';
import '../../../../domain/entities/brand_entity.dart';
import '../../../theme/theme.dart';

class BrandGridView extends StatelessWidget {
  const BrandGridView({
    Key? key,
    required this.brandList,
    required this.isLoadingMore,
    required this.moreItemsAvailable,
    required this.scrollController,
    this.isLoading = false,
  }) : super(key: key);

  final List<BrandEntity> brandList;
  final bool isLoadingMore;
  final bool moreItemsAvailable;
  final ScrollController scrollController;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final brandSelectionController = Get.find<BrandSelectionController>();
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;
    return AnimatedBuilder(
      animation: brandSelectionController,
      builder: (context, child) {
        return CustomScrollView(
          controller: scrollController,
          slivers: [
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [defaultSpacer],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding * .4),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (isLoading) {
                    return const Center(
                      child: DefaultLoadingCard(
                        width: defaultPadding * 5,
                        height: defaultPadding * 5,
                        // borderRadius: defaultPadding * 2,
                      ),
                    );
                  } else {
                    // "All Brands" tile
                    if (index == 0) {
                      final isSelected =
                          brandSelectionController.selectedBrandIndex == -1;
                      return Center(
                        child: BrandItem(
                          brandEntity: BrandEntity(
                            brandId: '0',
                            brandName: "All Brands",
                            brandImage: "assets/brand.png",
                          ),
                          isSelected: isSelected,
                          onTap: () {
                            brandSelectionController.selectAllBrands();
                            

                        if (brandSelectionController.selectedBrandIndex == -2) {
                          showMessage("Please select a brand!");
                        } else {
                          if (brandSelectionController.selectedBrandIndex ==
                              -1) {
                            debugPrint("Selected Brand: All Brands");
                          } else {
                            final selectedBrand =
                                brandSelectionController
                                    .brandList[brandSelectionController
                                    .selectedBrandIndex];
                            debugPrint(
                              "Selected Brand: ${selectedBrand.brandName}",
                            );
                          }

                          final brandId =
                              brandSelectionController.selectedBrandIndex == -1
                              ? null
                              : brandSelectionController
                                    .brandList[brandSelectionController
                                        .selectedBrandIndex]
                                    .brandId;

                          Get.toNamed(
                            RouteList.productListScreen,
                            arguments: ProductListArgs(
                              brandId: brandId ?? "0",
                              // size: brandSelectionController.args.size
                              //     .toString(),
                               mainCategory: brandSelectionController.args.mainCategory,
                              isEnglish:
                                  brandSelectionController.args.isEnglish,
                              brandName:
                                  brandSelectionController.selectedBrandIndex ==
                                      -1
                                  ? "All"
                                  : brandSelectionController
                                        .brandList[brandSelectionController
                                            .selectedBrandIndex]
                                        .brandName,
                             
                            ),
                          );
                        }

                          },
                        ),
                      );
                    }

                    final brand = brandList[index - 1];
                    final isSelected =
                        brandSelectionController.selectedBrandIndex ==
                        index - 1;

                    return Center(
                      child: BrandItem(
                        brandEntity: brand,
                        isSelected: isSelected,
                        onTap: () {
                          brandSelectionController.selectBrand(index - 1);
                        
                        if (brandSelectionController.selectedBrandIndex == -2) {
                          showMessage("Please select a brand!");
                        } else {
                          if (brandSelectionController.selectedBrandIndex ==
                              -1) {
                            debugPrint("Selected Brand: All Brands");
                          } else {
                            final selectedBrand =
                                brandSelectionController
                                    .brandList[brandSelectionController
                                    .selectedBrandIndex];
                            debugPrint(
                              "Selected Brand: ${selectedBrand.brandName}",
                            );
                          }

                          final brandId =
                              brandSelectionController.selectedBrandIndex == -1
                              ? null
                              : brandSelectionController
                                    .brandList[brandSelectionController
                                        .selectedBrandIndex]
                                    .brandId;

                          Get.toNamed(
                            RouteList.productListScreen,
                            arguments: ProductListArgs(
                              brandId: brandId ?? "0",
                              // size: brandSelectionController.args.size
                              //     .toString(),
                              mainCategory: brandSelectionController.args.mainCategory,
                              isEnglish:
                                  brandSelectionController.args.isEnglish,
                              brandName:
                                  brandSelectionController.selectedBrandIndex ==
                                      -1
                                  ? "All"
                                  : brandSelectionController
                                        .brandList[brandSelectionController
                                            .selectedBrandIndex]
                                        .brandName,
                              
                            ),
                          );
                        }
                        },
                      ),
                    );
                  }
                }, childCount: isLoading ? 20 : brandList.length + 1),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 4 : 3,
                  childAspectRatio: isTablet ? .7 : .9,
                  mainAxisSpacing: isTablet
                      ? size.width * 0.02
                      : size.width * 0.015,
                  crossAxisSpacing: size.width * 0.025,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
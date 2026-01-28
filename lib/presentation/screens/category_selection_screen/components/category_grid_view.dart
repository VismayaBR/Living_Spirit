import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/domain/entities/category_entity.dart';
import 'package:livingspirit/domain/entities/type_entity.dart';
import 'package:livingspirit/presentation/route/route_constants.dart';
import 'package:livingspirit/presentation/screens/category_selection_screen/components/categroy_item.dart';
import 'package:livingspirit/presentation/screens/category_selection_screen/category_selection_controller.dart';
import 'package:livingspirit/presentation/widgets/default_loading_card.dart';
import '../../../theme/theme.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({Key? key, required this.categoryList, this.isLoading = false,this.isEnglishSelected})
    : super(key: key);

  final List<CategoryListEntity> categoryList;
  final bool isLoading;
  final bool? isEnglishSelected;

  @override
  Widget build(BuildContext context) {
    final CategorySelectionController categorySelectionController = Get.find();
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    return AnimatedBuilder(
      animation: categorySelectionController,
      builder: (context, child) {
        return CustomScrollView(
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
                    final size = categoryList[index];
                    final isSelected =
                        categorySelectionController.selectedCategoryIndex == index;

                    return Center(
                      child: CategoryItem(
                        categoryEntity: size,
                        isSelected: isSelected,
                        onTap: () {
                          categorySelectionController.selectCategory(index);
                      Get.toNamed(
                        RouteList.brandSelectionScreen,
                        arguments: TypeEntity(
                          from: "category",
                          isEnglish: isEnglishSelected!,
                          size: categorySelectionController
                              .selectedCategory,
                          // branch: categorySelectionController.args.optionId,
                        ),
                      );
                        },
                      ),
                    );
                  }
                }, childCount: isLoading ? 20 : categoryList.length),
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

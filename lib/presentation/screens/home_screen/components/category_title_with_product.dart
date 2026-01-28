import 'package:flutter/material.dart';
import 'package:livingspirit/domain/entities/product_entity.dart';
import 'package:livingspirit/utils/formater.dart';
import '../../../theme/theme.dart';
import '../../../widgets/default_title_with_view_button.dart';

class CategoryTitleWithProduct extends StatelessWidget {
  const CategoryTitleWithProduct(
      {super.key,
      required this.title,
      required this.productList,
      required this.onTap,
      this.isButtonVissible = true});

  final String title;
  final List<ProductEntity> productList;
  final VoidCallback onTap;
  final bool isButtonVissible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTitleWithViewButton(
            title: title,
            titleStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize:isTab()?defaultPadding*1.3: defaultPadding * .8,
                color: blackColor),
            isButtonVissible: false,
            onTap: onTap),
        defaultSpacer,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // ...List.generate(
              //     productList.length,
              //     (index) => Container(
              //           margin:
              //               const EdgeInsets.only(right: defaultPadding * .5),
              //           child: ProductCard(productEntity: productList[index],),
              //         ))
            ],
          ),
        )
      ],
    );
  }
}

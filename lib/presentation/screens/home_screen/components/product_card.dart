import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/domain/entities/product_entity.dart';
import 'package:livingspirit/domain/params/product_details_args.dart';
import 'package:livingspirit/presentation/route/route_constants.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:livingspirit/utils/debug_utils.dart';
import 'package:livingspirit/utils/formater.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productEntity,
    required this.isEnglish,
    this.branch,
  });

  final ProductEntity productEntity;
  final bool isEnglish;
  final String? branch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        consoleLog("br.........$branch");
        Get.toNamed(
          RouteList.productDetailsScreen,
          arguments: ProductDetailsArgs(
            id: productEntity.productId,
            isEnglish: isEnglish,
            branch: branch,
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .46,
        height: isTab()
            ? MediaQuery.of(context).size.height * .45
            : MediaQuery.of(context).size.height * .35,
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: hintColorColor),
          borderRadius: BorderRadius.circular(defaultPadding * .5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .46,
              height: MediaQuery.of(context).size.width * .45,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(defaultPadding * .5),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 241, 239, 239), // or any color you want
                    blurRadius: 9, // soften the shadow
                    offset: Offset(.5, 1), // move shadow downwards
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    width: MediaQuery.of(context).size.width * .38,
                    height: MediaQuery.of(context).size.width * .38,
                    imageUrl: productEntity.productImage!,
                    fit: BoxFit.contain,
                    errorWidget: (context, url, error) => ClipRRect(
                      borderRadius: BorderRadius.circular(defaultPadding * .5),
                      child: Image.asset("assets/ic_no_image.png"),
                    ),
                  ),
                ],
              ),
            ),
            defaultSpacerSmall,

            const SizedBox(height: defaultPadding * .2),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  defaultPadding*.5),
              child: Text(
                productEntity.productArabicName == "" || isEnglish
                    ? productEntity.productName
                    : productEntity.productArabicName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: isTab() ? defaultPadding * 1.2 : defaultPadding * .7,
                  color: labelTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: defaultPadding * .2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  defaultPadding*.5),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: defaultPadding * .55),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'QAR ${productEntity.productPrice} ',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: isTab()
                            ? defaultPadding * 1.2
                            : defaultPadding * .8,
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // TextSpan(
                    //   text: '\u0024 ${productEntity.productCutPrice}',
                    //   style: TextStyle(
                    //     color: primaryColor,
                    //     fontSize: isTab() ? defaultPadding : null,
                    //     decoration: TextDecoration.lineThrough,
                    //     decorationColor: blackColor,
                    //   ),
                    // ),
                    // TextSpan(
                    //   text: ' ${productEntity.productOffer}',
                    //   style: TextStyle(
                    //     color: primaryColor,
                    //     fontSize: isTab() ? defaultPadding : null,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

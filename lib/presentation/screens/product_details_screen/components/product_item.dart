import 'package:flutter/material.dart';
import 'package:livingspirit/presentation/widgets/default_text.dart';
import 'package:livingspirit/utils/formater.dart';
import '../../../theme/theme.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.size,
    required this.imageUrl,
    required this.borderColor,
    required this.onTap, 
  });
  final String size;
  final String imageUrl;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .2,
        height: MediaQuery.of(context).size.width * .2,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .2,
              height: MediaQuery.of(context).size.width * .15,
              decoration: BoxDecoration(
                border: Border.all(color: borderColor,width: 2),
                
                color: whiteColor,
                borderRadius: BorderRadius.circular(defaultPadding * .3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultText(
                    title: size,

                    maxLine: 1,
                    fontSize:isTab()?defaultPadding*1.5: defaultPadding * .8,
                    fontFamily: "Poppins-Medium",
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding * .1),
          ],
        ),
      ),
    );
  }
}

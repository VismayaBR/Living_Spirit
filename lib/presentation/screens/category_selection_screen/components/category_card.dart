
import 'package:flutter/material.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:livingspirit/presentation/widgets/default_text.dart';
import 'package:livingspirit/utils/formater.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.mainText,
    required this.subText,
    required this.bgColor,
    required this.textColor,
    required this.onTap,
  });

  final String mainText;
  final String subText;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding * .5,
        horizontal: defaultPadding,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(defaultPadding * .5),
            border: Border.all(color: primaryColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultText(
                title: mainText,
                fontSize:isTab()?defaultPadding*1.8: defaultPadding,
                isBold: true,
                color: textColor,
              ),
              DefaultText(
                title: subText,
                fontSize: isTab()?defaultPadding*1.5: defaultPadding * .9,
                isBold: true,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
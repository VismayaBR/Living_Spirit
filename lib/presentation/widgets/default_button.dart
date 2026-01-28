import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:livingspirit/utils/formater.dart';

import 'loading_widget.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
    this.backgroundColor = primaryColor,
    this.textColor = whiteColor,
    this.height = defaultPadding * 3,
    this.borderRadius = defaultPadding * 2,
    this.elevation = 0,
    this.borderColor = primaryColor,
    this.fontFamily = "Poppins-Bold",
    this.fontSize = defaultPadding * .7,
    this.imageUrl,
    this.isCenterText = true,
    this.isImageRight = true,
    this.imageSize,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double borderRadius;
  final double elevation;
  final Color borderColor;
  final double fontSize;
  final String? imageUrl;
  final String? fontFamily;
  final bool isCenterText;
  final bool isImageRight;
  final double? imageSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height:isTab()?height*1.3: height,
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(elevation),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      borderRadius,
                    ),
                    side: BorderSide(color: borderColor),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
              ),
              onPressed: isLoading ? () {} : onPressed,
              child: AnimatedSwitcher(
                duration: defaultAnimationDuration,
                child: isLoading
                    ? LoadingWidget(color: textColor)
                    : Row(
                        mainAxisAlignment: isCenterText
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          if (imageUrl != null && !isImageRight)
                            SvgPicture.asset(imageUrl!),
                          if (imageUrl != null && !isImageRight)
                            defaultSpacerHorizontalSmall,
                          Text(
                            text,
                            style: TextStyle(
                              color: textColor,
                              fontWeight:isTab()?FontWeight.w600: FontWeight.bold,
                              fontFamily: fontFamily,
                              fontSize:isTab()?fontSize*2: fontSize,
                            ),
                          ),
                          if (imageUrl != null && isImageRight)
                            defaultSpacerHorizontalSmall,
                          if (imageUrl != null && isImageRight)
                            SvgPicture.asset(imageUrl!, width: imageSize),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DefaultButtonRounded extends StatelessWidget {
  const DefaultButtonRounded({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
    this.backgroundColor = primaryColor,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      onPressed: isLoading ? () {} : onPressed,
      child: AnimatedSwitcher(
        duration: defaultAnimationDuration,
        child: isLoading ? const LoadingWidget() : Text(text),
      ),
    );
  }
}

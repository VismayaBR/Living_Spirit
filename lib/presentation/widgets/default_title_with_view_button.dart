// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:livingspirit/l10n/app_localizations.dart';

import '../theme/theme.dart';

class DefaultTitleWithViewButton extends StatelessWidget {
  const DefaultTitleWithViewButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.isButtonVissible = true,
      this.textColor = blackColor,
      this.buttonColor = labelTextColor,
      this.titleStyle});

  final String title;
  final VoidCallback onTap;
  final bool isButtonVissible;
  final Color textColor;
  final Color buttonColor;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: titleStyle ??
                Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: defaultPadding*.9,
                    color: textColor),
          ),
        ),
        if (isButtonVissible)
          GestureDetector(
            onTap: onTap,
            child: Text(
              AppLocalizations.of(context)!.view_all,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: defaultPadding * .6,
                  color: buttonColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../utils/debug_utils.dart';
import '../../../theme/theme.dart';

class VariantItem extends StatelessWidget {
  const VariantItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        consoleLog("SizeClick....");
      },
      child: Container(
        width: defaultPadding * 2.5,
        height: defaultPadding * 2.5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: borderColor,
            borderRadius:
                BorderRadius.circular(defaultPadding * .3)),
        child: Text(
          "S",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: defaultPadding * .8,
              color: blackColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

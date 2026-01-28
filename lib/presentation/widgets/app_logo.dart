import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "logo",
        child: Image.asset(
          "assets/logo.png",
          width: MediaQuery.of(context).size.width * .4,
        ));
  }
}

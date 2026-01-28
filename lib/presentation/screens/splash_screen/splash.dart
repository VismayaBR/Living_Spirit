
// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:livingspirit/presentation/widgets/app_logo.dart';


class Splash extends StatelessWidget {
  const Splash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SizedBox(
          width: double.infinity,
         
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogo(),
              const SizedBox(
                height: defaultPadding * .8,
              ),
             
            ],
          )),
    );
  }
}

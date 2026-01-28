import 'package:flutter/material.dart';
import 'package:livingspirit/utils/formater.dart';
class DefaultHeader extends StatelessWidget {
  const DefaultHeader({
    super.key,
    this.isMenu = true,
  });

  final bool isMenu;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Image.asset(
            "assets/logo.svg",
            width:isTab()? MediaQuery.of(context).size.width * .2: MediaQuery.of(context).size.width * .25,
          ),
           Image.asset(
             "assets/logo.svg",
             width: MediaQuery.of(context).size.width * .3,
           ),
        
         
        ],
      ),
    );
  }
}

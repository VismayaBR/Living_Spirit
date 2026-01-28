// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const defaultPadding = 20.0;
const defaultSpacer = SizedBox(height: defaultPadding);
const defaultSpacerSmall = SizedBox(height: defaultPadding / 2);
const defaultSpacerHorizontal = SizedBox(width: defaultPadding);
const defaultSpacerHorizontalSmall = SizedBox(width: defaultPadding / 2);

const sliverSpacer = SliverToBoxAdapter(child: defaultSpacer);

//const colours
const primaryColor = Color(0xFF000000);
const primaryColorLight = Color(0xFFFAAD23);
const secondaryColor = Color(0xFF000000);
const acentColor = Color(0xFFF26A6A);
const whiteColor = Color(0xFFFFFFFF);
const scaffoldBg = Color(0xFFFFFFFF);
const blackColor = Color(0xFF121212);
const hintColorColor = Color.fromARGB(255, 219, 218, 218);
const inStockColor = Color(0xFF008000);
const outOfStockColor = Color(0xFFFF0000);

const labelTextColor = Color(0xFF8D8D8D);
const errorColor = Color(0xFFE53323);
const brownColor = Color(0xFFE8E8E8);
const brownColorLight = Color(0xFF3D3C3C);
const borderColor = Color(0xFFD2D2D2);

const shimmerGradient = LinearGradient(
  colors: [Color(0xFFEBEBF4), Color(0xFFF4F4F4), Color(0xFFEBEBF4)],
  stops: [0.1, 0.3, 0.4],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

const defaultAnimationDuration = Duration(milliseconds: 500);

const defaultShadow = [
  BoxShadow(color: Colors.black26, offset: Offset(1.1, 1.1), blurRadius: 5),
];

setSystemOverlay() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    //  DeviceOrientation.portraitDown
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Platform.isAndroid
          ? Brightness.dark
          : Brightness.light,
    ),
  );
}

class FadeScale extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    var curve = Curves.ease;
    var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
    return FadeTransition(opacity: animation.drive(tween), child: child);
  }
}

ThemeData themeData(context) {
  return ThemeData.light().copyWith(
    useMaterial3: false,
    unselectedWidgetColor: primaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedItemColor: primaryColor,
      unselectedItemColor: blackColor,
      selectedLabelStyle: TextStyle(color: primaryColor),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    dividerColor: borderColor,
    tabBarTheme: TabBarThemeData(
      unselectedLabelColor: brownColorLight,
      labelColor: whiteColor,
      indicator: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(defaultPadding * 2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
      ),
    ),
    chipTheme: Theme.of(context).chipTheme.copyWith(
      secondaryLabelStyle: const TextStyle(color: whiteColor),
      secondarySelectedColor: primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: blackColor),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      titleSpacing: -defaultPadding,
      centerTitle: true,
      elevation: 0,
    ),
    platform: TargetPlatform.iOS,
    cardTheme: CardThemeData(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPadding * .3,
        vertical: defaultPadding * .3,
      ),
      elevation: defaultPadding * .5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
      ),
      shadowColor: Colors.black38,
    ),
    scaffoldBackgroundColor: scaffoldBg,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: whiteColor,
      isDense: true,
      hintStyle: const TextStyle(color: hintColorColor),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        borderSide: const BorderSide(color: labelTextColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        borderSide: const BorderSide(color: labelTextColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        borderSide: const BorderSide(color: labelTextColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        borderSide: const BorderSide(color: errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        borderSide: const BorderSide(color: errorColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        borderSide: const BorderSide(color: labelTextColor),
      ),
    ),
  );
}

ThemeData smallTab(BuildContext context) {
  return ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: scaffoldBg,
    textTheme: GoogleFonts.poppinsTextTheme(),
    dividerColor: borderColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      titleSpacing: -defaultPadding,
      centerTitle: true,
      elevation: 0,
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: primaryColor,
      unselectedLabelColor: blackColor,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: defaultPadding * .6,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: defaultPadding * .6,
      ),
      indicator: BoxDecoration(
        border: Border(bottom: BorderSide(color: primaryColor, width: 3.0)),
      ),
    ),
    cardTheme: CardThemeData(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPadding * .3,
        vertical: defaultPadding * .3,
      ),
      elevation: defaultPadding * .5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
      ),
      shadowColor: Colors.black38,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: whiteColor,
      isDense: true,
      hintStyle: const TextStyle(color: hintColorColor),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        borderSide: const BorderSide(color: labelTextColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        borderSide: const BorderSide(color: labelTextColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        borderSide: const BorderSide(color: labelTextColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        borderSide: const BorderSide(color: errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        borderSide: const BorderSide(color: errorColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
        borderSide: const BorderSide(color: labelTextColor),
      ),
    ),
  );
}

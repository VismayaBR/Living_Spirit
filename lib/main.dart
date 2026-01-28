import 'package:flutter/material.dart';
import 'package:livingspirit/l10n/app_localizations.dart';
import 'package:livingspirit/presentation/route/route_constants.dart';
import 'package:livingspirit/presentation/route/routes.dart';
import 'package:livingspirit/presentation/theme/theme.dart';
import 'package:livingspirit/utils/initiate_app_utils.dart';
import 'package:livingspirit/utils/user_preferance_utils.dart';
import 'package:get/get.dart';



void main() async {
  await setupApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = setupLocale();
    return GetMaterialApp(
      title: 'Livingspirit',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      theme: themeData(context),
      themeMode: ThemeMode.light,
      initialRoute: RouteList.splash,
      getPages: Routes.getPages(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
// import 'package:provider_task/screens/main_screen.dart';

import 'package:provider_task/l10n/app_localizations.dart';

import 'package:provider_task/provider/localization_provider.dart';
import 'package:provider_task/provider/theme_provider.dart';
import 'package:provider_task/screens/splash_screen.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final localizationProvider = context.watch<LocalizationProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      locale: localizationProvider.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates:AppLocalizations.localizationsDelegates, 
      home:SplashScreen()
    );
  }
}

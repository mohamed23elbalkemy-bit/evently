import 'package:evently/ui/screens/forget_password/forget_password_screen.dart';
import 'package:evently/ui/screens/login/login_screen.dart';
import 'package:evently/ui/screens/navigation/navigation_screen.dart';
import 'package:evently/ui/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';
void main (){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      home: NavigationScreen(),
      locale: Locale('en'),
    );
  }
}
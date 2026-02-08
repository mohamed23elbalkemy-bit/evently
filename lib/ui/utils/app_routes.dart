import 'package:evently/ui/screens/login/login_screen.dart';
import 'package:evently/ui/screens/onboarding/onboarding1.dart';
import 'package:evently/ui/screens/onboarding/onboarding2.dart';
import 'package:evently/ui/screens/onboarding/onboarding3.dart';
import 'package:evently/ui/screens/onboarding/onboarding4.dart';
import 'package:evently/ui/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import '../screens/add_event/add_event_screen.dart';
import '../screens/forget_password/forget_password_screen.dart';
import '../screens/navigation/navigation_screen.dart';

abstract final class AppRoutes {
 static MaterialPageRoute get registerScreen{
   return MaterialPageRoute(builder: (_) => RegisterScreen());
 }
 static MaterialPageRoute get loginScreen{
   return MaterialPageRoute(builder: (_) => LoginScreen());
 }
 static MaterialPageRoute get forGetPassword{
   return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
 }
 static MaterialPageRoute get navigationScreen{
   return MaterialPageRoute(builder: (_) =>  NavigationScreen());
 }
 static MaterialPageRoute get addEventScreen{
   return MaterialPageRoute(builder: (_) =>  AddEventScreen());
 }

 static MaterialPageRoute get onboarding1{
   return MaterialPageRoute(builder: (_) =>  Onboarding1());
 }
 static MaterialPageRoute get onboarding2{
   return MaterialPageRoute(builder: (_) =>  Onboarding2());
 }
 static MaterialPageRoute get onboarding3{
   return MaterialPageRoute(builder: (_) =>  Onboarding3());
 }
 static MaterialPageRoute get onboarding4{
   return MaterialPageRoute(builder: (_) =>  Onboarding4());
 }
}

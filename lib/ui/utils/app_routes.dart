import 'package:evently/ui/screens/login/login_screen.dart';
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
}
import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  static String currentLocale = "en";

  void updateLocale(String newLocale){
    currentLocale = newLocale;
    notifyListeners();
  }
}
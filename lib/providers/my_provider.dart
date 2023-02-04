import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{

  String langCode ='en';
  ThemeMode mode = ThemeMode.light;

  void changeLanguage(String lang){
    if(langCode==lang) return;
    langCode = lang;
    notifyListeners();
  }

  String getBackgroundImage(){
    if(mode==ThemeMode.light){
      return "assets/images/main_background.png";
    }
    return "assets/images/main_background_dark.png";
  }

  void changeThemeMode(ThemeMode mode){
    this.mode = mode;
    notifyListeners();
  }

}
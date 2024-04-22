import 'package:ashikulislamdev/theme/dark_mode.dart';
import 'package:ashikulislamdev/theme/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  //initial light mood
  ThemeData _themeData = lightMode;

  //get theme
  ThemeData get themeData => _themeData;

  //is dark mood
  bool get isDarkMood => _themeData == darkMood;

  //set theme
  set themeData(ThemeData themeData){
    _themeData = themeData;

    //change the ui
    notifyListeners();
  }

  void toggleTheme(){
    if (_themeData == lightMode) {
      themeData = darkMood;
    } else {
      themeData = lightMode;
    }
  }
}
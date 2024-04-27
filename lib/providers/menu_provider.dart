import 'package:flutter/material.dart';

class SelectedIndexProvider with ChangeNotifier{
  int selectedIndex = 0;

  int get getSelectedIndex => selectedIndex;

  void selectedIndexValue(int index){
    selectedIndex = index;
    notifyListeners();
  }
}
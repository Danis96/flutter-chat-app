import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

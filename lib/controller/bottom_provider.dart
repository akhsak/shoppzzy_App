import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {
  int currentIndex = 0;

  void onTap( index) {
    currentIndex = index;
    notifyListeners();
  }
}
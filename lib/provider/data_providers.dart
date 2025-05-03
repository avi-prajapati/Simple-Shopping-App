import 'package:flutter/material.dart';

class DataProviders extends ChangeNotifier {
  int itemCount = 0;

  void incrementCount() {
    ++itemCount;
    notifyListeners();
  }

  void decrementCount() {
    --itemCount;
    notifyListeners();
  }
}

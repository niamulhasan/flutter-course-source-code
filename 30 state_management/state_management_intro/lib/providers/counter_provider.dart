import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int counter = 5;
  void increase() {
    counter = counter + 1;
    notifyListeners();
  }
}

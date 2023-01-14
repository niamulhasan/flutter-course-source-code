import 'package:flutter/material.dart';

class MainPageProvider with ChangeNotifier {
  int _selectedTabIndex = 0;

  int getSelectedTabIndex() {
    return _selectedTabIndex;
  }

  void setTab(int tabIndex) {
    _selectedTabIndex = tabIndex;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);

  int _currentTab = 0;
  int get currentTab => _currentTab;
  set currentTab(int currentTab) {
    _currentTab = currentTab;
    notifyListeners();
  }

  jumpToPage(int i) {
    currentTab = i;
    pageController.jumpToPage(i);
  }
}

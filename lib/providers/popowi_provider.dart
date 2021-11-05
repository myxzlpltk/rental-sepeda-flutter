import 'package:flutter/material.dart';

class PopowiProvider extends ChangeNotifier {
  int _score = 0;
  int get score => _score;
  void increment() {
    _score++;
    notifyListeners();
  }

  bool _isShock = false;
  bool get isShock => _isShock;
  void toggle() {
    _isShock = !_isShock;
    notifyListeners();
  }
}

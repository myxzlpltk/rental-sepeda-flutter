import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';

class AppProvider extends ChangeNotifier {
  AppUser? _user;
  bool get isAuth => _user != null;
  set user(AppUser? user) {
    _user = user;
    notifyListeners();
  }
}

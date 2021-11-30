import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';
import 'package:rental_sepeda_flutter/services/auth_services.dart';

class AppProvider extends ChangeNotifier {
  AppUser? _user;
  bool get isAuth => _user != null;
  AppUser? get user => _user;
  set user(AppUser? user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> sync() async {
    AppUser? user = await AuthServices.auth();
    if (user != null) {
      _user = user;
      notifyListeners();
      return true;
    } else {
      _user = null;
      notifyListeners();
      return false;
    }
  }
}

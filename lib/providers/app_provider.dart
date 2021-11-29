import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';
import 'package:rental_sepeda_flutter/services/auth_services.dart';
import 'package:rental_sepeda_flutter/services/user_services.dart';

class AppProvider extends ChangeNotifier {
  AppUser? _user;
  bool get isAuth => _user != null;
  AppUser? get user => _user;
  set user(AppUser? user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> auth() async {
    AppUser? user = await AuthServices.auth();
    if (user != null) {
      _user = user;
      _name = user.name;
      _phoneNumber = user.phoneNumber;
      _city = user.city;
      return true;
    } else {
      _user = null;
      return false;
    }
  }

  String _name = "";
  set name(String name) {
    _name = name;
    update();
  }

  String _phoneNumber = "";
  set phoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    update();
  }

  String _city = "";
  set city(String city) {
    _city = city;
    update();
  }

  File? _image;
  File? get image => _image;
  set image(File? image) {
    _image = image;
    notifyListeners();
    update();
  }

  Timer? _debounce;
  void update() async {
    if (_debounce != null && _debounce!.isActive) _debounce!.cancel();
    _debounce = Timer(Duration(seconds: 1), () async {
      final user = _user!.copyWith(
        name: _name,
        phoneNumber: _phoneNumber,
        city: _city,
      );

      if (_image == null) {
        _user = await UserServices.update(user);
      } else {
        _user = await UserServices.updateWithPhoto(user, _image!);
        _image = null;
        notifyListeners();
      }
    });
  }
}

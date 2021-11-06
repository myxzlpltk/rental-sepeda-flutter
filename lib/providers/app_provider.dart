import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';

class AppProvider extends ChangeNotifier {
  User? _user;

  bool get isAuth => _user != null;

  void login(String email, String password) {
    // TODO: set login logic here
    _user = const User(
        id: 0,
        name: "dummy",
        email: "dummy@gmail.com",
        photoURL: "http://lorempixel.com/200/200/people/");
  }
}

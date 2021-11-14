import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';

class AppProvider extends ChangeNotifier {
  User? _user;
  bool get isAuth => _user != null;
}

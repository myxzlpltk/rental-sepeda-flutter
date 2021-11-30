import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';
import 'package:rental_sepeda_flutter/providers/app_provider.dart';
import 'package:rental_sepeda_flutter/services/auth_services.dart';

class RegisterProvider extends ChangeNotifier {
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;
  set isPasswordVisible(bool isPasswordVisible) {
    _isPasswordVisible = isPasswordVisible;
    notifyListeners();
  }

  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;
  set isProcessing(bool isProcessing) {
    _isProcessing = isProcessing;
    notifyListeners();
  }

  String name = "";
  String email = "";
  String password = "";

  void signUp(BuildContext context) async {
    isProcessing = true;
    Response<AppUser> result = await AuthServices.signUp(name, email, password);
    isProcessing = false;

    if (!result.status) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result.message!)));
    } else {
      Provider.of<AppProvider>(context, listen: false).user = result.data;

      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, Routes.dashboard);
    }
  }
}

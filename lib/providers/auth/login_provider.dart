import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';
import 'package:rental_sepeda_flutter/providers/app_provider.dart';
import 'package:rental_sepeda_flutter/services/auth_services.dart';

class LoginProvider extends ChangeNotifier {
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

  String email = "";
  String password = "";

  void signIn(BuildContext context) async {
    isProcessing = true;
    Response<AppUser> result = await AuthServices.signIn(email, password);
    isProcessing = false;

    if (!result.status) {
      Fluttertoast.showToast(msg: result.message!);
    } else {
      Provider.of<AppProvider>(context, listen: false).user = result.data;

      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, Routes.dashboard);
    }
  }
}

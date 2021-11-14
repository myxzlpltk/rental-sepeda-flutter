import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  static Future<bool> login(String username, String password) async {
    // Ambil data dari server
    var response = await http.post(
      Uri.parse("$apiURL/user/login/"),
      headers: headerHttp,
      body: {'username': username, 'password': password},
    );

    // Jika kode respon 200
    if (response.statusCode == 200) {
      try {
        // Proses mapping
        Map<String, dynamic> result = json.decode(response.body);

        final prefs = await SharedPreferences.getInstance();
        prefs.setString('jwt', result['jwt']);

        return true;
      } catch (e, s) {
        Fluttertoast.showToast(msg: errorAppString);
      }
    } else if (response.statusCode == 401) {
      Fluttertoast.showToast(msg: response.body);
    } else {
      Fluttertoast.showToast(msg: errorAppString);
    }

    return false;
  }

  static Future<bool> register(
      String email, String username, String password) async {
    var response = await http.post(
      Uri.parse("$apiURL/user/register/"),
      headers: headerHttp,
      body: {'email': email, 'username': username, 'password': password},
    );

    // Jika kode respon 200
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      Fluttertoast.showToast(msg: response.body);
    } else {
      Fluttertoast.showToast(msg: errorAppString);
    }

    return false;
  }
}

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';

class UserServices {
  static Future<User?> login(String email, String password) async {
    // Ambil data dari server
    var response = await http.get(
      Uri.parse("$apiURL/login"),
      headers: headerHttp,
    );

    // Jika kode respon 200
    if (response.statusCode == 200) {
      try {
        // Proses mapping
        Map<String, dynamic> result = json.decode(response.body);

        return User.fromJson(result);
      } catch (e, s) {
        Fluttertoast.showToast(msg: errorAppString);
      }
    } else {
      Fluttertoast.showToast(msg: errorAppString);
    }

    return null;
  }
}

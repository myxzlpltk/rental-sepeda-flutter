import 'package:flutter/material.dart';

/* Literal String */
const String appName = "App Name";
const String apiURL = "https://api-ads-ebike.herokuapp.com/";
const String errorAppString =
    "Terjadi kesalahan aplikasi. Silahkan coba lagi nanti!";

/* Literal Object */
Map<String, String> headerHttp = {'Accept': 'application/json'};

/* Colors */
const Color redColor = Color(0xFFFF0000);
const Color whiteColor = Color(0xFFF1F8FB);
const Color greenColor = Color(0xFF61DEC0);
const Color oldGreenColor = Color(0xFF2497A5);
const Color blueColor = Color(0xFF0A578E);

/* Gradient */
const LinearGradient customGradientBlueToGreen = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [blueColor, greenColor],
);
const LinearGradient customGradientGreenToBlue = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [blueColor, greenColor],
);

/* Text Styles */
const TextStyle regularTextStyle = TextStyle(
  fontSize: 12,
  height: 1,
);
const TextStyle boldTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  height: 1,
);

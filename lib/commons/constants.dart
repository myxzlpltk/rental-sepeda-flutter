import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
/// Untuk mengganti warna gunakan
/// regularTextStyle.copyWith(
///   color: Colors.white,
/// )
TextStyle regularTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(12),
  color: Colors.black,
  height: 1,
);
TextStyle boldTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(12),
  fontWeight: FontWeight.w700,
  color: Colors.black,
  height: 1,
);
TextStyle elevatedButtonText = TextStyle(
  fontSize: ScreenUtil().setSp(20),
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

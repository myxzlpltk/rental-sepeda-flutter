import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/* Literal String */
const String appName = "App Name";
const String apiURL = "https://ebike-api.herokuapp.com";
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
TextStyle headline1Style = GoogleFonts.lato(
  fontSize: ScreenUtil().setSp(28),
  fontWeight: FontWeight.w900,
  color: Colors.black,
);
TextStyle headline2Style = GoogleFonts.lato(
  fontSize: ScreenUtil().setSp(18),
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
TextStyle headline3Style = GoogleFonts.lato(
  fontSize: ScreenUtil().setSp(13),
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
TextStyle bodyText1Style = GoogleFonts.lato(
  fontSize: ScreenUtil().setSp(12),
  color: Colors.black,
);
TextStyle bodyText2Style = GoogleFonts.lato(
  fontSize: ScreenUtil().setSp(12),
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
TextStyle captionStyle = GoogleFonts.lato(
  fontSize: ScreenUtil().setSp(9),
  color: Colors.black87,
);

/* Response Class */
class Response<T> {
  final bool status;
  final T? data;
  final String? message;

  Response(
    this.status, {
    this.data,
    this.message,
  });
}

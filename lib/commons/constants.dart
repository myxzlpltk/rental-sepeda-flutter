import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/* Literal String */
const String appName = "e-BRent";
const String appError = "Terjadi kesalahan aplikasi. Silahkan coba lagi nanti!";
const String appDescription =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Phasellus faucibus scelerisque eleifend donec pretium vulputate sapien nec sagittis. Est ultricies integer quis auctor elit sed vulputate mi. Donec enim diam vulputate ut pharetra sit.";
const String emailAddress = "e-brent@um.ac.id";
const String emailURL =
    "mailto:$emailAddress?subject=Permintaan%20Bantuan%20Aplikasi%20E-BRent&body=Jelaskan%20permalasahan%20anda%20disini...";

/* Literal Object */
Map<String, String> headerHttp = {'Accept': 'application/json'};

/* Colors */
const Color redColor = Color(0xFFFF0000);
const Color whiteColor = Color(0xFFF1F8FB);
const Color greenColor = Color(0xFF61DEC0);
const Color oldGreenColor = Color(0xFF2497A5);
const Color blueColor = Color(0xFF0A578E);
const Color shimmerBaseColor = Color(0xFFAAAAAA);
const Color shimmerHighlightColor = Color(0xFFCCCCCC);

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
  fontSize: ScreenUtil().setSp(14),
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

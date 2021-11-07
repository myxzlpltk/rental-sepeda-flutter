import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Literal String */
const String appName = "App Name";
const String apiURL = "https://example.com";
const String errorAppString = "Terjadi kesalahan aplikasi. Silahkan coba lagi nanti!";

/* Literal Object */
Map<String, String> headerHttp = {'Accept': 'application/json'};

/* Colors */
const Color redColor = Color(0xFFFF0000);
const Color whiteColor = Color(0xFFF1F8FB);

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
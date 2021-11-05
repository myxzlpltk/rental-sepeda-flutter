import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

/* Literal String */
const String appName = "App Name";
const String apiURL = "https://example.com";

/* Colors */
const Color redColor = Color(0xFFFF0000);

/* Text Styles */
TextStyle regularTextStyle = GoogleFonts.lato(
  color: Colors.black,
  fontSize: 12,
  height: 1,
);

/* Methods helper */
final _formatCurrency = NumberFormat.currency(
  locale: "id_ID",
  symbol: "Rp. ",
  decimalDigits: 0,
);

String toIDR(int money) {
  return _formatCurrency.format(money);
}

import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/home.dart';
import 'package:rental_sepeda_flutter/pages/auth/login_page.dart';
import 'package:rental_sepeda_flutter/pages/auth/register_page.dart';
import 'package:rental_sepeda_flutter/pages/landing_page.dart';
import 'package:rental_sepeda_flutter/pages/station_page.dart';
import 'package:rental_sepeda_flutter/pages/loading_page.dart';
import 'package:rental_sepeda_flutter/pages/undefined_page.dart';

class Routes {
  Routes._();

  static const String landing = '/';
  static const String main = '/main';
  static const String login = '/login';
  static const String register = '/register';
  static const String station = '/station';
  static const String loading = '/loading';
}

Route<dynamic>? generateRoute(RouteSettings settings) {
  final arguments = settings.arguments;

  switch (settings.name) {
    /* Home */
    case Routes.landing:
      return MaterialPageRoute(builder: (_) => LandingPage());
    case Routes.main:
      return MaterialPageRoute(builder: (_) => Home());
    case Routes.login:
      return MaterialPageRoute(builder: (_) => LoginPage());
    case Routes.register:
      return MaterialPageRoute(builder: (_) => RegisterPage());
    case Routes.station:
      return MaterialPageRoute(builder: (_) => StationPage(id: 1));
    case Routes.loading:
      return MaterialPageRoute(builder: (_) => LoadingPage());
  }

  return MaterialPageRoute(
    builder: (_) => UndefinedPage(
      name: settings.name.toString(),
    ),
  );
}

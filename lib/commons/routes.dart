import 'package:flutter/material.dart';

import '/home.dart';
import '/pages/landing_page.dart';
import '/pages/undefined_page.dart';
import '../pages/auth/login_page.dart';
import '../pages/auth/register_page.dart';

class Routes {
  Routes._();

  static const String landing = '/';
  static const String main = '/main';
  static const String login = '/login';
  static const String register = '/register';
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
  }

  return MaterialPageRoute(
    builder: (_) => UndefinedPage(
      name: settings.name.toString(),
    ),
  );
}

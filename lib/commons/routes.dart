import 'package:flutter/material.dart';

import '/home.dart';
import '/pages/landing_page.dart';
import '/pages/loading_page.dart';
import '/pages/login_page.dart';
import '/pages/popowi_page.dart';
import '/pages/register_page.dart';
import '/pages/undefined_page.dart';

class Routes {
  Routes._();

  static const String landing = '/';
  static const String main = '/main';
  static const String popowi = '/popowi';
  static const String login = '/login';
  static const String register = '/register';
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
    case Routes.loading:
      return MaterialPageRoute(builder: (_) => LoadingPage());
    /* Fun */
    case Routes.popowi:
      return MaterialPageRoute(builder: (_) => PopowiPage());
  }

  return MaterialPageRoute(
    builder: (_) => UndefinedPage(
      name: settings.name.toString(),
    ),
  );
}

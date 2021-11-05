import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/pages/landing_page.dart';
import 'package:rental_sepeda_flutter/pages/popowi_page.dart';
import 'package:rental_sepeda_flutter/pages/undefined_page.dart';

class Routes {
  Routes._();

  static const String landing = '/';
  static const String popowi = '/popowi';
}

Route<dynamic>? generateRoute(RouteSettings settings) {
  final arguments = settings.arguments;

  switch (settings.name) {
    /* Home */
    case Routes.landing:
      return MaterialPageRoute(builder: (_) => LandingPage());
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

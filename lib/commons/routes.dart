import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/models/station_model.dart';
import 'package:rental_sepeda_flutter/pages/auth/login_page.dart';
import 'package:rental_sepeda_flutter/pages/auth/register_page.dart';
import 'package:rental_sepeda_flutter/pages/bike/checkout_page.dart';
import 'package:rental_sepeda_flutter/pages/bike/loading_page.dart';
import 'package:rental_sepeda_flutter/pages/bike/search_page.dart';
import 'package:rental_sepeda_flutter/pages/dashboard_page.dart';
import 'package:rental_sepeda_flutter/pages/landing_page.dart';
import 'package:rental_sepeda_flutter/pages/setting/info_app_page.dart';
import 'package:rental_sepeda_flutter/pages/station/station_page.dart';
import 'package:rental_sepeda_flutter/pages/undefined_page.dart';
import 'package:rental_sepeda_flutter/pages/wallets/detail_top_up_page.dart';
import 'package:rental_sepeda_flutter/pages/wallets/top_up_page.dart';
import 'package:rental_sepeda_flutter/pages/wallets/wallet_page.dart';

class Routes {
  Routes._();

  static const String landing = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String search = '/search';
  static const String station = '/station';
  static const String checkout = '/checkout';
  static const String loading = '/loading';
  static const String infoApp = '/info-app';
  static const String wallet = '/wallets/my';
  static const String topUp = '/wallets/top-up';
  static const String detailTopUp = '/wallets/top-up/detail';
}

Route<dynamic>? generateRoute(RouteSettings settings) {
  final arguments = settings.arguments;

  switch (settings.name) {
    /* Home */
    case Routes.landing:
      return MaterialPageRoute(builder: (_) => LandingPage());
    case Routes.dashboard:
      return MaterialPageRoute(builder: (_) => DashboardPage());
    case Routes.login:
      return MaterialPageRoute(builder: (_) => LoginPage());
    case Routes.register:
      return MaterialPageRoute(builder: (_) => RegisterPage());
    case Routes.search:
      return MaterialPageRoute(builder: (_) => SearchPage());
    case Routes.station:
      if (arguments is Station) {
        return MaterialPageRoute(
            builder: (_) => StationPage(station: arguments));
      }
      break;
    case Routes.checkout:
      return MaterialPageRoute(builder: (_) => CheckoutPage());
    case Routes.loading:
      return MaterialPageRoute(builder: (_) => LoadingPage());
    case Routes.infoApp:
      return MaterialPageRoute(builder: (_) => InfoAppPage());
    case Routes.wallet:
      return MaterialPageRoute(builder: (_) => WalletPage());
    case Routes.topUp:
      return MaterialPageRoute(builder: (_) => TopUpPage());
    case Routes.detailTopUp:
      if (arguments is String) {
        return MaterialPageRoute(
            builder: (_) => DetailTopUpPage(id: arguments));
      }
      break;
  }

  return MaterialPageRoute(
    builder: (_) => UndefinedPage(
      name: settings.name.toString(),
    ),
  );
}

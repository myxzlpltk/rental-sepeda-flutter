import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';

class InfoAppPage extends StatelessWidget {
  const InfoAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTemplate(
        title: "Info Aplikasi",
        children: [
          Text(
            appName,
            style: headline1Style,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          SvgPicture.asset(
            "assets/svg/logo_dark.svg",
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          SizedBox(height: 20),
          Text(
            appDescription,
            style: bodyText1Style,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            "Built with",
            style: headline3Style,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Center(child: FlutterLogo()),
        ],
      ),
    );
  }
}

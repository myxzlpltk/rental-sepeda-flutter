import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/services/user_services.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Selamat Datang di Puncak Komedi"),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text("Login", style: boldTextStyle),
              onPressed: () {
                // UserServices.register("watashi", "12333").then((value) => {});
                Navigator.pushNamed(context, Routes.login);
              },
            )
          ],
        ),
      ),
    );
  }
}

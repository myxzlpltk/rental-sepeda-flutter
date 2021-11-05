import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Selamat Datang di Tingkat Tertinggi"),
            SizedBox(height: 16),
            TextButton(
              child: Text("Fun"),
              onPressed: () {
                Navigator.pushNamed(context, Routes.popowi);
              },
            )
          ],
        ),
      ),
    );
  }
}

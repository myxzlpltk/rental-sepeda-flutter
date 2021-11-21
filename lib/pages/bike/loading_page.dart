import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: customGradientBlueToGreen),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "NEAR ME",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
            SizedBox(height: 30),
            Icon(
              Icons.pin_drop_outlined,
              size: 124,
              color: whiteColor,
            ),
            SizedBox(height: 20),
            Text(
              "Searching",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: whiteColor,
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

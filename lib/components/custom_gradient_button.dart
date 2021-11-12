import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';

class CustomGradientButton extends StatelessWidget {
  final Text text;
  final double height;
  final double width;
  final VoidCallback onPressed;
  const CustomGradientButton({
    Key? key,
    this.text = const Text(""),
    this.height = 0,
    this.width = 0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        gradient: customGradientGreenToBlue,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: text,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
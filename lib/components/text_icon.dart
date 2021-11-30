import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';

class TextIcon extends StatelessWidget {
  final String text;
  final IconData iconData;
  const TextIcon({
    Key? key,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                iconData,
                size: 14,
                color: whiteColor,
              ),
            ),
          ),
          TextSpan(
            text: text,
            style: headline3Style.copyWith(color: whiteColor),
          ),
        ],
      ),
    );
  }
}

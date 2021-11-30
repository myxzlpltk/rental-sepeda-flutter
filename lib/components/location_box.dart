import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';

class LocationBox extends StatelessWidget {
  final String text;
  final IconData iconData;
  const LocationBox({
    Key? key,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 16,
          color: whiteColor,
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: whiteColor.withAlpha(90),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              text,
              style: bodyText2Style.copyWith(color: whiteColor),
            ),
          ),
        )
      ],
    );
    ;
  }
}

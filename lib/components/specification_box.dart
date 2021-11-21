import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';

class SpecificationsBox extends StatelessWidget {
  final IconData iconData;
  final String caption;
  final String value;

  const SpecificationsBox({
    Key? key,
    required this.caption,
    required this.iconData,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: blueColor),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(2, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(iconData, size: 40),
          SizedBox(height: 12),
          Text(
            caption,
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(height: 8),
          Text(value, style: Theme.of(context).textTheme.bodyText2),
        ],
      ),
    );
  }
}

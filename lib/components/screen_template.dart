import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';

class ScreenTemplate extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ScreenTemplate({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [blueColor, greenColor, greenColor, greenColor, greenColor],
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: whiteColor),
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25)),
                  color: whiteColor,
                ),
                child: ListView(
                  children: children,
                )),
          ),
        ],
      ),
    );
    ;
  }
}

import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';

class ScreenTemplate extends StatelessWidget {
  final List<Widget> actions;
  final List<Widget> children;
  final String title;

  const ScreenTemplate({
    Key? key,
    required this.children,
    required this.title,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            blueColor,
            greenColor,
            greenColor,
            greenColor,
            greenColor
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: headline1Style.copyWith(color: whiteColor),
                  ),
                ),
                SizedBox(width: 16),
                ...actions,
              ],
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25)),
              child: Container(
                color: whiteColor,
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: children,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

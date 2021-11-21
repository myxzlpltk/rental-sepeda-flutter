import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';

class Countdown extends StatelessWidget {
  final DateTime dateTime;

  const Countdown({Key? key, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final ValueNotifier<int> hours = ValueNotifier(
      dateTime.difference(now).inHours,
    );
    final ValueNotifier<int> minutes = ValueNotifier(
      dateTime.difference(now).inMinutes % 60,
    );
    final ValueNotifier<int> seconds = ValueNotifier(
      dateTime.difference(now).inSeconds % 60,
    );

    Timer.periodic(Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      if (dateTime.difference(now).inSeconds >= 0) {
        hours.value = dateTime.difference(now).inHours;
        minutes.value = dateTime.difference(now).inMinutes % 60;
        seconds.value = dateTime.difference(now).inSeconds % 60;
      } else {
        timer.cancel();
      }
    });

    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          decoration: BoxDecoration(
            gradient: customGradientBlueToGreen,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            color: Color(0xFFFBA73F),
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: hours,
            builder: (context, value, _) => Text(
              value.toString().padLeft(2, "0"),
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: whiteColor),
            ),
          ),
        ),
        SizedBox(width: 2),
        Text(
          ":",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        SizedBox(width: 2),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          decoration: BoxDecoration(
            gradient: customGradientBlueToGreen,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            color: Color(0xFFFBA73F),
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: minutes,
            builder: (context, value, _) => Text(
              value.toString().padLeft(2, "0"),
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: whiteColor),
            ),
          ),
        ),
        SizedBox(width: 2),
        Text(
          ":",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        SizedBox(width: 2),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          decoration: BoxDecoration(
            gradient: customGradientBlueToGreen,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            color: Color(0xFFFBA73F),
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: seconds,
            builder: (context, value, _) => Text(
              value.toString().padLeft(2, "0"),
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: whiteColor),
            ),
          ),
        ),
      ],
    );
  }
}

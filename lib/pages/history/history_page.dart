import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/components/history_item.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "History",
      children: <Widget>[
        Text(
          "New",
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(height: 16),
        HistoryItem(
          historyID: 100912,
          historyStatus: "has been booked",
          historyTime: DateTime.now(),
        ),
        HistoryItem(
          historyID: 100912,
          historyStatus: "has been booked",
          historyTime: DateTime.now(),
        ),
        SizedBox(height: 16),
        Text(
          "Previous",
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(height: 16),
        HistoryItem(
          historyID: 100912,
          historyStatus: "has been booked",
          historyTime: DateTime.now(),
        ),
        HistoryItem(
          historyID: 100912,
          historyStatus: "has been booked",
          historyTime: DateTime.now(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final DateTime historyTime;
  final String historyStatus;
  final int historyID;

  const HistoryItem({
    Key? key,
    required this.historyID,
    required this.historyStatus,
    required this.historyTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Image.asset('assets/image/history_item.png'),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("8:35 AM"),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: "Bike from your order",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: " #$historyID",
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(
                        text: " $historyStatus",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

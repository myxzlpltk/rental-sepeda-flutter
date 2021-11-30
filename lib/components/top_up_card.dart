import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/utils.dart';
import 'package:rental_sepeda_flutter/models/top_up_model.dart';

class TopUpCard extends StatelessWidget {
  final TopUp topUp;

  const TopUpCard({Key? key, required this.topUp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(Icons.account_balance_wallet, size: 16),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Top Up", style: headline3Style),
                Text(humanDate(topUp.createdAt), style: bodyText1Style),
              ],
            ),
            Spacer(),
            Text(
              "+${toIDR(topUp.amount)}",
              style: headline3Style.copyWith(
                color: Colors.green.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

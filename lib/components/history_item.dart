import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/commons/utils.dart';
import 'package:rental_sepeda_flutter/models/order_model.dart';
import 'package:rental_sepeda_flutter/services/order_services.dart';

class HistoryItem extends StatelessWidget {
  final Order order;

  const HistoryItem({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Order? newOrder = await OrderServices.get(order.id);
        if (newOrder != null) {
          Navigator.pushNamed(context, Routes.detailOrder, arguments: newOrder);
        }
      },
      child: Padding(
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Sepeda listrik dari pesanan",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: " #${order.id.substring(0, 7).toUpperCase()}",
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextSpan(
                          text: order.status == StatusOrder.waiting
                              ? " telah dipesan dan menunggu pengambilan"
                              : order.status == StatusOrder.completed
                                  ? " telah dikembalikan"
                                  : order.expiredAt.microsecondsSinceEpoch <
                                          DateTime.now().microsecondsSinceEpoch
                                      ? " perlu dikembalikan"
                                      : " telah berhasil dipesan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    humanDateTime(order.createdAt),
                    style: bodyText1Style,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

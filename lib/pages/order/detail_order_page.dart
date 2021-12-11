import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/utils.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/models/order_model.dart';

class DetailOrderPage extends StatelessWidget {
  final Order order;

  const DetailOrderPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTemplate(
        title: "Detail Pemesanan",
        children: [
          SizedBox(height: 20),
          Center(
            child: QrImage(
              data: order.id,
              size: MediaQuery.of(context).size.width * 0.65,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0),
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black54),
              ),
            ),
            child: Text(
              "Tunjukkan kode QR ini kepada stasiun untuk mengambil sepeda listrik.",
              textAlign: TextAlign.center,
              style: bodyText1Style,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      order.station.name,
                      style: headline3Style,
                    ),
                    Spacer(),
                    Text(
                      "ID #${order.station.id.substring(0, 7).toUpperCase()}",
                      style: headline3Style,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Lawa sewa",
                      style: bodyText1Style.copyWith(color: Colors.black87),
                    ),
                    Spacer(),
                    Text(
                      "${order.days} Hari",
                      style: bodyText1Style.copyWith(color: Colors.black87),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Harga per-hari",
                      style: bodyText1Style.copyWith(color: Colors.black87),
                    ),
                    Spacer(),
                    Text(
                      toIDR(order.price),
                      style: bodyText1Style.copyWith(color: Colors.black87),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Divider(color: Colors.black54),
                Row(
                  children: [
                    Text(
                      "Total",
                      style: headline3Style,
                    ),
                    Spacer(),
                    Text(
                      toIDR(order.total),
                      style: bodyText1Style,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

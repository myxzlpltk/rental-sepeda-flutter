import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/utils.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/models/top_up_model.dart';

class DetailTopUpPage extends StatelessWidget {
  final TopUp topUp;

  const DetailTopUpPage({Key? key, required this.topUp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTemplate(
        title: "Informasi Top Up",
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg/qris.svg",
                height: 20,
              ),
              SvgPicture.asset(
                "assets/svg/gpn.svg",
                height: 30,
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            topUp.status == TopUpStatus.success
                ? "Top Up Berhasil"
                : topUp.status == TopUpStatus.failed
                    ? "Top Up Dibatalkan"
                    : "Menunggu Pembayaran",
            style: headline3Style,
            textAlign: TextAlign.center,
          ),
          Text(
            toIDR(topUp.amount),
            style: headline1Style,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            "Scan kode QRIS ini ke dompet digital atau mobile banking favorit kamu! Kamu akan dikenakan biaya sebesar ${toIDR(topUp.amount)}",
            style: bodyText1Style,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Center(
            child: QrImage(
              data: topUp.id,
              size: MediaQuery.of(context).size.width * 0.65,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Valid hingga ${humanDateTime(topUp.createdAt.add(Duration(days: 7)))}",
            style: bodyText1Style,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/utils.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/components/shimmer_box.dart';
import 'package:rental_sepeda_flutter/models/top_up_model.dart';
import 'package:rental_sepeda_flutter/services/top_up_services.dart';

class DetailTopUpPage extends StatelessWidget {
  final String id;

  const DetailTopUpPage({Key? key, required this.id}) : super(key: key);

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
          FutureBuilder<TopUp?>(
            future: TopUpServices.get(id),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData && snapshot.data is TopUp) {
                return _buildWidget(context, snapshot.data!);
              } else {
                return _buildShimmer(context);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWidget(BuildContext context, TopUp topUp) {
    return Column(
      children: [
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
    );
  }

  Widget _buildShimmer(BuildContext context) {
    return Column(
      children: [
        ShimmerBox(
          child: Text(
            "Status Top Up",
            style: headline3Style,
            textAlign: TextAlign.center,
          ),
        ),
        ShimmerBox(
          child: Text(
            "Rp. XXX.XXX",
            style: headline1Style,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 16),
        ShimmerBox(
          child: Text(
            "Scan kode QRIS ini ke dompet digital atau mobile banking favorit kamu! Kamu akan dikenakan biaya sebesar Rp. XXX.XXX",
            style: bodyText1Style,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 8),
        Center(
          child: ShimmerBox(
            child: QrImage(
              data: "Kode Pembayaran QRIS Sedang Dimuat....",
              size: MediaQuery.of(context).size.width * 0.65,
            ),
          ),
        ),
        SizedBox(height: 20),
        ShimmerBox(
          child: Text(
            "Valid hingga ${humanDateTime(DateTime.now())}",
            style: bodyText1Style,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

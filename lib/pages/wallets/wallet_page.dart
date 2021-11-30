import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/components/balance_box.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/components/top_up_card.dart';
import 'package:rental_sepeda_flutter/models/top_up_model.dart';
import 'package:rental_sepeda_flutter/services/top_up_services.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTemplate(
        title: "Dompet Saya",
        children: [
          BalanceBox(),
          SizedBox(height: 16),
          Text("Riwayat Transaksi", style: headline2Style),
          SizedBox(height: 8),
          StreamBuilder<QuerySnapshot>(
            stream: TopUpServices.queryList(context),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, i) => Divider(thickness: 1, height: 2),
                  itemBuilder: (context, i) => TopUpCard(
                    topUp: TopUp.fromDocument(snapshot.data!.docs.elementAt(i)),
                  ),
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

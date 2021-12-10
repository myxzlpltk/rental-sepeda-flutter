import 'package:flutter/material.dart';
import 'package:paginate_firestore/bloc/pagination_listeners.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/components/balance_box.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/components/shimmer_box.dart';
import 'package:rental_sepeda_flutter/components/top_up_card.dart';
import 'package:rental_sepeda_flutter/models/top_up_model.dart';
import 'package:rental_sepeda_flutter/providers/app_provider.dart';
import 'package:rental_sepeda_flutter/services/top_up_services.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaginateRefreshedChangeListener refreshChangeListener =
        PaginateRefreshedChangeListener();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          refreshChangeListener.refreshed = true;
          await Provider.of<AppProvider>(context, listen: false).sync();
        },
        child: ScreenTemplate(
          title: "Dompet Saya",
          children: [
            BalanceBox(),
            SizedBox(height: 16),
            Text("Riwayat Transaksi", style: headline2Style),
            SizedBox(height: 8),
            PaginateFirestore(
              itemBuilder: (context, snapshots, i) => TopUpCard(
                topUp: TopUp.fromDocument(snapshots[i]),
              ),
              query: TopUpServices.queryList(context),
              itemBuilderType: PaginateBuilderType.listView,
              listeners: [refreshChangeListener],
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              separator: Divider(thickness: 1, height: 2),
              initialLoader: _shimmerTopUpCard(),
              bottomLoader: _shimmerTopUpCard(),
              onEmpty: Center(
                child: Text("Kosong?"),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _shimmerTopUpCard() {
    return ShimmerBox(
      child: TopUpCard(
        topUp: TopUp(id: '', uid: '', createdAt: DateTime.now(), amount: 99),
      ),
    );
  }
}

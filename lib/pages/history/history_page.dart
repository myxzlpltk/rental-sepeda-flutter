import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paginate_firestore/bloc/pagination_listeners.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/components/history_item.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/models/order_model.dart';
import 'package:rental_sepeda_flutter/models/station_model.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';
import 'package:rental_sepeda_flutter/providers/app_provider.dart';
import 'package:rental_sepeda_flutter/services/order_services.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaginateRefreshedChangeListener refreshChangeListener =
        PaginateRefreshedChangeListener();

    return RefreshIndicator(
      onRefresh: () async {
        refreshChangeListener.refreshed = true;
        await Provider.of<AppProvider>(context, listen: false).sync();
      },
      child: ScreenTemplate(
        title: "History",
        children: <Widget>[
          PaginateFirestore(
            itemBuilder: (context, snapshots, i) => HistoryItem(
              order: Order.fromDocument(
                  snapshots[i], Station.dummy, AppUser.dummy),
            ),
            query: OrderServices.previousQueryList(),
            itemBuilderType: PaginateBuilderType.listView,
            listeners: [refreshChangeListener],
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            initialLoader: _shimmerHistoryItem(),
            bottomLoader: _shimmerHistoryItem(),
            onEmpty: Column(
              children: [
                SizedBox(height: 16),
                SvgPicture.asset(
                  "assets/svg/no-data.svg",
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                SizedBox(height: 16),
                Text("Tidak ada transaksi yang ditemukan",
                    style: bodyText1Style),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _shimmerHistoryItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

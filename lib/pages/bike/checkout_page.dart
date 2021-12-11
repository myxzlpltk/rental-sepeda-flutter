import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/commons/utils.dart';
import 'package:rental_sepeda_flutter/components/balance_box.dart';
import 'package:rental_sepeda_flutter/components/custom_button.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/models/order_model.dart';
import 'package:rental_sepeda_flutter/providers/app_provider.dart';
import 'package:rental_sepeda_flutter/services/order_services.dart';

class CheckoutPage extends StatelessWidget {
  final Order order;

  const CheckoutPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isProcessing = ValueNotifier(false);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<AppProvider>(context, listen: false).sync();
        },
        child: ScreenTemplate(
          title: "Pembayaran",
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  BalanceBox(),
                  SizedBox(height: 20),
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
                  SizedBox(height: 12),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ValueListenableBuilder<bool>(
                      valueListenable: isProcessing,
                      builder: (context, value, _) => CustomButton(
                        text: "Bayar sekarang",
                        onPressed: order.total >
                                    Provider.of<AppProvider>(context,
                                            listen: false)
                                        .user!
                                        .balance ||
                                value
                            ? null
                            : () async {
                                isProcessing.value = true;
                                Order newOrder =
                                    await OrderServices.create(order);
                                isProcessing.value = false;
                                Navigator.pop(context);
                                Navigator.pushNamed(context, Routes.detailOrder,
                                    arguments: newOrder);
                              },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

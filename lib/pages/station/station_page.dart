import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/commons/utils.dart';
import 'package:rental_sepeda_flutter/components/custom_button.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/components/specification_box.dart';
import 'package:rental_sepeda_flutter/models/order_model.dart';
import 'package:rental_sepeda_flutter/models/station_model.dart';
import 'package:rental_sepeda_flutter/providers/app_provider.dart';

class StationPage extends StatelessWidget {
  final Station station;

  const StationPage({
    Key? key,
    required this.station,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> days = ValueNotifier(1);

    return Scaffold(
      body: ScreenTemplate(
        title: station.name,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: station.specs.photoURL.isEmpty
                    ? Image.asset('assets/image/cycle.png')
                    : Image.network(station.specs.photoURL),
              ),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Lama Sewa", style: headline2Style),
                    SizedBox(
                      width: 140,
                      child: ValueListenableBuilder<int>(
                        valueListenable: days,
                        builder: (context, value, _) => DropdownButton<int>(
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down),
                          value: value,
                          iconSize: 24,
                          onChanged: (int? newValue) {
                            if (newValue != null) {
                              days.value = newValue;
                            }
                          },
                          items: List.generate(7, (index) => index + 1)
                              .map((int value) => DropdownMenuItem<int>(
                                    value: value,
                                    child: Text("$value Hari"),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    Text("Harga", style: headline2Style),
                    SizedBox(height: 10),
                    Container(
                      width: 140,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.black12,
                      ),
                      child: ValueListenableBuilder<int>(
                        valueListenable: days,
                        builder: (context, value, _) => Text(
                          toIDR(station.discountPrice * value),
                          style: headline3Style,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      child: ValueListenableBuilder<int>(
                        valueListenable: days,
                        builder: (context, value, _) => CustomButton(
                          text: "Pesan Sekarang",
                          onPressed: station.discountPrice * value >
                                      Provider.of<AppProvider>(context,
                                              listen: false)
                                          .user!
                                          .balance &&
                                  station.totalCycles > 0
                              ? null
                              : () {
                                  Navigator.pushNamed(context, Routes.checkout,
                                      arguments: Order(
                                        id: "",
                                        price: station.discountPrice,
                                        days: value,
                                        createdAt: DateTime.now(),
                                        expiredAt: DateTime.now().add(
                                          Duration(hours: value * 24 + 12),
                                        ),
                                        station: station,
                                        user: Provider.of<AppProvider>(context,
                                                listen: false)
                                            .user!,
                                      ));
                                },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          Text("Spesifikasi", style: headline2Style),
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            children: [
              SpecificationsBox(
                iconData: Icons.timer,
                caption: "Usage",
                value: "${station.specs.usage} Months",
              ),
              SpecificationsBox(
                iconData: Icons.autorenew,
                caption: "Rent",
                value: "${station.specs.rent} times",
              ),
              SpecificationsBox(
                iconData: Icons.av_timer_rounded,
                caption: "Repaired",
                value: "${station.specs.repaired} times",
              ),
              SpecificationsBox(
                iconData: Icons.speed,
                caption: "Speed",
                value: "${station.specs.speed} km/hour",
              ),
              SpecificationsBox(
                iconData: Icons.battery_charging_full_rounded,
                caption: "Battery",
                value: "${station.specs.battery}-10 hour",
              ),
              SpecificationsBox(
                iconData: Icons.chair_alt_outlined,
                caption: "Seats",
                value: "${station.specs.seats} seats",
              ),
            ],
          )
        ],
      ),
    );
  }
}

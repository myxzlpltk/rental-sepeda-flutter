import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/components/custom_button.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/components/specification_box.dart';

class StationPage extends StatelessWidget {
  final int id;

  const StationPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTemplate(
        title: "Station " + id.toString() + "'s",
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/image/cycle.png'),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hour",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    width: 140,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      value: 'One',
                      iconSize: 24,
                      onChanged: (String? newValue) {},
                      items: <String>['One', 'Two', 'Three', 'Four', 'Five']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Text(
                    "Price",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 140,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black12,
                    ),
                    child: Text(
                      "IDR 20.000",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    child: CustomButton(
                        text: "Book now",
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.checkout);
                        }),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 8),
          Text("Specifications", style: Theme.of(context).textTheme.headline2),
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            children: const [
              SpecificationsBox(
                iconData: Icons.timer,
                caption: "Usage",
                value: "2 Months",
              ),
              SpecificationsBox(
                iconData: Icons.autorenew,
                caption: "Usage",
                value: "40 times",
              ),
              SpecificationsBox(
                iconData: Icons.av_timer_rounded,
                caption: "Usage",
                value: "2 times",
              ),
              SpecificationsBox(
                iconData: Icons.speed,
                caption: "Usage",
                value: "28 km/hour",
              ),
              SpecificationsBox(
                iconData: Icons.battery_charging_full_rounded,
                caption: "Battery",
                value: "5-10 hour",
              ),
              SpecificationsBox(
                iconData: Icons.chair_alt_outlined,
                caption: "Seats",
                value: "2 seats",
              ),
            ],
          )
        ],
      ),
    );
  }
}

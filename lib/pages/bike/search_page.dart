import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/components/custom_button.dart';
import 'package:rental_sepeda_flutter/components/location_box.dart';
import 'package:rental_sepeda_flutter/components/text_icon.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Center(
              child: Text("Insert map here"),
            ),
          ),
          Container(
            height: 120,
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            decoration: BoxDecoration(gradient: customGradientBlueToGreen),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LocationBox(
                  iconData: Icons.pin_drop_outlined,
                  text: "Jl. in aja ya bang no.69",
                ),
                SizedBox(height: 12),
                LocationBox(
                  iconData: Icons.pin_drop_rounded,
                  text: "Jl. in aja ya bang no.69",
                ),
                SizedBox(height: 12),
                Row(
                  children: const [
                    TextIcon(
                      iconData: Icons.home,
                      text: "10 Rentals near you",
                    ),
                    Spacer(),
                    TextIcon(
                      iconData: Icons.pin_drop_rounded,
                      text: "10 Bikes Available",
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned.fill(
            bottom: 20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 260,
                height: 140,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            height: 73,
                            width: 110,
                            image: AssetImage('assets/image/card_banner.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Station 1's Bike",
                              style: headline2Style.copyWith(color: blueColor),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Open 9.00 - 18.00",
                              style: bodyText1Style.copyWith(color: blueColor),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "5 Bikes Available",
                              style: bodyText1Style.copyWith(color: blueColor),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 6),
                    CustomButton(onPressed: () {}, text: "See Details")
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

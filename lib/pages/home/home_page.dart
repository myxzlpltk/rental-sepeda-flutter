import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/components/countdown.dart';
import 'package:rental_sepeda_flutter/components/custom_button.dart';
import 'package:rental_sepeda_flutter/components/station_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          top: 0,
          right: 0,
          height: 180,
          width: 130,
          child: SvgPicture.asset('assets/svg/home_decoration.svg'),
        ),
        SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "Selamat datang, Megumin",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: blueColor),
              ),
              SizedBox(height: 2),
              Text(
                "Let’s find and book the Bike for You! ",
                style: TextStyle(
                  color: blueColor,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Color(0xFFFBA73F),
                            ),
                            child: Text(
                              "Exclusive Offer",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: whiteColor),
                            ),
                          ),
                          SizedBox(width: 8),
                          Countdown(
                            dateTime: DateTime.now().add(Duration(minutes: 2)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Station 1's Bike",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            Icons.pin_drop,
                            size: 14,
                            color: Colors.black38,
                          ),
                          SizedBox(width: 4),
                          Text("H5 Building",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            Icons.attach_money_rounded,
                            size: 14,
                            color: Colors.black38,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "IDR 30.000/hour",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          SizedBox(width: 18),
                          Text(
                            "IDR 20.000/hour",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      CustomButton(
                        text: "Book Now",
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.checkout);
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/image/cycle.png',
                    width: 101,
                    height: 115,
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                child: TextField(
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    labelText: 'Search stations',
                    hintText: 'Search stations',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      borderSide: BorderSide(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Nearby Station",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 184,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                  itemCount: 3,
                  itemBuilder: (context, index) => StationCard(
                    stationID: 1,
                    stationName: "Station $index",
                    stationRange: 50,
                    stationAddress: "H5 Building",
                    bikesAvailable: 23,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Today's Promo",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

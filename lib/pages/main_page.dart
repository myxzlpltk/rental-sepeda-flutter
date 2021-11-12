import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/components/custom_button.dart';
import 'package:rental_sepeda_flutter/components/station_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          top: 0,
          right: 0,
          height: 225,
          width: 130,
          child: SvgPicture.asset('assets/svg/home_decoration.svg'),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          child: ListView(
            children: <Widget>[
              Text(
                "Selamat datang, Megumin",
                style: TextStyle(
                  color: blueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Let’s find and book the Bike for You! ",
                style: TextStyle(
                  color: blueColor,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Color(0xFFFBA73F),
                            ),
                            child: Text(
                              "Exclusive Offer",
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            decoration: BoxDecoration(
                              gradient: customGradientBlueToGreen,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Color(0xFFFBA73F),
                            ),
                            child: Text(
                              "00",
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            ":",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 2),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            decoration: BoxDecoration(
                              gradient: customGradientBlueToGreen,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Color(0xFFFBA73F),
                            ),
                            child: Text(
                              "00",
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            ":",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 2),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            decoration: BoxDecoration(
                              gradient: customGradientBlueToGreen,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Color(0xFFFBA73F),
                            ),
                            child: Text(
                              "00",
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Station 1's Bike",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: const [
                          Icon(
                            Icons.pin_drop,
                            size: 14,
                            color: Colors.black38,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "H5 Building",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: const [
                          Icon(
                            Icons.attach_money_rounded,
                            size: 14,
                            color: Colors.black38,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "IDR 30.000/hour",
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: const [
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            "IDR 20.000/hour",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      CustomButton(
                        text: "Book Now",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/image/cycle.png',
                    width: 101,
                    height: 115,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  obscureText: true,
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
              SizedBox(
                height: 25,
              ),
              Text(
                "Nearby Station",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 184,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const <Widget>[
                    StationCard(
                      stationID: 1,
                      stationName: "Station1",
                      stationRange: 50,
                      stationAddress: "H5 Building",
                      bikesAvailable: 23,
                    ),
                    StationCard(
                      stationID: 1,
                      stationName: "Station1",
                      stationRange: 50,
                      stationAddress: "H5 Building",
                      bikesAvailable: 23,
                    ),
                    StationCard(
                      stationID: 1,
                      stationName: "Station1",
                      stationRange: 50,
                      stationAddress: "H5 Building",
                      bikesAvailable: 23,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Today's Promo",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(
            'assets/svg/home_decoration.svg',
            height: ScreenUtil().setHeight(180),
            width: ScreenUtil().setWidth(130),
          ),
        ),
        SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: _welcomeSection(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: _specialOffer(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: _searchBox(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: _nearbyStation(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: _todayPromo(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _welcomeSection(BuildContext context) {
    return Wrap(
      runSpacing: 2,
      children: [
        Text(
          "Selamat datang, Megumin",
          style:
              Theme.of(context).textTheme.headline2!.copyWith(color: blueColor),
        ),
        Text(
          "Let’s find and book the Bike for You! ",
          style: TextStyle(
            color: blueColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _specialOffer(BuildContext context) {
    return Row(
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
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
    );
  }

  Widget _searchBox(BuildContext context) {
    return SizedBox(
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
    );
  }

  Widget _nearbyStation(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Nearby Station",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) => StationCard(
              stationID: 1,
              stationName: "Station $index",
              stationRange: 50,
              stationAddress: "H5 Building",
              bikesAvailable: 23,
            ),
          ),
        ),
      ],
    );
  }

  Widget _todayPromo(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: const [
        Text(
          "Today's Promo",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}

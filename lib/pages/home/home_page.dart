import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/commons/utils.dart';
import 'package:rental_sepeda_flutter/components/countdown.dart';
import 'package:rental_sepeda_flutter/components/custom_button.dart';
import 'package:rental_sepeda_flutter/components/station_card.dart';
import 'package:rental_sepeda_flutter/models/order_model.dart';
import 'package:rental_sepeda_flutter/providers/app_provider.dart';
import 'package:rental_sepeda_flutter/providers/dashboard/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(),
      builder: (context, _) => RefreshIndicator(
        onRefresh: Provider.of<HomeProvider>(context, listen: false).refresh,
        child: Stack(
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
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: _nearbyStation(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _welcomeSection(BuildContext context) {
    return Wrap(
      runSpacing: 2,
      children: [
        Consumer<AppProvider>(
          builder: (context, state, _) => Text(
            "Selamat datang, ${state.user!.name}",
            style: headline2Style.copyWith(
              color: blueColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Text(
          "Ayo cari dan pesan sepeda listrik untukmu!",
          style: TextStyle(
            color: blueColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _specialOffer(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, state, _) {
      if (state.promo == null) {
        return Column(
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
                    "Penawaran Ekslusif",
                    style: bodyText1Style.copyWith(color: whiteColor),
                  ),
                ),
                SizedBox(width: 8),
                Countdown(dateTime: DateTime.now()),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Tidak ada promo untuk saat ini",
              style: headline3Style,
            ),
            SizedBox(height: 16),
          ],
        );
      } else {
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
                        "Penawaran Ekslusif",
                        style: bodyText1Style.copyWith(color: whiteColor),
                      ),
                    ),
                    SizedBox(width: 8),
                    Countdown(dateTime: state.promo!.promo.expiredAt!),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  state.promo!.name,
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
                    Text(state.promo!.address, style: bodyText1Style),
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
                      "${toIDR(state.promo!.specs.price)}/hari",
                      style: bodyText1Style.copyWith(
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
                      "${toIDR(state.promo!.discountPrice)}/hari",
                      style: bodyText2Style.copyWith(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                CustomButton(
                  text: "Pesan Sekarang",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.checkout,
                        arguments: Order(
                          id: "",
                          price: state.promo!.discountPrice,
                          days: 1,
                          expiredAt: DateTime.now().add(
                            Duration(days: 1, hours: 12),
                          ),
                          station: state.promo!,
                          user: Provider.of<AppProvider>(context, listen: false)
                              .user!,
                        ));
                  },
                ),
              ],
            ),
            Spacer(),
            Image(
              image: (state.promo!.specs.photoURL.isEmpty
                      ? AssetImage('assets/image/cycle.png')
                      : NetworkImage(state.promo!.specs.photoURL))
                  as ImageProvider<Object>,
              width: 101,
              height: 115,
            ),
            Spacer(),
          ],
        );
      }
    });
  }

  Widget _nearbyStation(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Stasiun Terdekat",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 144,
          width: MediaQuery.of(context).size.width,
          child: Consumer<HomeProvider>(
            builder: (context, state, _) => ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: state.stations.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => StationCard(
                station: state.stations[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/components/balance_box.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/components/setting_item.dart';
import 'package:rental_sepeda_flutter/providers/app_provider.dart';
import 'package:rental_sepeda_flutter/services/auth_services.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Provider.of<AppProvider>(context, listen: false).sync();
      },
      child: ScreenTemplate(
        title: "Pengaturan",
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Consumer<AppProvider>(
                builder: (context, state, _) => CircleAvatar(
                  radius: 24,
                  backgroundImage: state.user!.photoURL.isNotEmpty
                      ? NetworkImage(state.user!.photoURL)
                      : AssetImage("assets/image/profile_pict.jpg")
                          as ImageProvider,
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<AppProvider>(
                    builder: (context, app, _) => Text(
                      app.user!.name,
                      style: headline2Style.copyWith(color: Colors.black87),
                    ),
                  ),
                  SizedBox(height: 4),
                  Consumer<AppProvider>(
                    builder: (context, app, _) => Text(
                      app.user!.email,
                      style: headline3Style.copyWith(color: Colors.black87),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          BalanceBox(),
          SizedBox(height: 20),
          Text("Pilih Menu", style: headline2Style),
          SettingItem(
            text: "Dompet Saya",
            iconData: Icons.account_balance_wallet,
            onPressed: () {
              Navigator.pushNamed(context, Routes.wallet);
            },
          ),
          SettingItem(
            text: "Minta Bantuan",
            iconData: Icons.help,
            onPressed: () async {
              if (await canLaunch(emailURL)) {
                await launch(emailURL);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "Tidak bisa mengirim surel. Hubungi kami di $emailAddress"),
                ));
              }
            },
          ),
          SettingItem(
            text: "Umpan Balik Pengguna",
            iconData: Icons.feedback,
            onPressed: () => LaunchReview.launch(
              androidAppId: 'com.myxzlpltk.rental_sepeda_flutter',
            ),
          ),
          SettingItem(
            text: "Tentang Aplikasi",
            iconData: Icons.info_rounded,
            onPressed: () {
              Navigator.pushNamed(context, Routes.infoApp);
            },
          ),
          SettingItem(
            text: "Keluar",
            iconData: Icons.logout,
            onPressed: () {
              AuthServices.signOut().then((value) =>
                  Navigator.pushReplacementNamed(context, Routes.landing));
            },
          ),
        ],
      ),
    );
  }
}

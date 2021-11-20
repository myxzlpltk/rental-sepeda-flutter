import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/components/setting_item.dart';
import 'package:rental_sepeda_flutter/providers/app_provider.dart';
import 'package:rental_sepeda_flutter/services/auth_services.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Setting",
      children: [
        SizedBox(height: 20),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Image(
                height: 90,
                width: 90,
                image: AssetImage('assets/image/profile_pict.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Megumin (めぐみん)",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.black87),
                ),
                SizedBox(height: 12),
                Text(
                  "megumin@isekai.com",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.black87),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 40),
        Text(
          "General",
          style: Theme.of(context).textTheme.headline2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingItem(
              text: "help",
              iconData: Icons.headphones_rounded,
            ),
            SettingItem(
              text: "About Application",
              iconData: Icons.info_rounded,
            ),
            SettingItem(
              text: "User Feedback",
              iconData: Icons.mark_email_read_outlined,
            ),
            SettingItem(
              text: "Keluar",
              iconData: Icons.logout,
              onPressed: () {
                AuthServices.signOut().then((_) {
                  context.read<AppProvider>().user = null;
                  Navigator.pushReplacementNamed(context, Routes.landing);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

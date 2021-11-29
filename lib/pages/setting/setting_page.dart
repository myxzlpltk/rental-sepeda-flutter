import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
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
            Consumer<AppProvider>(
              builder: (context, state, _) => CircleAvatar(
                radius: 45,
                backgroundImage: state.image != null
                    ? FileImage(state.image!)
                    : state.user!.photoURL.isNotEmpty
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
                SizedBox(height: 12),
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
        SizedBox(height: 40),
        Text(
          "General",
          style: headline2Style,
        ),
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
            AuthServices.signOut().then((value) =>
                Navigator.pushReplacementNamed(context, Routes.landing));
          },
        ),
      ],
    );
  }
}

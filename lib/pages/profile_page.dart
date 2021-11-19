import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/components/text_form_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "My Profile",
      children: <Widget>[
        Column(
          children: const [
            SizedBox(height: 50),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Image(
                height: 90,
                width: 90,
                image: AssetImage('assets/image/card_banner.png'),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 40),
            CustomTextFormField2(
              labelText: "Email",
              hintText: "Type your email here",
              initialValue: "nsmaulidi12@gmail.com",
              enabled: false,
            ),
            CustomTextFormField2(
              labelText: "Password",
              hintText: "Type your password here",
              initialValue: "blablabla",
              enabled: false,
              obscureText: true,
            ),
            CustomTextFormField2(
              labelText: "Phone Number",
              hintText: "Type your city here",
              initialValue: "+6287123456789",
              enabled: false,
            ),
            CustomTextFormField2(
              labelText: "City",
              hintText: "Type your city here",
              enabled: false,
              initialValue: "Malang",
            ),
          ],
        )
      ],
    );
  }
}

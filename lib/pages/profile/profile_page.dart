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
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage('assets/image/profile_pict.jpg'),
            ),
          ],
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
    );
  }
}

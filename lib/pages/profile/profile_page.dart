import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/components/text_form_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          enabled: true,
        ),
        CustomTextFormField2(
          labelText: "Password",
          hintText: "Type your password here",
          initialValue: "blablabla",
          enabled: true,
          obscureText: true,
        ),
        CustomTextFormField2(
          labelText: "Phone Number",
          hintText: "Type your city here",
          initialValue: "+6287123456789",
          enabled: true,
        ),
        CustomTextFormField2(
          labelText: "City",
          hintText: "Type your city here",
          enabled: true,
          initialValue: "Malang",
        ),
      ],
    );
  }
}

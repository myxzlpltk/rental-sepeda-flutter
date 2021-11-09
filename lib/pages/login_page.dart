import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/components/text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';
import 'package:rental_sepeda_flutter/components/custom_gradient_button.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSavePassword = false;
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/login.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0x99000000), Color(0x33FFFFFF)],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "New user ?",
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.register);
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: greenColor,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: <Widget>[
                        CustomTextFormField(
                          hintText: "Enter your email",
                          labelText: "Email",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          hintText: "Enter your password",
                          labelText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isPasswordVisible == true) {
                                  isPasswordVisible = false;
                                } else {
                                  isPasswordVisible = true;
                                }
                              });
                            },
                            child: isPasswordVisible
                                ? Icon(
                                    Icons.visibility_off,
                                    size: 19,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    size: 19,
                                  ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 35,
                              child: Checkbox(
                                value: isSavePassword,
                                shape: CircleBorder(),
                                activeColor: greenColor,
                                checkColor: whiteColor,
                                side: BorderSide(color: whiteColor, width: 2),
                                onChanged: (bool? value) {
                                  setState(() {
                                    isSavePassword = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "Save Password?",
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 12,
                              ),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot password",
                                style: TextStyle(
                                  color: greenColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomGradientButton(
                          text: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          width: 100,
                          height: 30,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: const <Widget>[
                            Expanded(
                              child: Divider(
                                color: whiteColor,
                                thickness: 1,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Or login with",
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Divider(
                                color: whiteColor,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icon/google.svg',
                                width: 32,
                                height: 32,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icon/facebook.svg',
                                width: 32,
                                height: 32,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

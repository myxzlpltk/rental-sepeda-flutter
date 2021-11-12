import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/components/text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_sepeda_flutter/components/custom_gradient_button.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                gradient: const LinearGradient(
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
                          "Have account ?",
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.login);
                            },
                            child: Text(
                              "Login",
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
                          hintText: "Enter your username",
                          labelText: "Username",
                        ),
                        SizedBox(
                          height: 16,
                        ),
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
                        SizedBox(
                          height: 20,
                        ),
                        CustomGradientButton(
                          text: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          width: 100,
                          height: 30,
                          onPressed: () {},
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
                              "Or sign up with",
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
                                'assets/svg/google.svg',
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
                                'assets/svg/facebook.svg',
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

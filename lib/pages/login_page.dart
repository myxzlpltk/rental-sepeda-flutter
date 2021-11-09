import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Text(
                        "New User?",
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(onPressed: () {}, child: Text("Sign up")),
                      Spacer(),
                      Text(
                        "Login",
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 32,
                          child: TextFormField(
                            style: TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: whiteColor,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              contentPadding: EdgeInsets.only(left: 20),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )),
                              hintText: 'Enter your username',
                              labelText: 'Username',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 32,
                          child: TextFormField(
                            style: TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: whiteColor,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              contentPadding: EdgeInsets.only(left: 20),
                              suffixIcon: Icon(
                                Icons.visibility,
                                size: 19,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )),
                              hintText: 'Enter your password',
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              width: 20,
                              child: Switch(value: false, onChanged: null),
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
                                  color: Colors.blue,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Or login with",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/icon/google.svg',
                              width: 32,
                              height: 32,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SvgPicture.asset(
                              'assets/icon/facebook.svg',
                              width: 32,
                              height: 32,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
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

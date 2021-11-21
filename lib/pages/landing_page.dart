import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';
import 'package:rental_sepeda_flutter/services/auth_services.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/landing.png"),
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.dstATop,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0x5561DEC0), Color(0x550A578E)],
          ),
        ),
        child: FutureBuilder(
          future: AuthServices.auth(),
          builder: (context, AsyncSnapshot<AppUser?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                Future.microtask(() =>
                    Navigator.pushReplacementNamed(context, Routes.dashboard));
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 128,
                      width: 117,
                      child: SvgPicture.asset('assets/svg/logo.svg'),
                    ),
                    SizedBox(height: 100),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.dashboard);
                      },
                      child: Text(
                        "Skip to Main",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        minimumSize: Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: whiteColor),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.register);
                      },
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: whiteColor,
                        minimumSize: Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: whiteColor),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.login);
                      },
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                );
              }
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 128,
                  width: 117,
                  child: SvgPicture.asset('assets/svg/logo.svg'),
                ),
                SizedBox(height: 100),
                CircularProgressIndicator(color: Colors.white),
              ],
            );
          },
        ),
      ),
    );
  }
}

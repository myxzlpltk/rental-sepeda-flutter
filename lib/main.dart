import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/pages/undefined_page.dart';
import 'package:rental_sepeda_flutter/providers/app_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: () => MaterialApp(
        title: "Material App",
        debugShowCheckedModeBanner: false,
        /* Routing */
        initialRoute: Routes.landing,
        onGenerateRoute: generateRoute,
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => UndefinedPage(
            name: settings.name.toString(),
          ),
        ),

        /* Locale */
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        supportedLocales: const [Locale('id')],

        /* Theme */
        // TODO: add theme here
        theme: ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
          scaffoldBackgroundColor: whiteColor,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: ScreenUtil().setSp(28),
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
            headline2: TextStyle(
              fontSize: ScreenUtil().setSp(18),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headline3: TextStyle(
              fontSize: ScreenUtil().setSp(13),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyText1: TextStyle(
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            caption: TextStyle(
              fontSize: ScreenUtil().setSp(9),
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}

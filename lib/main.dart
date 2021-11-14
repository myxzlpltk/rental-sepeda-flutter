import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: () => MaterialApp(
        title: "Material App",
        debugShowCheckedModeBanner: false,
        /* Routing */
        initialRoute: Routes.main,
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
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w900),
            headline2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            headline3: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 12.0),
            bodyText2: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
            subtitle1: TextStyle(fontSize: 9, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}

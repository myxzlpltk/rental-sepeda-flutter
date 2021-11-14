import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'pages/main_page.dart';
import 'pages/history_page.dart';
import 'pages/profile_page.dart';
import 'components/bottom_app_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MainPage();

  callback(newTab, newScreen) {
    setState(() {
      currentTab = newTab;
      currentScreen = newScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.pin_drop_outlined,
            size: 25,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: customGradientBlueToGreen,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, Routes.loading);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BottomAppItem(
                callback: callback,
                screen: MainPage(),
                tab: 0,
                currenTab: currentTab,
                icon: Icons.home,
              ),
              BottomAppItem(
                callback: callback,
                screen: HistoryPage(),
                tab: 1,
                currenTab: currentTab,
                icon: Icons.history,
              ),
              Spacer(),
              BottomAppItem(
                callback: callback,
                screen: ProfilePage(),
                tab: 2,
                currenTab: currentTab,
                icon: Icons.person,
              ),
              BottomAppItem(
                callback: callback,
                screen: HistoryPage(),
                tab: 3,
                currenTab: currentTab,
                icon: Icons.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

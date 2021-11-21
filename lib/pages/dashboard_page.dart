import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/components/bottom_app_item.dart';
import 'package:rental_sepeda_flutter/pages/history/history_page.dart';
import 'package:rental_sepeda_flutter/pages/home/home_page.dart';
import 'package:rental_sepeda_flutter/pages/profile/profile_page.dart';
import 'package:rental_sepeda_flutter/pages/setting/setting_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final ValueNotifier<int> _currentTab = ValueNotifier(0);

  setCurrentTab(int i) {
    _currentTab.value = i;
    _pageController.jumpToPage(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (i) => _currentTab.value = i,
        children: const [
          HomePage(),
          HistoryPage(),
          ProfilePage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ValueListenableBuilder<int>(
                valueListenable: _currentTab,
                builder: (context, value, _) => BottomAppItem(
                  onPressed: () => setCurrentTab(0),
                  isActive: value == 0,
                  icon: Icons.home,
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: _currentTab,
                builder: (context, value, _) => BottomAppItem(
                  onPressed: () => setCurrentTab(1),
                  isActive: value == 1,
                  icon: Icons.history,
                ),
              ),
              Spacer(),
              ValueListenableBuilder<int>(
                valueListenable: _currentTab,
                builder: (context, value, _) => BottomAppItem(
                  onPressed: () => setCurrentTab(2),
                  isActive: value == 2,
                  icon: Icons.person,
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: _currentTab,
                builder: (context, value, _) => BottomAppItem(
                  onPressed: () => setCurrentTab(3),
                  isActive: value == 3,
                  icon: Icons.settings,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(Icons.pin_drop_outlined, size: 25),
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
    );
  }
}

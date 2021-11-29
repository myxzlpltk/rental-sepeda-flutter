import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/components/bottom_app_item.dart';
import 'package:rental_sepeda_flutter/pages/history/history_page.dart';
import 'package:rental_sepeda_flutter/pages/home/home_page.dart';
import 'package:rental_sepeda_flutter/pages/profile/profile_page.dart';
import 'package:rental_sepeda_flutter/pages/setting/setting_page.dart';
import 'package:rental_sepeda_flutter/providers/dashboard_provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashboardProvider>(
      create: (context) => DashboardProvider(),
      builder: (context, _) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView(
          controller: Provider.of<DashboardProvider>(context, listen: false)
              .pageController,
          onPageChanged: (i) =>
              Provider.of<DashboardProvider>(context, listen: false)
                  .currentTab = i,
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
                Consumer<DashboardProvider>(
                  builder: (context, state, _) => BottomAppItem(
                    onPressed: () => state.jumpToPage(0),
                    isActive: state.currentTab == 0,
                    icon: Icons.home,
                  ),
                ),
                Consumer<DashboardProvider>(
                  builder: (context, state, _) => BottomAppItem(
                    onPressed: () => state.jumpToPage(1),
                    isActive: state.currentTab == 1,
                    icon: Icons.history,
                  ),
                ),
                Spacer(),
                Consumer<DashboardProvider>(
                  builder: (context, state, _) => BottomAppItem(
                    onPressed: () => state.jumpToPage(2),
                    isActive: state.currentTab == 2,
                    icon: Icons.person,
                  ),
                ),
                Consumer<DashboardProvider>(
                  builder: (context, state, _) => BottomAppItem(
                    onPressed: () => state.jumpToPage(3),
                    isActive: state.currentTab == 3,
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
      ),
    );
  }
}

import 'package:services_galary/resourses/app_colors.dart';
import 'package:services_galary/resourses/app_style.dart';
import 'package:services_galary/screens/home_page_screen/home_page_screen.dart';
import 'package:services_galary/screens/loginscreen/login_screen.dart';
import 'package:services_galary/screens/myrequests_screen/my_requests_screen.dart';
import 'package:services_galary/screens/myservices_screen/my_services.dart';

import 'package:services_galary/screens/profile_screen/myprofile_screen.dart';
import 'package:services_galary/screens/splash.dart';
import 'package:services_galary/utlis/cash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resourses/app_images.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  static const List _pages = [
    HomePageScreen(),
    MyServisesScreen(),
   MyRequestedScreen(),
    MyProfileScreen()
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedIconTheme: IconThemeData(
          color: ColorManager.WHITE_COLOR,
        ),
        // unselectedItemColor: ColorManager.WHITE_COLOR,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 20),
        selectedItemColor: ColorManager.activeDotColor,
        selectedLabelStyle: TextStyle(fontSize: 20),
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.build,
            ),
            label: 'My services',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.car_crash,
            ),
            label: 'My Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'profile',
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
    ));
  }
}

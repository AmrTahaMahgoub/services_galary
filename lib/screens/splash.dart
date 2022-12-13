import 'dart:async';

import 'package:services_galary/resourses/app_colors.dart';
import 'package:services_galary/resourses/app_string.dart';
import 'package:services_galary/resourses/app_style.dart';

import 'package:services_galary/screens/loginscreen/login_screen.dart';
import 'package:services_galary/screens/navigation_button_screen/navigation_screen.dart';
import 'package:services_galary/screens/onboarding/onboarding.dart';
import 'package:services_galary/screens/signup_screen/signup_screen.dart';
import 'package:services_galary/utlis/cash_helper.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  countDownTime() {
    
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (BuildContext context) => Onboarding()));
     Timer(Duration(seconds: 3), () {
           String? uid =  CacheHelper.getData("logintoken");
        if (uid != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavigationScreen()),
          );
        } else if (uid == null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Onboarding()),
          );
        }
     });
      
  }

  @override
  void initState() {
   

    super.initState();
    //  Timer(Duration(seconds: 3), () async {
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (BuildContext context) => Onboarding()));
    // });
    countDownTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.GREEN_COLOR,
      body: Center(child: Text(AppStringManager.monoServices, style: AppTextStyleManager.bold24)),
    );
  }
}

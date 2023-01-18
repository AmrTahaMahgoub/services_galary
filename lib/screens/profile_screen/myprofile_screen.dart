import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:services_galary/bloc/LoginBloc/login_bloc.dart';

import 'package:services_galary/models/auth/login_model.dart';
import 'package:services_galary/resourses/app_colors.dart';
import 'package:services_galary/resourses/app_images.dart';
import 'package:services_galary/screens/profile_screen/widgets/custom_profile_info.dart';
import 'package:services_galary/utlis/cash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utlis/routes.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            // fit: StackFit.expand,
            children: [
              Container(
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30).r,
                  ),
                ),
              ),

              // SizedBox(height: 500,),

              Positioned(
                top: 65.r,
                left: 190.r,
                child: CircleAvatar(
                  backgroundColor: ColorManager.WHITE_COLOR,
                  radius: 40.r,
                  child: Image.asset(AppImagesManager.profileImage,height: 50.h,width: 50.w),
                ),
              ),
            ],
          ),
          // SizedBox(height: 100,),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 70, 20, 50).r,
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  CustomProfileInfo(
                    icondata: Icons.wallet,
                    title: 'wallet',
                  ),
                  CustomProfileInfo(
                    icondata: Icons.navigation,
                    title: 'address',
                  ),
                  CustomProfileInfo(
                    icondata: Icons.favorite,
                    title: 'favorite',
                  ),
                  CustomProfileInfo(
                    icondata: Icons.share,
                    title: 'share code',
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomProfileInfo(
                    icondata: Icons.album_outlined,
                    title: 'about mono',
                  ),
                  CustomProfileInfo(
                    icondata: Icons.contact_mail,
                    title: 'contact us',
                  ),
                  CustomProfileInfo(
                    icondata: Icons.settings,
                    title: 'setting',
                  ),
                  CustomProfileInfo(
                    onTap: ()async {
                     await CacheHelper.removeData('logintoken');
                     // await CacheHelper.removeData('signuptoken');

                    await Navigator.popAndPushNamed(context, Log_In);
                    },
                    icondata: Icons.logout,
                    title: 'log out',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

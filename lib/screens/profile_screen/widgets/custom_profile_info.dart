import 'package:services_galary/resourses/app_colors.dart';
import 'package:services_galary/resourses/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileInfo extends StatelessWidget {
  CustomProfileInfo({required this.icondata, required this.title, this.onTap});
  IconData? icondata;
  String? title;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icondata, color: ColorManager.labelInput, size: 35.r),
          SizedBox(
            width: 20.r,
          ),
          Text(
            title!,
            style: AppTextStyleManager.bold15,
          )
        ],
      ),
    );
  }
}

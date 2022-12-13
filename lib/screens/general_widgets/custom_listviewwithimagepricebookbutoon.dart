

import 'package:services_galary/resourses/app_colors.dart';
import 'package:services_galary/resourses/app_images.dart';
import 'package:services_galary/resourses/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListviewwithImagePriceAndBookButton extends StatelessWidget {
  const CustomListviewwithImagePriceAndBookButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(10).r,
        scrollDirection: Axis.vertical,
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(2).r,
              height: 70.h,
              width: double.infinity,
              // color: Colors.red,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImagesManager.cameraImage),
                  Column(
                    children: [
                      Text('Design of a childrens'),
                      Text('room for two children'),
                      Text('interior design'),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text('256 EG'),
                      Text('STARS '),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 70.0.w,
                          height: 25.0.h,
                          decoration: BoxDecoration(
                            color: ColorManager.blue,
                            //border: new Border.all( width: 2.0),
                            borderRadius:
                                 BorderRadius.circular(8.0).r,
                          ),
                          child: Center(
                            child: Text(
                              'Book',
                              style: AppTextStyleManager.bold12
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
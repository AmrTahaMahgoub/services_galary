import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedBlueButton extends StatelessWidget {
  CustomElevatedBlueButton(this.onPressed
   
  );
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0).r)),
        ),
        onPressed: onPressed,
        child: Text('add service'));
  }
}

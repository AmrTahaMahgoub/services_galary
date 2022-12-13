import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomElevationButton extends StatelessWidget {
  CustomElevationButton(
      {required this.text,
      this.onpressed,
      this.textStyle,
      this.foregrounColor,
      this.backgroundColor});
  final String text;
  final void Function()? onpressed;
  final TextStyle? textStyle;
  final  Color? foregrounColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor:
               foregrounColor, //change background color of button
          backgroundColor: backgroundColor, //change text color of button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
        onPressed: onpressed);
  }
}

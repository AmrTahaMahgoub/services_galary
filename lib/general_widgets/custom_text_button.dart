import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
   CustomTextButton({
    this.onpressed,
    required this.text,
    this.textstyle
   
  }) ;
  final String text;
  final TextStyle? textstyle;
  final void Function()? onpressed;


  @override
  Widget build(BuildContext context) {
    return TextButton(
      child:  Text(
        text,
        style: textstyle,
      ),
      onPressed:onpressed
    );
  }
}
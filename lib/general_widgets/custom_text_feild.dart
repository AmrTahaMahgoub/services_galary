import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({this.controller, this.label, this.validation,  this.obsecuretext=false, this.suffixIcon});
  final TextEditingController? controller;
  final String? label;
  final String? Function(String?)? validation;
   bool obsecuretext;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
     
      obscureText:obsecuretext ,
      validator: validation,
      controller: controller,
      decoration: InputDecoration(
           border: OutlineInputBorder(
                     
                      borderRadius: BorderRadius.all(Radius.circular(40.0).r),
                      borderSide: BorderSide(color: Colors.white24)
                      //borderSide: const BorderSide(),
                    ),
        
        suffixIcon: suffixIcon,
       
        labelText: label,
      ),
    );
  }
}

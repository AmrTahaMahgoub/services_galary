import 'package:services_galary/resourses/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchTextFormFeild extends StatelessWidget {
  const CustomSearchTextFormFeild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.solid,
          ),
        ),
        contentPadding: EdgeInsets.only(left: 20),
        hintText: "search",
        hintStyle: AppTextStyleManager.SearchStyle,
        filled: true,
        fillColor: Colors.white,
        prefixIcon:
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        suffixIcon:
            IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
        suffixIconConstraints: BoxConstraints(
          minWidth: 50,
        ),
      ),
    );
  }
}
import 'dart:convert';
import 'dart:developer';

import 'package:services_galary/bloc/sign_up/sign_up_bloc.dart';

import 'package:services_galary/models/get_all_cities_model.dart';

import 'package:services_galary/screens/navigation_button_screen/navigation_screen.dart';

import 'package:services_galary/utlis/cash_helper.dart';

import 'package:services_galary/general_widgets/custom_elevation_button.dart';

import 'package:services_galary/general_widgets/custom_text_feild.dart';
import 'package:services_galary/resourses/app_colors.dart';
import 'package:services_galary/resourses/app_images.dart';
import 'package:services_galary/resourses/app_string.dart';
import 'package:services_galary/resourses/app_style.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
  /**** */
  int? cityId;
  List citiesList = [];

  Future getAllCities() async {
    var response =
        await http.get(Uri.parse('https://api.monoservices.net/v1/cities/'));
    var data = response.body;
    // log('response body ${data}');
    var allCities = AllCitiesList.fromJson(jsonDecode(data)).allCitiesList;

    // log('${allCities}');
    setState(() {
      citiesList = allCities;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCities();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 150.h),
       
          Container(
            padding: const EdgeInsets.all(10).r,
            child: CustomTextFeild(
                controller: nameController,
                label: AppStringManager.userName,
                validation: (value) {
                  if (value!.isEmpty) {
                    return AppStringManager.feildRequired;
                  } else {
                    return null;
                  }
                }),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0).r,
            child: CustomTextFeild(
                controller: emailController,
                label: AppStringManager.email,
                validation: (value) {
                  if (value!.isEmpty) {
                    return AppStringManager.feildRequired;
                  } else {
                    return null;
                  }
                }),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0).r,
            child: CustomTextFeild(
                suffixIcon: GestureDetector(
                  onTap: () {
                    _togglevisibility();
                  },
                  child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                    color: ColorManager.GreyTextColor,
                  ),
                ),
                controller: passwordController,
                 obsecuretext: !_showPassword,
                label: AppStringManager.password,
                validation: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    return 'password must be more than 8 charachters';
                  } else {
                    return null;
                  }
                }),
          ),
          SizedBox(height: 10.h),
          Container(
            margin: const EdgeInsets.all(15.0).r,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0).r,
            decoration: BoxDecoration(
              color: ColorManager.GreyTextColor,
              border: Border.all(color: Colors.white),
             borderRadius:BorderRadius.circular(20).r,
            ),
            child: DropdownButton(
                dropdownColor: ColorManager.colorEEE,
                alignment: AlignmentDirectional.center,
                hint: Text('city name',style: AppTextStyleManager.bold14),
                value: cityId,
                items: citiesList
                    .map((e) => DropdownMenuItem(
                          child: Center(child: Text('${e['name']}',style: AppTextStyleManager.bold14)),
                          value: e['id'],
                        ))
                    .toList(),
                onChanged: ((newvalue) {
                  cityId = newvalue as int?;
                  print('$cityId');
                  getAllCities();
                })),
          ),
          Container(
              height: 70.h,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0).r,
              child: BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) async {
                  if (state is SignUpLoading) {
                  } else if (state is SignUploaded) {
                    var saveSignUptoken =
                        await CacheHelper.saveData("signuptoken", state.token);
                    log('state token ${state.token}');

                    log('saveSignUptoken ${saveSignUptoken}');

                    if (saveSignUptoken != null) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => NavigationScreen()),
                        ),
                      );
                    } else {
                      var snackBar = SnackBar(
                          content: Text('this email has already been taken'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      log('in else condition $saveSignUptoken');
                    }
                  } else if (state is SignUpfailure) {
                    log("${state.error}");
                    var snackBar = SnackBar(content: Text('${state.error}'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  if (state is SignUpLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CustomElevationButton(
                      text: AppStringManager.signUp,
                      backgroundColor: ColorManager.PRIMARY_COLOR,
                      foregrounColor: ColorManager.SECONDRY_COLOR,
                      onpressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<SignUpBloc>(context)
                              .add(SignUpSuccessEvent(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                            cityId!,
                          ));
                        }
                      },
                      textStyle: AppTextStyleManager.bold15);
                },
              )),
        ],
      ),
    ));
  }
}

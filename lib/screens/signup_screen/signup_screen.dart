import 'dart:convert';
import 'dart:developer';

import 'package:services_galary/bloc/LoginBloc/login_bloc.dart';
import 'package:services_galary/bloc/signupbloc/sign_up_bloc.dart';
import 'package:services_galary/models/get_all_cities_model.dart';
import 'package:services_galary/repository/auth/signup_repo.dart';

import 'package:services_galary/screens/loginscreen/login_screen.dart';
import 'package:services_galary/screens/navigation_button_screen/navigation_screen.dart';
import 'package:services_galary/utlis/cash_helper.dart';
import 'package:services_galary/utlis/routes.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:services_galary/general_widgets/custom_elevation_button.dart';
import 'package:services_galary/general_widgets/custom_text_button.dart';
import 'package:services_galary/general_widgets/custom_text_feild.dart';
import 'package:services_galary/resourses/app_colors.dart';
import 'package:services_galary/resourses/app_images.dart';
import 'package:services_galary/resourses/app_string.dart';
import 'package:services_galary/resourses/app_style.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  //TextEditingController cityidController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    return BlocProvider(
        create: (BuildContext context) =>
            SignUpBloc(SignUpRepository(), EmailandPasswordRepo(), EmailRepo()),
        child: Scaffold(
            body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10).r,
                  child: Image.asset(AppImagesManager.signUpimage)),
              Container(
                padding: const EdgeInsets.all(10).r,
                child: CustomTextFeild(
                    controller: nameController,
                    label: AppStringManager.userName,
                    validation: (value) {
                      if (value!.isEmpty || value == null) {
                        return AppStringManager.feildRequired;
                      } else {
                        return null;
                      }
                    }),
              ),
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
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0).r,
                child: CustomTextFeild(
                    controller: passwordController,
                    label: AppStringManager.password,
                    validation: (value) {
                      if (value!.isEmpty || value == null) {
                        return AppStringManager.feildRequired;
                      } else {
                        return null;
                      }
                    }),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0).r,
                child: DropdownButton(
                    hint: Text('city name'),
                    value: cityId,
                    items: citiesList
                        .map((e) => DropdownMenuItem(
                              child: Text('${e['name']}'),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('loading....')));
                      } else if (state is SignUpSuccess) {
                        var saveSignUptoken = await CacheHelper.saveData(
                            "signuptoken", state.userModel.data!.token);

                        if (saveSignUptoken != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => NavigationScreen()),
                            ),
                          );
                          var snackBar = SnackBar(
                              content: Text('${state.userModel.message}'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else if (state is SignUpEmailandPaswwordError) {
                        var snackBar = SnackBar(
                            content: Text(
                                '${state.emailAndPaswwordError.message}${state.emailAndPaswwordError.errors!.email![0]} ${state.emailAndPaswwordError.errors!.password![0]}'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (state is SignUpwithEmailError) {
                        log('emaaaaaaaaaaaaaaaail error${state.emailError.email![0]}}');

                        var snackBar = SnackBar(
                            content: Text('${state.emailError.email![0]}'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    builder: (context, state) {
                      return CustomElevationButton(
                          text: AppStringManager.signUp,
                          backgroundColor: ColorManager.PRIMARY_COLOR,
                          foregrounColor: ColorManager.SECONDRY_COLOR,
                          onpressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<SignUpBloc>(context).add(
                                  SignUpSuccessEvent(
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
        )));
  }
}

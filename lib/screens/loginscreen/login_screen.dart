import 'dart:async';
import 'dart:developer';

import 'package:services_galary/general_widgets/custom_elevation_button.dart';
import 'package:services_galary/general_widgets/custom_text_button.dart';
import 'package:services_galary/general_widgets/custom_text_feild.dart';
import 'package:services_galary/repository/auth/login_repo.dart';
import 'package:services_galary/resourses/app_colors.dart';
import 'package:services_galary/resourses/app_images.dart';
import 'package:services_galary/resourses/app_string.dart';
import 'package:services_galary/resourses/app_style.dart';

import 'package:services_galary/screens/signup_screen/signup_screen.dart';
import 'package:services_galary/utlis/routes.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/LoginBloc/login_bloc.dart';
import '../../utlis/cash_helper.dart';
import '../navigation_button_screen/navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
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
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0).r,
              child: CustomTextFeild(
                  controller: emailController,
                  label: AppStringManager.email,
                  validation: (value) {
                    if (value!.isEmpty || value == null) {
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
                  obsecuretext: !_showPassword,
                  controller: passwordController,
                  label: AppStringManager.password,
                  validation: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return 'password must be more than 8 charachters';
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(height: 200.h),
            Container(
              height: 70.h,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0).r,
              child: BlocConsumer<LoginBlocBloc, LoginBlocState>(
                listener: (context, state) async {
                  if (state is LoginBlocLoading) {
                    var snackBar = const SnackBar(
                        duration: Duration(microseconds: 10),
                        backgroundColor: Colors.transparent,
                        content: Center(
                            child: CircularProgressIndicator(
                          color: Colors.red,
                        )));

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else if (state is LoginBlocSuccess) {
                    log('state token ${state.token.message!.token}');
                    var saveLogintoken = await CacheHelper.saveData(
                        "logintoken", state.token.message!.token);

                    var gettoken = await CacheHelper.getData("logintoken");

                    if (gettoken != null) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const NavigationScreen(),
                        ),
                      );
                    } else {
                      var snackBar = const SnackBar(
                          content: Text('your data do not match our records'));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  } else if (state is LoginFaluireState) {
                    var snackBar =
                        SnackBar(content: Text('${state.error.errors!.data}'));
                    log('state error: ${state.error.errors!.data}');
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  return CustomElevationButton(
                      text: AppStringManager.login,
                      backgroundColor: ColorManager.PRIMARY_COLOR,
                      foregrounColor: const Color.fromRGBO(239, 239, 239, 1),
                      onpressed: () async {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<LoginBlocBloc>(context).add(
                              LoginSuccessEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                        }
                      },
                      textStyle: AppTextStyleManager.bold15);
                },
              ),
            ),
            Row(
              children: <Widget>[
                const Text(AppStringManager.doesnotHaveAccount),
                CustomTextButton(
                    text: AppStringManager.signUp,
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const SignUpScreen(),
                        ),
                      );
                    },
                    textstyle: AppTextStyleManager.bold15),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}

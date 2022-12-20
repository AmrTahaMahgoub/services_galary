import 'package:services_galary/bloc/LoginBloc/login_bloc.dart';
import 'package:services_galary/bloc/all_categories/all_categories_bloc.dart';
import 'package:services_galary/bloc/create_service/create_srevice_bloc.dart';
import 'package:services_galary/bloc/get_myservice/get_my_service_bloc.dart';

import 'package:services_galary/bloc/signupbloc/sign_up_bloc.dart';
import 'package:services_galary/repository/all_categories_repo.dart';
import 'package:services_galary/repository/all_data_repo.dart';
import 'package:services_galary/repository/all_services_repo.dart';
import 'package:services_galary/repository/auth/login_repo.dart';
import 'package:services_galary/repository/auth/signup_repo.dart';
import 'package:services_galary/repository/create_service_repo.dart';
import 'package:services_galary/repository/get_my_data_service_repo.dart';
import 'package:services_galary/repository/get_my_services_repo.dart';

import 'package:services_galary/screens/home_page_screen/home_page_screen.dart';
import 'package:services_galary/screens/test_screen.dart';

import 'package:services_galary/utlis/cash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/all_services/all_services_bloc.dart';
import 'utlis/routes.dart';

//AllServicesBloc
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, mediaQuery) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LoginBlocBloc>(
              create: (BuildContext context) =>
                  LoginBlocBloc(LoginRepository()),
            ),
            BlocProvider<AllServicesBloc>(
                create: (BuildContext context) =>
                    AllServicesBloc(GetAllDataRepo())
                      ..add(AllServicesLoadedEvent())),
            BlocProvider<CreateSreviceBloc>(
              create: (BuildContext context) =>
                  CreateSreviceBloc(CreateServiceRepo()),
            ),
            BlocProvider<GetMyServiceBloc>(
              create: (BuildContext context) =>
                  GetMyServiceBloc(GetMyDataServicesRepo())
                    ..add(GetMyServicesSuccessEvent()),
            ),
            BlocProvider<AllCategoriesBloc>(
              create: (BuildContext context) =>
                  AllCategoriesBloc(GetAllCategoriesRepo())
                    ..add(AllCategoriesEventSuccess()),
            ),
            BlocProvider<CreateSreviceBloc>(
              create: (BuildContext context) =>
                  CreateSreviceBloc(CreateServiceRepo()),
            ),
          ],
          child: MaterialApp(
          //  home: TestScreen(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      },
    );
  }
}

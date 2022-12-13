import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:services_galary/bloc/create_service/create_srevice_bloc.dart';
import 'package:services_galary/bloc/get_myservice/get_my_service_bloc.dart';

import 'package:services_galary/general_widgets/custom_text_feild.dart';

import 'package:services_galary/resourses/app_colors.dart';

import 'package:services_galary/resourses/app_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:services_galary/screens/general_widgets/rating_bar.dart';

import '../general_widgets/custom_elevated_blue_button.dart';
import '../general_widgets/custom_listviewwithimagepricebookbutoon.dart';

class MyServisesScreen extends StatefulWidget {
  const MyServisesScreen({super.key});
  @override
  MyServisesScreenState createState() => MyServisesScreenState();
}

class MyServisesScreenState extends State<MyServisesScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryIdController = TextEditingController();
  TextEditingController subCategoryIdController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController cityIdController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<GetMyServiceBloc>(context).add(GetMyServicesSuccessEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Icon(
              Icons.message_outlined,
              color: ColorManager.LIGHT_PRIMARY,
            ),
          ],
          title: Text(
            'My Services',
            style: AppTextStyleManager.SearchStyle,
          ),
          centerTitle: true,
          backgroundColor: ColorManager.WHITE_COLOR,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back,
            color: ColorManager.LIGHT_PRIMARY,
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              child: AppBar(
                backgroundColor: ColorManager.grey,
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text('waiting',
                          style: AppTextStyleManager.tabbarstyle),
                    ),
                    Tab(
                      child: Text('working',
                          style: AppTextStyleManager.tabbarstyle),
                    ),
                    Tab(
                      child: Text('finished',
                          style: AppTextStyleManager.tabbarstyle),
                    ),
                  ],
                ),
              ),
            ),

            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  Container(
                    color: ColorManager.grey,
                    child: Column(
                      children: [
                        Expanded(
                          child:
                              BlocConsumer<GetMyServiceBloc, GetMyServiceState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              if (state is GetMyServiceLoadingState) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (state is GetMyServiceSuccessState) {
                                return ListView.builder(
                                 // physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.all(10).r,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      state.getMyServicesModel.data!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Container(
                                    padding: EdgeInsets.all(2).r,
                                    height: 150.h,
                                    width: double.infinity,
                                    // color: Colors.red,
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/images/space_joy.jpg'),
                                        Column(
                                          children: [
                                            Text(
                                                '${state.getMyServicesModel.data![index].name}'),
                                            Text(
                                                '${state.getMyServicesModel.data![index].category}'),
                                            Text(
                                                '${state.getMyServicesModel.data![index].subCategory}'),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          children: [
                                            Text(
                                                '${state.getMyServicesModel.data![index].price} EG'),
                                            RatingBar.builder(
                                              itemSize: 15,
                                              initialRating: 1,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 4,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                width: 70.0.w,
                                                height: 25.0.h,
                                                decoration: BoxDecoration(
                                                  color: ColorManager.blue,
                                                  //border: new Border.all( width: 2.0),
                                                  borderRadius:
                                                      BorderRadius.circular(8.0)
                                                          .r,
                                                ),
                                                child: Center(
                                                  child: Text('Book',
                                                      style: AppTextStyleManager
                                                          .bold12),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  color: Colors.red,
                                );
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),

                  // second tab bar viiew widget
                  Container(
                    color: ColorManager.grey,
                    child: Column(
                      children: [
                        Expanded(
                            child: CustomListviewwithImagePriceAndBookButton())
                      ],
                    ),
                  ),
                  Container(
                    color: ColorManager.grey,
                    child: Column(
                      children: [
                        Expanded(
                            child: CustomListviewwithImagePriceAndBookButton())
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25).r,
              child: SizedBox(
                width: double.infinity,
                child: CustomElevatedBlueButton(() {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                          color: ColorManager.colorEEE,
                          height: 500.0,
                          child: Flexible(
                            child: Column(
                              children: [
                                CustomTextFeild(
                                  controller: nameController,
                                  label: 'category name',
                                ),
                                CustomTextFeild(
                                    controller: categoryIdController,
                                    label: 'category id'),
                                CustomTextFeild(
                                    controller: subCategoryIdController,
                                    label: 'subcategory id'),
                                CustomTextFeild(
                                    controller: priceController,
                                    label: 'price'),
                                CustomTextFeild(
                                    controller: cityIdController,
                                    label: 'city id'),
                                BlocListener<CreateSreviceBloc,
                                    CreateSreviceState>(
                                  listener: (context, state) {
                                    if (state is CreateSreviceLoadingState) {
                                      print('loading post service...');
                                    } else if (state
                                        is CreateSreviceSuccessState) {
                                      var snackBar = SnackBar(
                                          content: Text(
                                              '${state.cretedModel.message}'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                    // TODO: implement listener
                                  },
                                  child: CustomElevatedBlueButton(
                                    () {
                                      BlocProvider.of<CreateSreviceBloc>(
                                              context)
                                          .add(CreateServicesFetchedEvent(
                                        nameController.text,
                                        int.parse(categoryIdController.text),
                                        int.parse(subCategoryIdController.text),
                                        priceController.text,
                                        int.parse(cityIdController.text),
                                      ));
                                    },
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:services_galary/bloc/create_service/create_srevice_bloc.dart';
import 'package:services_galary/bloc/get_myservice/get_my_service_bloc.dart';

import 'package:services_galary/general_widgets/custom_text_feild.dart';
import 'package:services_galary/models/all_categories_model.dart';
import 'package:services_galary/models/all_new_categories.dart';
import 'package:services_galary/models/get_all_cities_model.dart';
import 'package:services_galary/models/get_my_data_service_model.dart';
import 'package:services_galary/models/get_my_services.dart';
import 'package:services_galary/models/sub_category_model.dart';
import 'package:services_galary/repository/get_my_data_service_repo.dart';
import 'package:services_galary/repository/get_my_services_repo.dart';

import 'package:services_galary/resourses/app_colors.dart';
import 'package:http/http.dart' as http;
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

  TextEditingController priceController = TextEditingController();
    TextEditingController subController = TextEditingController();

  @override
  void initState() {
    super.initState();
 getAllNewCategories();
    getAllCities();
    getAllNewSubCategories();
    BlocProvider.of<GetMyServiceBloc>(context).add(GetMyServicesSuccessEvent());
   
  }

  int? categoryId;
  List categoriesList = [];
  Future getAllNewCategories() async {
    var response =
        await http.get(Uri.parse('https://api.monoservices.net/v1/categories'));
    var data = response.body;

    var categoriesData = CategoriesDataList.fromJson(jsonDecode(response.body))
        .categoriesDataList;
    setState(() {
      categoriesList = categoriesData;
    });
  }

/******************** */
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

  /******************* */
  int? subid;
  List subCategories = [
    {"id": 5, "name": "Children rooms"},
    {
      "id": 6,
      "name": "living rooms",
    }
  ];

  getAllNewSubCategories() {
     subCategories;
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
              child: BlocConsumer<GetMyServiceBloc, GetMyServiceState>(
                  listener: (context, state) {
                if (state is GetMyServiceInitial) {
                  setState(() {
                    BlocProvider.of<GetMyServiceBloc>(context)
                        .add(GetMyServicesSuccessEvent());
                  });
                } else if (state is GetMyServiceSuccessState) {
                  print('${state.getMyServicesModel.length}');
                }
              }, builder: (context, state) {
                if (state is GetMyServiceLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.amber),
                  );
                } else if (state is GetMyServiceSuccessState) {
                  return TabBarView(
                    children: [
                      // first tab bar view widget
                      Container(
                        color: ColorManager.grey,
                        child: Column(
                          children: [
                            Expanded(
                                child: ListView.builder(
                              // physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.all(10).r,
                              scrollDirection: Axis.vertical,
                              itemCount: state.getMyServicesModel.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Container(
                                padding: EdgeInsets.all(2).r,
                                height: 100.h,
                                width: double.infinity,
                                // color: Colors.red,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/space_joy.jpg'),
                                    Column(
                                      children: [
                                        Text(
                                            '${state.getMyServicesModel[index].name}'),
                                        Text(
                                            '${state.getMyServicesModel[index].category}'),
                                        Text(
                                            '${state.getMyServicesModel[index].subCategory}'),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Text(
                                            '${state.getMyServicesModel[index].price} EG'),
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
                                                  BorderRadius.circular(8.0).r,
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
                            ))
                          ],
                        ),
                      ),

                      // second tab bar viiew widget
                      Container(
                        color: ColorManager.GREEN_COLOR,
                        child: Column(
                          children: [
                            // CustomListviewwithImagePriceAndBookButton()
                          ],
                        ),
                      ),
                      Container(
                        color: ColorManager.blue,
                        child: Column(
                          children: [
                            // Expanded(
                            //     child:
                            //         CustomListviewwithImagePriceAndBookButton())
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              }),
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
                          height: 700.h,
                          child: Column(
                            children: [
                              CustomTextFeild(
                                controller: nameController,
                                label: 'service name',
                              ),
                              //   CustomTextFeild(
                              //   controller: subController,
                              //   label: 'subcategory',
                              // ),
                              CustomTextFeild(
                                  controller: priceController, label: 'price'),
                              DropdownButton(
                                  hint: Text('categories'),
                                  value: categoryId,
                                  items: categoriesList
                                      .map((e) => DropdownMenuItem(
                                            child: Text('${e['name']}'),
                                            value: e['id'],
                                          ))
                                      .toList(),
                                  onChanged: ((newvalue) {
                                    categoryId = newvalue as int?;
                                    //  print('$categoryId');
                                    getAllNewCategories();
                                  })),
                              DropdownButton(
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
                              DropdownButton(
                                  hint: Text('subcategories'),
                                  value: subid,
                                  items: subCategories
                                      .map((e) => DropdownMenuItem(
                                            child: Text('${e['name']}'),
                                            value: e['id'],
                                          ))
                                      .toList(),
                                  onChanged: ((newvalue) {
                                    subid = newvalue as int?;
                                    print('$subid');
                                    getAllNewSubCategories();
                                  })),
                              BlocConsumer<CreateSreviceBloc,
                                  CreateSreviceState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return CustomElevatedBlueButton(
                                    () {
                                      BlocProvider.of<CreateSreviceBloc>(
                                              context)
                                          .add(CreateServicesFetchedEvent(
                                              nameController.text,
                                              categoryId!,
                                              // int.parse(subController.text),
                                              subid!,
                                              priceController.text,
                                              cityId!));
                                      BlocProvider.of<GetMyServiceBloc>(context)
                                          .add(GetMyServicesSuccessEvent());
                                      Navigator.pop(context);
                                     // setState(() {});
                                    },
                                  );
                                },
                              ),
                            ],
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

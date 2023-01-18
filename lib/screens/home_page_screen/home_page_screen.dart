import 'dart:developer';
import 'package:services_galary/bloc/all_categories/all_categories_bloc.dart';
import 'package:services_galary/bloc/all_services/all_services_bloc.dart';
import 'package:services_galary/models/all_data_model.dart';
import 'package:services_galary/repository/all_data_repo.dart';
import 'package:services_galary/repository/all_services_repo.dart';
import 'package:services_galary/resourses/app_colors.dart';
import 'package:services_galary/resourses/app_images.dart';
import 'package:services_galary/resourses/app_style.dart';
import 'package:services_galary/screens/general_widgets/custom_search_textformfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../repository/get_my_services_repo.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List images = [
    AppImagesManager.gardenSvg,
    AppImagesManager.cleaningSvg,
    AppImagesManager.electricitySvg,
    AppImagesManager.plungerSvg
  ];
  final ScrollController _scrollController = ScrollController();

  List<AllServicesTryerModel> newData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  BlocProvider.of(context).add(AllServicesLoadedEvent());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 60, 0).r,
          child: CustomSearchTextFormFeild(),
        )),
        backgroundColor: ColorManager.WHITE_COLOR,
        elevation: 0,
      ),
      backgroundColor: ColorManager.colorEEE,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Caregories'),
                      
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                  width: double.infinity.r,
                  child: BlocConsumer<AllCategoriesBloc, AllCategoriesState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is AllCategoriesSuccess) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.allCategoriesModel.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 50, 0).r,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      images[index],
                                      color: Colors.blue,
                                    ),
                                    Text(
                                        '${state.allCategoriesModel.data![index].name}')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (state is AllCategoriesLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Container(
                          color: Colors.amber,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Offers & packages'),
                    
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Image.asset('assets/images/living_room.jpg',
                      fit: BoxFit.fitWidth),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('category of childrn room for two children'),
                      Text('256 EG', style: AppTextStyleManager.priceStyle),
                    ],
                  ),
             
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Different Services '),
                  
                    ],
                  ),
                ),
                SizedBox(
                  height: 500.h,
                  child: BlocConsumer<AllServicesBloc, AllServicesState>(
                      listener: (context, state) {
                    if (state is AllServicesLoadingState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)));
                    } else if (state is AllServicesSuccessState &&
                        state.allData.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('No more users')));
                    } else if (state is AllServicesErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)));
                      BlocProvider.of<AllServicesBloc>(context).isFetching =
                          false;
                    }
                    return;
                  }, builder: (context, state) {
                    if (state is AllServicesInitial ||
                        state is AllServicesLoadingState && newData.isEmpty) {
                      return Container(
                          child: Center(child: CircularProgressIndicator()));
                    } else if (state is AllServicesSuccessState) {
                      newData.addAll(state.allData);
                      BlocProvider.of<AllServicesBloc>(context).isFetching =
                          false;
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    } else if (state is AllServicesErrorState &&
                        newData.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<AllServicesBloc>(context)
                                ..isFetching = true
                                ..add(AllServicesLoadedEvent());
                            },
                            icon: Icon(Icons.refresh),
                          ),
                          const SizedBox(height: 15),
                          Text(state.message, textAlign: TextAlign.center),
                        ],
                      );
                    }

                    return ListView.builder(
                      controller: _scrollController
                        ..addListener(() {
                          if (_scrollController.offset ==
                                  _scrollController
                                      .position.maxScrollExtent &&
                              !BlocProvider.of<AllServicesBloc>(context)
                                  .isFetching) {
                            BlocProvider.of<AllServicesBloc>(context)
                              ..isFetching = true
                              ..add(AllServicesLoadedEvent());
                          }
                        }),
                      shrinkWrap: true,
                      itemCount: newData.length,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(2).r,
                        height: 80.h,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Image.asset('assets/images/space_joy.jpg'),
                            Column(
                              children: [
                                Text('${newData[index].category}'),
                                Text('${newData[index].subCategory}'),
                                Text('${newData[index].description}'),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text('${newData[index].price}'),
                                Spacer(),
                                RatingBar.builder(
                                  itemSize: 15,
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 4,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 68.0.w,
                                    height: 35.0.h,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius:
                                          BorderRadius.circular(6.0).r,
                                    ),
                                    child: Center(
                                      child: Text('Book',
                                          style: AppTextStyleManager
                                              .bookTextButtonStyle),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

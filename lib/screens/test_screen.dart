import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:services_galary/bloc/all_services/all_services_bloc.dart';
import 'package:services_galary/models/all_data_model.dart';

import 'package:services_galary/repository/all_data_repo.dart';
import 'package:services_galary/resourses/app_style.dart';

import '../models/all_services_model.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final ScrollController _scrollController = ScrollController();
  List<AllServicesTryerModel> newData = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('test')),
        body: BlocConsumer<AllServicesBloc, AllServicesState>(
          listener: (context, state) {
          if (state is AllServicesLoadingState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AllServicesSuccessState && state.allData.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('No more users')));
          } else if (state is AllServicesErrorState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
        BlocProvider.of<AllServicesBloc>(context).isFetching = false;
          }
          return;
        }, builder: (context, state) {
          if (state is AllServicesInitial ||
          state is AllServicesLoadingState && newData.isEmpty) {
        return Container(child: Center(child: CircularProgressIndicator()));
          } else if (state is AllServicesSuccessState) {
        newData.addAll(state.allData);
        BlocProvider.of<AllServicesBloc>(context).isFetching = false;
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
          } else if (state is AllServicesErrorState && newData.isEmpty) {
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

          return Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                          _scrollController.position.maxScrollExtent &&
                      !BlocProvider.of<AllServicesBloc>(context).isFetching) {
                    BlocProvider.of<AllServicesBloc>(context)
                      ..isFetching = true
                      ..add(AllServicesLoadedEvent());
                  }
                }),
              itemCount: newData.length,
              itemBuilder: (context, index) =>Container(
                      padding: EdgeInsets.all(2).r,
                      height: 80.h,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Image.asset('assets/images/space_joy.jpg'),
                          Column(
                            children: [
                              Text('${newData[index].id}'),
                              Text('${newData[index].category}'),
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
                                    borderRadius: BorderRadius.circular(6.0).r,
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
            ),
          ),
        ],
          );
        }));
  }
}

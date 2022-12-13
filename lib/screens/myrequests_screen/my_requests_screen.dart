import 'package:services_galary/resourses/app_colors.dart';
import 'package:services_galary/resourses/app_images.dart';
import 'package:services_galary/resourses/app_style.dart';
import 'package:services_galary/screens/general_widgets/custom_listviewbuilserimageandprice.dart';
import 'package:services_galary/screens/general_widgets/custom_rowdesignerdatawithbookbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../general_widgets/custom_search_textformfeild.dart';

class MyRequestedScreen extends StatefulWidget {
  const MyRequestedScreen({super.key});
  @override
  MyRequestedScreenState createState() => MyRequestedScreenState();
}

class MyRequestedScreenState extends State<MyRequestedScreen> {
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
          title: CustomSearchTextFormFeild(),
          centerTitle: true,
          backgroundColor: ColorManager.WHITE_COLOR,
          elevation: 0,
       
          leading: Icon(
            Icons.notifications_active_outlined,
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
                      child: Text('waiting', style: AppTextStyleManager.tabbarstyle),
                    ),
                    Tab(
                      child: Text('working', style: AppTextStyleManager.tabbarstyle),
                    ),
                    Tab(
                      child: Text('finished', style: AppTextStyleManager.tabbarstyle),
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
                        // SizedBox(height: 10,),
                        Expanded(child: CustomListViewImageDataAndPrice()),
                        // Expanded(
                        //   child: CustomRowDesignerUserDatawithBookButton(
                        //     buttonLabel: 'On Hold',
                        //     inkewellColor: ColorManager.primaryColor,
                        //   ),
                        // )
                        Row(
      children: [
        CircleAvatar(child: Image.asset(AppImagesManager.userImage)),
        Text('designer / ibrahem'),
        Spacer(),
        InkWell(
          onTap: () {},
          child: Container(
            width: 70.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: ColorManager.blue,
              //border: new Border.all( width: 2.0),
              borderRadius: new BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                'book',
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ),
                      ],
                    ),
                  ),

                  // second tab bar viiew widget
                  Container(
                    color: ColorManager.grey,
                    child: Column(
                      children: [
                        Expanded(child: CustomListViewImageDataAndPrice()),
                        // Expanded(
                        //     child: CustomRowDesignerUserDatawithBookButton(
                        //   buttonLabel: 'Opening',
                        //   inkewellColor: ColorManager.primaryColor,
                        // )),
                        Row(
      children: [
        CircleAvatar(child: Image.asset(AppImagesManager.userImage)),
        Text('designer / ibrahem'),
        Spacer(),
        InkWell(
          onTap: () {},
          child: Container(
            width: 70.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: ColorManager.blue,
              //border: new Border.all( width: 2.0),
              borderRadius: new BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                'book',
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ),
                      ],
                    ),
                  ),
                  Container(
                    color: ColorManager.grey,
                    child: Column(
                      children: [
                        Expanded(child: CustomListViewImageDataAndPrice()),
                        // Expanded(
                        //     child: CustomRowDesignerUserDatawithBookButton(
                        //   buttonLabel: 'finished',
                        //   inkewellColor: ColorManager.error,
                        // ))
                        Row(
      children: [
        CircleAvatar(child: Image.asset(AppImagesManager.userImage)),
        Text('designer / ibrahem'),
        Spacer(),
        InkWell(
          onTap: () {},
          child: Container(
            width: 70.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: ColorManager.blue,
              //border: new Border.all( width: 2.0),
              borderRadius: new BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                'book',
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

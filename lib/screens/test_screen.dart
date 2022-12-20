import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
//import 'package:services_galary/models/all_categories_model.dart';
import 'package:services_galary/models/all_new_categories.dart';
import 'package:services_galary/models/sub_category_model.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TestScreen> {
  int? subid;
  List subCategories = [
    {"id": 5, "name": "Children rooms"},
    {
      "id": 6,
      "name": "living rooms",
    }
  ];

  getAllNewSubCategories() {
    return subCategories;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllNewSubCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geeksforgeeks"),
      ),
      body: DropdownButton(
          hint: Text('categories'),
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
    );
  }
}

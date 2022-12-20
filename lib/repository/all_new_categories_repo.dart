import 'dart:convert';
import 'dart:developer';

import 'package:services_galary/api/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:services_galary/models/get_my_data_service_model.dart';

import '../models/all_categories_model.dart';
import '../models/all_new_categories.dart';
import '../models/all_services_model.dart';

//AllSercices
class GetAllNewCategoriesRepo {
  Future getAllNewCategories() async {
    var response =
        await http.get(Uri.parse('https://api.monoservices.net/v1/categories'));
    var data = response.body;
    var categoriesData = CategoriesDataList.fromJson(jsonDecode(response.body));
    var categories = categoriesData.categoriesDataList
        .map((e) => CategoriesData.fromJson(e))
        .toList();
    log('$categories');
  }
}

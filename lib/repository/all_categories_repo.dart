import 'dart:convert';
import 'dart:developer';

import 'package:services_galary/api/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/all_categories_model.dart';


//AllSercices
class GetAllCategoriesRepo {
  Future<AllCategoriesModel> getAllCategories() async {
 
    var response =
        await http.get(Uri.parse('https://api.monoservices.net/v1/categories'));
    var data = response.body;
    
    var allCategories = AllCategoriesModel.fromJson(jsonDecode(data));
    
    return allCategories;
  }
}

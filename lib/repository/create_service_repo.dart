import 'dart:convert';
import 'dart:developer';

import 'package:services_galary/api/api_path.dart';
import 'package:services_galary/models/create_service_model.dart';
import 'package:services_galary/utlis/cash_helper.dart';
import 'package:http/http.dart' as http;

class CreateServiceRepo {
  //signuptoken
// List< Map<dynamic, dynamic>> data = [{'living': 1},{ 'slepping': 2}];
  String gettoken = CacheHelper.getData('logintoken');
  Future<CreateServiceModel> createService(
    String name,
    int categoryid,
    int subcategory,
    String price,
    int cityid,
  ) async {
    var response = await http.post(
        body: jsonEncode({
          "name": name,
          "category_id": categoryid,
          "subcategory_id": subcategory,
          "price": price,
          "city_id": cityid
        }),
        headers: {
          'Authorization': 'Bearer $gettoken',
          'Content-Type': 'application/json'
        },
        Uri.parse('https://api.monoservices.net/v1/services/add'));
    var message = CreateServiceModel.fromJson(jsonDecode(response.body));
   // log('post service in create service repo ${response.body}');
//log('create service repo  $message');
    return message;
  }
}

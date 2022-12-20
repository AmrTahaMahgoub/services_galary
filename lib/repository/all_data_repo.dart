import 'dart:convert';
import 'dart:developer';

import 'package:services_galary/api/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:services_galary/models/all_data_model.dart';

import '../models/all_services_model.dart';

class GetAllDataRepo {

  Future<List<AllServicesTryerModel>> getAllServicesTryer(int page) async {
    var response = await http
        .get(Uri.parse('https://api.monoservices.net/v1/services?page=$page'));
    var data = response.body;
    Users users = Users.fromJson(jsonDecode(data));
  //  log('tryer data ..........$data');
    List<AllServicesTryerModel> usersInfo =
        users.users.map((e) => AllServicesTryerModel.fromJson(e)).toList();
   // log('${usersInfo}');
    

    return usersInfo;
  }
}

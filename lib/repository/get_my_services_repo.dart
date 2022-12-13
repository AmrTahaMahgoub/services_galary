import 'dart:convert';
import 'dart:developer';

import 'package:services_galary/api/api_path.dart';
import 'package:services_galary/utlis/cash_helper.dart';
import 'package:http/http.dart' as http;

import '../models/get_my_services.dart';

class GetMyServicesRepo {
  Future<GetMyServicesModel> getMyServices() async {
    var gettoken = CacheHelper.getData('logintoken');
    var response = await http.get(Uri.parse(getMyservices),
        headers: {'Authorization': 'Bearer $gettoken'});
    var data = GetMyServicesModel.fromJson(jsonDecode(response.body));
    log('${response.body}');

    return data;
  }
}

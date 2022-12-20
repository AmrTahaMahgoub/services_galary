import 'dart:convert';

import 'package:services_galary/models/get_my_data_service_model.dart';
import 'package:services_galary/utlis/cash_helper.dart';
import 'package:http/http.dart' as http;
class GetMyDataServicesRepo {
  Future<List<GetMyDataSevice>> getMyServices() async {
    var gettoken = CacheHelper.getData('logintoken');
    var response = await http.get(Uri.parse('https://api.monoservices.net/v1/my-services'),
        headers: {'Authorization': 'Bearer $gettoken'});
         MyUserData myuserdata = MyUserData.fromJson(jsonDecode(response.body));
       var  data= myuserdata.myuserData.map((e) => GetMyDataSevice.fromJson(e)).toList();


    return data;
  }
}
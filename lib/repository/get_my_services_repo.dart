// import 'dart:convert';
// import 'dart:developer';

// import 'package:services_galary/api/api_path.dart';
// import 'package:services_galary/utlis/cash_helper.dart';
// import 'package:http/http.dart' as http;

// import '../models/get_my_services.dart';
// //?page=2
// class GetMyServicesRepo {
//   Future<List<Data>?> getMyServices() async {
//     var gettoken = CacheHelper.getData('logintoken');
//     var response = await http.get(Uri.parse('https://api.monoservices.net/v1/my-services'),
//         headers: {'Authorization': 'Bearer $gettoken'});
//     var data = GetMyServicesModel.fromJson(jsonDecode(response.body)).data;
//     log('${response.body}');

//     return data;
//   }
// }

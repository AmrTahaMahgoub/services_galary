import 'dart:convert';
import 'dart:developer';

import 'package:services_galary/api/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/all_services_model.dart';

//AllSercices
class GetAllServicesRepo {
  static int perPage = 10;
  Future<List<Data>?> getAllServices(int page) async {
    var response = await http
        .get(Uri.parse('https://api.monoservices.net/v1/services?page=$page'));
    var data = response.body;

    var allServices = AllServicesModel.fromJson(jsonDecode(data)).data;

    return allServices;
  }
}

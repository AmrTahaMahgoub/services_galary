import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:services_galary/api/api_path.dart';
import 'package:services_galary/models/auth/login_model.dart';
import 'package:services_galary/utlis/cash_helper.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<LoginModel> loginData(String email, String password) async {
    final response =
        await http.post(Uri.parse('https://api.monoservices.net/v1/auth/login'),
            body: jsonEncode(
              {
                "email": email,
                "password": password,
              },
            ),
            headers: {
          'Content-Type': 'application/json',
        });
    log('login responsebody ${response.body}');
    var data = LoginModel.fromJson(jsonDecode(response.body));
    log('login token repo ${data}');

    return data;
  }
}

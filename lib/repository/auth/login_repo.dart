import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:services_galary/api/api_path.dart';
import 'package:services_galary/models/auth/login_model.dart';
import 'package:services_galary/models/auth/login_model.dart';
import 'package:services_galary/utlis/cash_helper.dart';
import 'package:http/http.dart' as http;

class LoginRepository {

  

  Future<dynamic> loginData(String email, String password) async {
    try {
      final response = await http
          .post(Uri.parse('https://api.monoservices.net/v1/auth/login'),
              body: jsonEncode(
                {
                  "email": email,
                  "password": password,
                },
              ),
              headers: {
            'Content-Type': 'application/json',
          });
      if (response.statusCode == 200) {
       var token= LoginModel.fromJson(jsonDecode(response.body));

         log('token in login response ${token}');
         return token;
      } else if (response.statusCode == 401) {
         var error = LoginModelErrors.fromJson(jsonDecode(response.body));
        log('error in login response ${error}');
         return error;
      }
    } catch (e) {
      log('catch error in login repo ${e.toString()}');
     
    }

  }
}



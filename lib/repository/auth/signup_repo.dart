import 'dart:convert';
import 'dart:developer';
import '../../models/auth/signup_model.dart';
import 'package:http/http.dart' as http;

class SignUp {
  Future<String?> signupData(String name,
      String email, String password,  int country) async {
    http.Response response = await http.post(
        Uri.parse('https://api.monoservices.net/v1/auth/register'),
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "city_id": country
        }),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      try {
      
        var userData =
            UserModel.fromJson(jsonDecode(response.body)).data!.token;
           
    
        return userData;
      } catch (e) {
        log('catch the error  in signup repo$e');
        // if (e == 'Null check operator used on a null value') {
        //   return 'this email has already been taken';
        // }
      }
    }
  }
}


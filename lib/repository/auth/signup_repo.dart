import 'dart:convert';
import 'dart:developer';
import '../../models/auth/signup_model.dart';
import 'package:http/http.dart' as http;

class SignUpRepository {
  Future<UserModel> signupData(
      String name, String email, String password, int cityid) async {
    http.Response response = await http.post(
        Uri.parse('https://api.monoservices.net/v1/auth/register'),
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "city_id": cityid
        }),
        headers: {'Content-Type': 'application/json'});
    //log('sign up responsebody ${response.body}');
    var json = jsonDecode(response.body);

    var data = UserModel.fromJson(json);

   // log('data in sign up repo ${data}');

    return data;
  }
}

class EmailandPasswordRepo {
  Future<EmailAnPasswordErrorModel> signupEmailandPassworderror(
      String name, String email, String password, int cityid) async {
    http.Response response = await http.post(
        Uri.parse('https://api.monoservices.net/v1/auth/register'),
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "city_id": cityid
        }),
        headers: {'Content-Type': 'application/json'});
   // log('sign up responsebody ${response.body}');
    var json = jsonDecode(response.body);

    var data = EmailAnPasswordErrorModel.fromJson(json);

  //  log('data in sign up repo ${data}');

    return data;
  }
}

class EmailRepo {
  Future<EmailErrorsModel> signupRepeatedEmail(
      String name, String email, String password, int cityid) async {
    http.Response response = await http.post(
        Uri.parse('https://api.monoservices.net/v1/auth/register'),
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "city_id": cityid
        }),
        headers: {'Content-Type': 'application/json'});
    log('sign up responsebody ${response.body}');
    var json = jsonDecode(response.body);

    var data = EmailErrorsModel.fromJson(json);

    log('data in sign up repo ${data}');

    return data;
  }
}

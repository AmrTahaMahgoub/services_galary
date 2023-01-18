class UserModel {
  String? message;
  Data? data;

  UserModel({this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? city;
  String? joinedDate;

  User({this.name, this.email, this.city, this.joinedDate});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    city = json['city'];
    joinedDate = json['joined_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['city'] = this.city;
    data['joined_date'] = this.joinedDate;
    return data;
  }
}

/* email and password error*/
class EmailAnPasswordErrorModel {
  String? message;
  Errors? errors;

  EmailAnPasswordErrorModel({this.message, this.errors});

  EmailAnPasswordErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors =
        json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<dynamic>? email;
  List<dynamic>? password;

  Errors({this.email, this.password});

  Errors.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

/****** email error model */


class EmailErrorsModel {
  List<String>? email;

  EmailErrorsModel({this.email});

  EmailErrorsModel.fromJson(Map<String, dynamic> json) {
    email = json['email'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}
/****************** */
//messageanderrors
// class MessageAndErrors {
//   String? message;
//   Errors? errors;

//   MessageAndErrors({this.message, this.errors});

//   MessageAndErrors.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     errors =
//         json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.errors != null) {
//       data['errors'] = this.errors!.toJson();
//     }
//     return data;
//   }
// }

// class Errors {
//   List<String>? email;
//   List<String>? password;

//   Errors({this.email, this.password});

//   Errors.fromJson(Map<String, dynamic> json) {
//     email = json['email'].cast<String>();
//     password = json['password'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = this.email;
//     data['password'] = this.password;
//     return data;
//   }
// }


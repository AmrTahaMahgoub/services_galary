

class LoginModel {
  Message? message;

  LoginModel({this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
  String? token;
  User? user;

  Message({this.token, this.user});

  Message.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

/**** */
class LoginModelErrors {
  String? message;
  Errors? errors;

  LoginModelErrors({this.message, this.errors});

  LoginModelErrors.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors =
        json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors!.toJson();
    }
    return data;
  }
}

class Errors {
  String? data;

  Errors({this.data});

  Errors.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['data'] = this.data;
    return data;
  }
}

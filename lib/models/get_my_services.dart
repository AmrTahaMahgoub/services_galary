class GetMyServicesModel {
  Null? message;
  List<Data>? data;

  GetMyServicesModel({this.message, this.data});

  GetMyServicesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  Null? description;
  String? city;
  String? category;
  String? subCategory;
  String? price;
  Provider? provider;
  String? createdAt;
  String? status;

  Data(
      {this.id,
      this.name,
      this.description,
      this.city,
      this.category,
      this.subCategory,
      this.price,
      this.provider,
      this.createdAt,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    city = json['city'];
    category = json['category'];
    subCategory = json['sub_category'];
    price = json['price'];
    provider = json['provider'] != null
        ? new Provider.fromJson(json['provider'])
        : null;
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['city'] = this.city;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    data['price'] = this.price;
    if (this.provider != null) {
      data['provider'] = this.provider!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}

class Provider {
  Null? firstName;
  Null? lastName;
  String? email;
  Null? phoneNumber;

  Provider({this.firstName, this.lastName, this.email, this.phoneNumber});

  Provider.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}

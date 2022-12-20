
class AllCitiesList {
  final List<dynamic> allCitiesList;

  AllCitiesList({required this.allCitiesList});
  factory AllCitiesList.fromJson(Map<String, dynamic> json) {
    return AllCitiesList(allCitiesList: json['data']);
  }
}
class GetAllCitiesModel {
  String? message;
  List<DataCities>? data;

  GetAllCitiesModel({this.message, this.data});

  GetAllCitiesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DataCities>[];
      json['data'].forEach((v) {
        data!.add(new DataCities.fromJson(v));
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

class DataCities {
  int? id;
  String? name;

  DataCities({this.id, this.name});

  DataCities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

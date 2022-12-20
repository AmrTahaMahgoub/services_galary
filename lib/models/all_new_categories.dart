class CategoriesDataList {
  final List<dynamic> categoriesDataList;

  CategoriesDataList({required this.categoriesDataList});
  factory CategoriesDataList.fromJson(Map<String, dynamic> json) {
    return CategoriesDataList(categoriesDataList: json['data']);
  }
}




class CategoriesData {
  int? id;
  String? name;
  String? headerImage;
  List<SubCategories>? subCategories;

  CategoriesData({this.id, this.name, this.headerImage, this.subCategories});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    headerImage = json['header_image'];
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['header_image'] = this.headerImage;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  int? id;
  String? name;
  String? headerImage;

  SubCategories({this.id, this.name, this.headerImage});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    headerImage = json['header_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['header_image'] = this.headerImage;
    return data;
  }
}

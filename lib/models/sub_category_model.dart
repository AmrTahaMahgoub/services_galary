// class SubCategoriesDataList {
//   final List<dynamic> subcategoriesDataList;

//   SubCategoriesDataList({required this.subcategoriesDataList});
//   factory SubCategoriesDataList.fromJson( json) {
//     return SubCategoriesDataList(subcategoriesDataList: json['sub_categories']);
//   }
// }


// class SubCategoryModel {
//   int? id;
//   String? name;
//   String? headerImage;

//   SubCategoryModel({this.id, this.name, this.headerImage});

//   SubCategoryModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     headerImage = json['header_image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['header_image'] = this.headerImage;
//     return data;
//   }
// }

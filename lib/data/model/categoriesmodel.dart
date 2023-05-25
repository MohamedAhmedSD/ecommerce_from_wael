//* after add some data on our database, test our api and take only data list
//* to paste it into https://javiercbk.github.io/json_to_dart/
//* to make our model without errors

// class CategoriesModel {
//   String? categoriesId;
//   String? categoriesName;
//   String? categoriesNamaAr;
//   String? categoriesImage;
//   String? categoriesDatetime;

//   CategoriesModel(
//       {this.categoriesId,
//       this.categoriesName,
//       this.categoriesNamaAr,
//       this.categoriesImage,
//       this.categoriesDatetime});

//   CategoriesModel.fromJson(Map<String, dynamic> json) {
//     categoriesId = json['categories_id'];
//     // categoriesId = json['categories_id'].toString();
//     categoriesName = json['categories_name'];
//     categoriesNamaAr = json['categories_nama_ar'];
//     categoriesImage = json['categories_image'];
//     categoriesDatetime = json['categories_datetime'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['categories_id'] = categoriesId;
//     data['categories_name'] = categoriesName;
//     data['categories_nama_ar'] = categoriesNamaAr;
//     data['categories_image'] = categoriesImage;
//     data['categories_datetime'] = categoriesDatetime;
//     return data;
//   }
// }

//! I change model because we use id as int not as String

class CategoriesModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    return data;
  }
}

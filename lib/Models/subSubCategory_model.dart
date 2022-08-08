class SubSubCategoryRepo {
  String? result;
  dynamic data;

  SubSubCategoryRepo({this.result, this.data});

  factory SubSubCategoryRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return SubSubCategoryRepo(
        result: json['result'],
        data: json['data'],
      );
    } catch (error) {
      return SubSubCategoryRepo(
        result: "",
        data: null,
      );
    }
  }

//   SubSubCategoryRepo.fromJson(Map<String, dynamic> json) {
//     result = json['result'];
//     if (json['data'] != null) {
//       data = new List<Data>();
//       json['data'].forEach((v) {
//         data.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['result'] = this.result;
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
 }

class SubSubCategoryModel {
  String? sscatId;
  String? ssCatName;
  String? ssCatImg;
  String? subcatId;
  String? status;
  String? addedDate;
  String? updatedDate;
  String? subCatName;

  SubSubCategoryModel(
      {this.sscatId,
        this.ssCatName,
        this.ssCatImg,
        this.subcatId,
        this.status,
        this.addedDate,
        this.updatedDate,
        this.subCatName});

  SubSubCategoryModel.fromJson(Map<String, dynamic> json) {
    sscatId = json['sscat_id'];
    ssCatName = json['ss_cat_name'];
    ssCatImg = json['ss_cat_img'];
    subcatId = json['subcat_id'];
    status = json['status'];
    addedDate = json['added_date'];
    updatedDate = json['updated_date'];
    subCatName = json['sub_cat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sscat_id'] = this.sscatId;
    data['ss_cat_name'] = this.ssCatName;
    data['ss_cat_img'] = this.ssCatImg;
    data['subcat_id'] = this.subcatId;
    data['status'] = this.status;
    data['added_date'] = this.addedDate;
    data['updated_date'] = this.updatedDate;
    data['sub_cat_name'] = this.subCatName;
    return data;
  }
}
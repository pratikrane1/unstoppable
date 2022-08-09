class SubCategoryRepo {
  String? result;
  dynamic data;

  SubCategoryRepo({this.result, this.data});

  factory SubCategoryRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return SubCategoryRepo(
        result: json['result'],
        data: json['data'],
      );
    } catch (error) {
      return SubCategoryRepo(
        result: "",
        data: null,
      );
    }
  }

  // SubCategoryRepo.fromJson(Map<String, dynamic> json) {
  //   result = json['result'];
  //   if (json['data'] != null) {
  //     data = new List<Data>();
  //     json['data'].forEach((v) {
  //       data.add(new Data.fromJson(v));
  //     });
  //   }
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['result'] = this.result;
  //   if (this.data != null) {
  //     data['data'] = this.data.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class SubCategoryModel {
  String? subcatId;
  String? subCatName;
  String? subCatImg;
  String? catId;
  String? status;
  String? addedDate;
  String? updatedDate;
  String? catName;

  SubCategoryModel(
      {this.subcatId,
        this.subCatName,
        this.subCatImg,
        this.catId,
        this.status,
        this.addedDate,
        this.updatedDate,
        this.catName});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    subcatId = json['subcat_id'];
    subCatName = json['sub_cat_name'];
    subCatImg = json['sub_cat_img'];
    catId = json['cat_id'];
    status = json['status'];
    addedDate = json['added_date'];
    updatedDate = json['updated_date'];
    catName = json['cat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcat_id'] = this.subcatId;
    data['sub_cat_name'] = this.subCatName;
    data['sub_cat_img'] = this.subCatImg;
    data['cat_id'] = this.catId;
    data['status'] = this.status;
    data['added_date'] = this.addedDate;
    data['updated_date'] = this.updatedDate;
    data['cat_name'] = this.catName;
    return data;
  }
}
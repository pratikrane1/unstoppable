class CategoryRepo {
  String? result;
  dynamic data;


  CategoryRepo({this.result, this.data});
  factory CategoryRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return CategoryRepo(
        result: json['result'],
        data: json['data'],
      );
    } catch (error) {
      return CategoryRepo(
        result: "",
        data: null,
      );
    }
  }

  // CategoryRepo.fromJson(Map<String, dynamic> json) {
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

class CategoryModel {
  String? catId;
  String? catName;
  String? catImg;
  String? status;
  String? addedDate;
  String? updatedDate;

  CategoryModel(
      {this.catId,
        this.catName,
        this.catImg,
        this.status,
        this.addedDate,
        this.updatedDate});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
    catImg = json['cat_img'];
    status = json['status'];
    addedDate = json['added_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['cat_img'] = this.catImg;
    data['status'] = this.status;
    data['added_date'] = this.addedDate;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}
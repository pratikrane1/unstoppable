class GetBNCRepo {
  String? result;
  dynamic data;

  GetBNCRepo({this.result, this.data});


  factory GetBNCRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return GetBNCRepo(
        result: json['result'],
        data: json['data'],
      );
    } catch (error) {
      return GetBNCRepo(
        result: "",
        data: null,
      );
    }
  }

  // GetBNCRepo.fromJson(Map<String, dynamic> json) {
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

class GetBNCmodel {
  String? id;
  String? row;
  String? catId;
  String? catName;
  String? subCatId;
  String? subCatName;
  String? sscatId;
  String? ssCatName;
  String? productId;
  String? prodName;
  String? userId;
  String? type;

  GetBNCmodel(
      {this.id,
        this.row,
        this.catId,
        this.catName,
        this.subCatId,
        this.subCatName,
        this.sscatId,
        this.ssCatName,
        this.productId,
        this.prodName,
        this.userId,
        this.type});

  GetBNCmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    row = json['row'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    subCatId = json['sub_cat_id'];
    subCatName = json['sub_cat_name'];
    sscatId = json['sscat_id'];
    ssCatName = json['ss_cat_name'];
    productId = json['product_id'];
    prodName = json['prod_name'];
    userId = json['user_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['row'] = this.row;
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['sub_cat_id'] = this.subCatId;
    data['sub_cat_name'] = this.subCatName;
    data['sscat_id'] = this.sscatId;
    data['ss_cat_name'] = this.ssCatName;
    data['product_id'] = this.productId;
    data['prod_name'] = this.prodName;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    return data;
  }
}
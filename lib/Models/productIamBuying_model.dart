class ProductBuyingRepo {
  String? result;
  dynamic data;

  ProductBuyingRepo({this.result, this.data});
  factory ProductBuyingRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return ProductBuyingRepo(
        result: json['result'],
        data: json['data'],
      );
    } catch (error) {
      return ProductBuyingRepo(
        result: "",
        data: null,
      );
    }
  }


// ProductIamBuyingRepo.fromJson(Map<String, dynamic> json) {
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

class ProductBuyingModel {
  String? ordId;
  String? catId;
  String? subcatId;
  String? sscatId;
  String? prodName;
  String? orderUserId;
  String? status;
  String? addedDate;
  String? updatedDate;
  String? catName;
  String? subCatName;
  String? ssCatName;

  ProductBuyingModel(
      {this.ordId,
        this.catId,
        this.subcatId,
        this.sscatId,
        this.prodName,
        this.orderUserId,
        this.status,
        this.addedDate,
        this.updatedDate,
        this.catName,
        this.subCatName,
        this.ssCatName});

  ProductBuyingModel.fromJson(Map<String, dynamic> json) {
    ordId = json['ord_id'];
    catId = json['cat_id'];
    subcatId = json['subcat_id'];
    sscatId = json['sscat_id'];
    prodName = json['prod_name'];
    orderUserId = json['order_user_id'];
    status = json['status'];
    addedDate = json['added_date'];
    updatedDate = json['updated_date'];
    catName = json['cat_name'];
    subCatName = json['sub_cat_name'];
    ssCatName = json['ss_cat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ord_id'] = this.ordId;
    data['cat_id'] = this.catId;
    data['subcat_id'] = this.subcatId;
    data['sscat_id'] = this.sscatId;
    data['prod_name'] = this.prodName;
    data['order_user_id'] = this.orderUserId;
    data['status'] = this.status;
    data['added_date'] = this.addedDate;
    data['updated_date'] = this.updatedDate;
    data['cat_name'] = this.catName;
    data['sub_cat_name'] = this.subCatName;
    data['ss_cat_name'] = this.ssCatName;
    return data;
  }
}
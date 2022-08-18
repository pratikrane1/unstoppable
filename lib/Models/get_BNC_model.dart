class GetBNCRepo {
  String? result;
  dynamic data;

  GetBNCRepo({this.result, this.data});

  GetBNCRepo.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? new GetBNCmodel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
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
  String? productId;
  String? catId;
  String? subCatId;
  String? sscatId;
  String? userId;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? addedDate;
  String? userAsLeadId;

  GetBNCmodel(
      {this.id,
        this.row,
        this.productId,
        this.catId,
        this.subCatId,
        this.sscatId,
        this.userId,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.addedDate,
        this.userAsLeadId});

  GetBNCmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    row = json['row'];
    productId = json['product_id'];
    catId = json['cat_id'];
    subCatId = json['sub_cat_id'];
    sscatId = json['sscat_id'];
    userId = json['user_id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addedDate = json['added_date'];
    userAsLeadId = json['user_as_lead_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['row'] = this.row;
    data['product_id'] = this.productId;
    data['cat_id'] = this.catId;
    data['sub_cat_id'] = this.subCatId;
    data['sscat_id'] = this.sscatId;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['added_date'] = this.addedDate;
    data['user_as_lead_id'] = this.userAsLeadId;
    return data;
  }
}
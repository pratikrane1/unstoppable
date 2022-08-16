class ManageAllBuyingRequirmentRepo {
  String? result;
  dynamic data;

  ManageAllBuyingRequirmentRepo({this.result, this.data});

  // ManageAllBuyingRequirmentRepo.fromJson(Map<String, dynamic> json) {
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

class ManageAllBuyingRequirmentModel {
  String? id;
  String? userId;
  String? description;
  String? createdAt;
  String? prodName;
  String? isLead;
  String? catId;
  String? subcatId;
  String? useCase;
  String? type;
  String? approx;
  String? unitType;
  String? unit;
  String? sup;
  String? supWill;
  String? other;
  String? other1;

  ManageAllBuyingRequirmentModel(
      {this.id,
        this.userId,
        this.description,
        this.createdAt,
        this.prodName,
        this.isLead,
        this.catId,
        this.subcatId,
        this.useCase,
        this.type,
        this.approx,
        this.unitType,
        this.unit,
        this.sup,
        this.supWill,
        this.other,
        this.other1});

  ManageAllBuyingRequirmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    description = json['description'];
    createdAt = json['created_at'];
    prodName = json['prod_name'];
    isLead = json['is_lead'];
    catId = json['cat_id'];
    subcatId = json['subcat_id'];
    useCase = json['use_case'];
    type = json['type'];
    approx = json['approx'];
    unitType = json['unit_type'];
    unit = json['unit'];
    sup = json['sup'];
    supWill = json['sup_will'];
    other = json['other'];
    other1 = json['other1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['prod_name'] = this.prodName;
    data['is_lead'] = this.isLead;
    data['cat_id'] = this.catId;
    data['subcat_id'] = this.subcatId;
    data['use_case'] = this.useCase;
    data['type'] = this.type;
    data['approx'] = this.approx;
    data['unit_type'] = this.unitType;
    data['unit'] = this.unit;
    data['sup'] = this.sup;
    data['sup_will'] = this.supWill;
    data['other'] = this.other;
    data['other1'] = this.other1;
    return data;
  }
}
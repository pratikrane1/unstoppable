class ManageAllBuyingRequirementRepo {
  String? result;
  // List<Data>? data;
  dynamic data;

  ManageAllBuyingRequirementRepo({this.result, this.data});

  factory ManageAllBuyingRequirementRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return ManageAllBuyingRequirementRepo(
        result: json['result'],
        data: json['data'],
      );
    } catch (error) {
      return ManageAllBuyingRequirementRepo(
        result: "",
        data: null,
      );
    }
  }

//   ManageAllBuyingRequirementRepo.fromJson(Map<String, dynamic> json) {
//     result = json['result'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['result'] = this.result;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
}

class ManageAllBuyingRequirementModel {
  String? id;
  String? userId;
  String? catId;
  String? catName;
  String? subcatId;
  String? subCatName;
  String? prodName;
  String? description;
  String? isLead;
  String? useCase;
  String? type;
  String? approx;
  String? unitType;
  String? unit;
  String? sup;
  String? supWill;
  String? other;
  String? other1;

  ManageAllBuyingRequirementModel(
      {this.id,
        this.userId,
        this.catId,
        this.catName,
        this.subcatId,
        this.subCatName,
        this.prodName,
        this.description,
        this.isLead,
        this.useCase,
        this.type,
        this.approx,
        this.unitType,
        this.unit,
        this.sup,
        this.supWill,
        this.other,
        this.other1});

  ManageAllBuyingRequirementModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    subcatId = json['subcat_id'];
    subCatName = json['sub_cat_name'];
    prodName = json['prod_name'];
    description = json['description'];
    isLead = json['is_lead'];
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
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['subcat_id'] = this.subcatId;
    data['sub_cat_name'] = this.subCatName;
    data['prod_name'] = this.prodName;
    data['description'] = this.description;
    data['is_lead'] = this.isLead;
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
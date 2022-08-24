class UnstoppableOrderRepo {
  String? result;
  dynamic data;

  UnstoppableOrderRepo({this.result, this.data});
  factory UnstoppableOrderRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return UnstoppableOrderRepo(
        result: json['result'],
        data: json['data'],
      );
    } catch (error) {
      return UnstoppableOrderRepo(
        result: "",
        data: null,
      );
    }
  }

  // UnstoppableOrderRepo.fromJson(Map<String, dynamic> json) {
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

class UnstoppableOrderModel {
  String? leadId;
  String? businessCategory;
  String? businessSubCat;
  String? businessName;
  String? customerName;
  String? customerContact;
  String? customerMail;
  String? customerAddress;
  String? dateTime;
  String? currentLeadStatus;
  String? type;
  String? useCase;
  String? latestType;
  String? approx;
  String? unitType;
  String? unit;
  String? sup;
  String? supWill;
  String? prodName;
  String? description;
  String? other;
  String? other1;
  String? leadStatusId;
  String? isViewed;
  String? leadHostoryId;
  String? qty;
  String? amount;
  String? status;

  UnstoppableOrderModel(
      {this.leadId,
        this.businessCategory,
        this.businessSubCat,
        this.businessName,
        this.customerName,
        this.customerContact,
        this.customerMail,
        this.customerAddress,
        this.dateTime,
        this.currentLeadStatus,
        this.type,
        this.useCase,
        this.latestType,
        this.approx,
        this.unitType,
        this.unit,
        this.sup,
        this.supWill,
        this.prodName,
        this.description,
        this.other,
        this.other1,
        this.leadStatusId,
        this.isViewed,
        this.leadHostoryId,
        this.qty,
        this.amount,
        this.status});

  UnstoppableOrderModel.fromJson(Map<String, dynamic> json) {
    leadId = json['lead_id'];
    businessCategory = json['business_category'];
    businessSubCat = json['business_sub_cat'];
    businessName = json['business_name'];
    customerName = json['customer_name'];
    customerContact = json['customer_contact'];
    customerMail = json['customer_mail'];
    customerAddress = json['customer_address'];
    dateTime = json['date_time'];
    currentLeadStatus = json['current_lead_status'];
    type = json['type'];
    useCase = json['use_case'];
    latestType = json['latest_type'];
    approx = json['approx'];
    unitType = json['unit_type'];
    unit = json['unit'];
    sup = json['sup'];
    supWill = json['sup_will'];
    prodName = json['prod_name'];
    description = json['description'];
    other = json['other'];
    other1 = json['other1'];
    leadStatusId = json['lead_status_id'];
    isViewed = json['is_viewed'];
    leadHostoryId = json['lead_hostory_id'];
    qty = json['qty'];
    amount = json['amount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lead_id'] = this.leadId;
    data['business_category'] = this.businessCategory;
    data['business_sub_cat'] = this.businessSubCat;
    data['business_name'] = this.businessName;
    data['customer_name'] = this.customerName;
    data['customer_contact'] = this.customerContact;
    data['customer_mail'] = this.customerMail;
    data['customer_address'] = this.customerAddress;
    data['date_time'] = this.dateTime;
    data['current_lead_status'] = this.currentLeadStatus;
    data['type'] = this.type;
    data['use_case'] = this.useCase;
    data['latest_type'] = this.latestType;
    data['approx'] = this.approx;
    data['unit_type'] = this.unitType;
    data['unit'] = this.unit;
    data['sup'] = this.sup;
    data['sup_will'] = this.supWill;
    data['prod_name'] = this.prodName;
    data['description'] = this.description;
    data['other'] = this.other;
    data['other1'] = this.other1;
    data['lead_status_id'] = this.leadStatusId;
    data['is_viewed'] = this.isViewed;
    data['lead_hostory_id'] = this.leadHostoryId;
    data['qty'] = this.qty;
    data['amount'] = this.amount;
    data['status'] = this.status;
    return data;
  }
}
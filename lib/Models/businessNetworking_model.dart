
class BusinessNetworkingRepo {
  String? result;
  Data? data;

  BusinessNetworkingRepo({this.result, this.data});

  BusinessNetworkingRepo.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Requirements>? requirements;
  RandService? randService;
  RandFreelancer? randFreelancer;

  Data({this.requirements, this.randService, this.randFreelancer});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['requirements'] != null) {
      requirements =[];
      json['requirements'].forEach((v) {
        requirements!.add(new Requirements.fromJson(v));
      });
    }
    randService = json['rand_service'] != null
        ? new RandService.fromJson(json['rand_service'])
        : null;
    randFreelancer = json['rand_freelancer'] != null
        ? new RandFreelancer.fromJson(json['rand_freelancer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.requirements != null) {
      data['requirements'] = this.requirements!.map((v) => v.toJson()).toList();
    }
    if (this.randService != null) {
      data['rand_service'] = this.randService!.toJson();
    }
    if (this.randFreelancer != null) {
      data['rand_freelancer'] = this.randFreelancer!.toJson();
    }
    return data;
  }
}

class Requirements {
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
  String? name;
  String? bussinessName;
  String? email;
  String? mobileNo;
  String? prodName;

  Requirements(
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
        this.userAsLeadId,
        this.name,
        this.bussinessName,
        this.email,
        this.mobileNo,
        this.prodName});

  Requirements.fromJson(Map<String, dynamic> json) {
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
    name = json['name'];
    bussinessName = json['bussiness_name'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    prodName = json['prod_name'];
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
    data['name'] = this.name;
    data['bussiness_name'] = this.bussinessName;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['prod_name'] = this.prodName;
    return data;
  }
}

class RandService {
  String? userId;
  String? name;
  String? bussinessName;
  String? catId;
  String? subcatId;
  dynamic subsubCatId;
  String? businessTyp;
  String? ownershipTyp;
  String? estYear;
  String? totEmployee;
  String? annualTurnover;
  String? gstNo;
  String? address;
  String? pinCode;
  String? email;
  String? mobileNo;
  String? password;
  String? roleId;
  String? status;
  String? addedDate;
  String? updatedDate;
  String? paymentStatus;
  String? subscriptionFromDate;
  String? subscriptionToDate;
  String? companyLogo;
  String? currentLeadStatus;
  String? referralCode;
  String? referBy;
  String? referralStatus;
  dynamic csrId;

  RandService(
      {this.userId,
        this.name,
        this.bussinessName,
        this.catId,
        this.subcatId,
        this.subsubCatId,
        this.businessTyp,
        this.ownershipTyp,
        this.estYear,
        this.totEmployee,
        this.annualTurnover,
        this.gstNo,
        this.address,
        this.pinCode,
        this.email,
        this.mobileNo,
        this.password,
        this.roleId,
        this.status,
        this.addedDate,
        this.updatedDate,
        this.paymentStatus,
        this.subscriptionFromDate,
        this.subscriptionToDate,
        this.companyLogo,
        this.currentLeadStatus,
        this.referralCode,
        this.referBy,
        this.referralStatus,
        this.csrId});

  RandService.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    bussinessName = json['bussiness_name'];
    catId = json['cat_id'];
    subcatId = json['subcat_id'];
    subsubCatId = json['subsub_cat_id'];
    businessTyp = json['business_typ'];
    ownershipTyp = json['ownership_typ'];
    estYear = json['est_year'];
    totEmployee = json['tot_employee'];
    annualTurnover = json['annual_turnover'];
    gstNo = json['gst_no'];
    address = json['address'];
    pinCode = json['pin_code'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    password = json['password'];
    roleId = json['role_id'];
    status = json['status'];
    addedDate = json['added_date'];
    updatedDate = json['updated_date'];
    paymentStatus = json['payment_status'];
    subscriptionFromDate = json['subscription_from_date'];
    subscriptionToDate = json['subscription_to_date'];
    companyLogo = json['company_logo'];
    currentLeadStatus = json['current_lead_status'];
    referralCode = json['referral_code'];
    referBy = json['refer_by'];
    referralStatus = json['referral_status'];
    csrId = json['csr_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['bussiness_name'] = this.bussinessName;
    data['cat_id'] = this.catId;
    data['subcat_id'] = this.subcatId;
    data['subsub_cat_id'] = this.subsubCatId;
    data['business_typ'] = this.businessTyp;
    data['ownership_typ'] = this.ownershipTyp;
    data['est_year'] = this.estYear;
    data['tot_employee'] = this.totEmployee;
    data['annual_turnover'] = this.annualTurnover;
    data['gst_no'] = this.gstNo;
    data['address'] = this.address;
    data['pin_code'] = this.pinCode;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['password'] = this.password;
    data['role_id'] = this.roleId;
    data['status'] = this.status;
    data['added_date'] = this.addedDate;
    data['updated_date'] = this.updatedDate;
    data['payment_status'] = this.paymentStatus;
    data['subscription_from_date'] = this.subscriptionFromDate;
    data['subscription_to_date'] = this.subscriptionToDate;
    data['company_logo'] = this.companyLogo;
    data['current_lead_status'] = this.currentLeadStatus;
    data['referral_code'] = this.referralCode;
    data['refer_by'] = this.referBy;
    data['referral_status'] = this.referralStatus;
    data['csr_id'] = this.csrId;
    return data;
  }
}

class RandFreelancer {
  String? userId;
  String? name;
  String? bussinessName;
  String? catId;
  String? subcatId;
  String? subsubCatId;
  String? businessTyp;
  String? ownershipTyp;
  String? estYear;
  String? totEmployee;
  String? annualTurnover;
  String? gstNo;
  String? address;
  String? pinCode;
  String? email;
  String? mobileNo;
  String? password;
  String? roleId;
  String? status;
  String? addedDate;
  String? updatedDate;
  String? paymentStatus;
  String? subscriptionFromDate;
  String? subscriptionToDate;
  String? companyLogo;
  String? currentLeadStatus;
  String? referralCode;
  String? referBy;
  String? referralStatus;
  dynamic csrId;

  RandFreelancer(
      {this.userId,
        this.name,
        this.bussinessName,
        this.catId,
        this.subcatId,
        this.subsubCatId,
        this.businessTyp,
        this.ownershipTyp,
        this.estYear,
        this.totEmployee,
        this.annualTurnover,
        this.gstNo,
        this.address,
        this.pinCode,
        this.email,
        this.mobileNo,
        this.password,
        this.roleId,
        this.status,
        this.addedDate,
        this.updatedDate,
        this.paymentStatus,
        this.subscriptionFromDate,
        this.subscriptionToDate,
        this.companyLogo,
        this.currentLeadStatus,
        this.referralCode,
        this.referBy,
        this.referralStatus,
        this.csrId});

  RandFreelancer.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    bussinessName = json['bussiness_name'];
    catId = json['cat_id'];
    subcatId = json['subcat_id'];
    subsubCatId = json['subsub_cat_id'];
    businessTyp = json['business_typ'];
    ownershipTyp = json['ownership_typ'];
    estYear = json['est_year'];
    totEmployee = json['tot_employee'];
    annualTurnover = json['annual_turnover'];
    gstNo = json['gst_no'];
    address = json['address'];
    pinCode = json['pin_code'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    password = json['password'];
    roleId = json['role_id'];
    status = json['status'];
    addedDate = json['added_date'];
    updatedDate = json['updated_date'];
    paymentStatus = json['payment_status'];
    subscriptionFromDate = json['subscription_from_date'];
    subscriptionToDate = json['subscription_to_date'];
    companyLogo = json['company_logo'];
    currentLeadStatus = json['current_lead_status'];
    referralCode = json['referral_code'];
    referBy = json['refer_by'];
    referralStatus = json['referral_status'];
    csrId = json['csr_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['bussiness_name'] = this.bussinessName;
    data['cat_id'] = this.catId;
    data['subcat_id'] = this.subcatId;
    data['subsub_cat_id'] = this.subsubCatId;
    data['business_typ'] = this.businessTyp;
    data['ownership_typ'] = this.ownershipTyp;
    data['est_year'] = this.estYear;
    data['tot_employee'] = this.totEmployee;
    data['annual_turnover'] = this.annualTurnover;
    data['gst_no'] = this.gstNo;
    data['address'] = this.address;
    data['pin_code'] = this.pinCode;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['password'] = this.password;
    data['role_id'] = this.roleId;
    data['status'] = this.status;
    data['added_date'] = this.addedDate;
    data['updated_date'] = this.updatedDate;
    data['payment_status'] = this.paymentStatus;
    data['subscription_from_date'] = this.subscriptionFromDate;
    data['subscription_to_date'] = this.subscriptionToDate;
    data['company_logo'] = this.companyLogo;
    data['current_lead_status'] = this.currentLeadStatus;
    data['referral_code'] = this.referralCode;
    data['refer_by'] = this.referBy;
    data['referral_status'] = this.referralStatus;
    data['csr_id'] = this.csrId;
    return data;
  }
}
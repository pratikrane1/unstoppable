class UserProfileRepo {
  String? result;
  dynamic data;

  // UserProfileRepo({this.result, this.data});
  // factory UserProfileRepo.fromJson(Map<dynamic, dynamic> json) {
  //   try {
  //     return UserProfileRepo(
  //       result: json['result'],
  //       data: json['data'],
  //     );
  //   } catch (error) {
  //     return UserProfileRepo(
  //       result: "",
  //       data: null,
  //     );
  //   }
  // }

  UserProfileRepo.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <UserProfileModel>[];
      json['data'].forEach((v) {
        data!.add(new UserProfileModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserProfileModel {
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
  String? csrId;
  String? catName;
  String? subCatName;
  String? ssCatName;

  UserProfileModel(
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
        this.csrId,
        this.catName,
        this.subCatName,
        this.ssCatName});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
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
    catName = json['cat_name'];
    subCatName = json['sub_cat_name'];
    ssCatName = json['ss_cat_name'];
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
    data['cat_name'] = this.catName;
    data['sub_cat_name'] = this.subCatName;
    data['ss_cat_name'] = this.ssCatName;
    return data;
  }
}
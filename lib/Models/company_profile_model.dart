class CompanyProfileRepo {
  String? result;
  dynamic data;

  CompanyProfileRepo({this.result, this.data});


  factory CompanyProfileRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return CompanyProfileRepo(
        result: json['result'],
        data: json['data'],
      );
    } catch (error) {
      return CompanyProfileRepo(
        result: "",
        data: null,
      );
    }
  }

  // CompanyProfileRepo.fromJson(Map<String, dynamic> json) {
  //   result = json['result'];
  //   if (json['data'] != null) {
  //     data = <CompanyProfileModel>[];
  //     json['data'].forEach((v) {
  //       data!.add(new CompanyProfileModel.fromJson(v));
  //     });
  //   }
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['result'] = this.result;
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class CompanyProfileModel {
  String? compId;
  String? userId;
  String? name;
  String? managingDirector;
  String? ceo;
  String? companyName;
  String? operatorDesignation;
  String? operatorName;
  String? businessAddress;
  String? country;
  String? state;
  String? city;
  String? zipCode;
  String? gstin;
  String? website;
  String? mobileNo;
  String? altMobileNo;
  String? email;
  String? altEmail;
  String? landlineNo;
  String? estYear;
  String? businessTyp;
  String? ownershipTyp;
  String? totEmployee;
  String? annualTurnover;
  String? panNo;
  String? tanNo;
  String? cinNo;
  String? dfgt;
  String? status;
  String? addedDate;
  String? updatedDate;

  CompanyProfileModel(
      {this.compId,
        this.userId,
        this.name,
        this.managingDirector,
        this.ceo,
        this.companyName,
        this.operatorDesignation,
        this.operatorName,
        this.businessAddress,
        this.country,
        this.state,
        this.city,
        this.zipCode,
        this.gstin,
        this.website,
        this.mobileNo,
        this.altMobileNo,
        this.email,
        this.altEmail,
        this.landlineNo,
        this.estYear,
        this.businessTyp,
        this.ownershipTyp,
        this.totEmployee,
        this.annualTurnover,
        this.panNo,
        this.tanNo,
        this.cinNo,
        this.dfgt,
        this.status,
        this.addedDate,
        this.updatedDate});

  CompanyProfileModel.fromJson(Map<String, dynamic> json) {
    compId = json['comp_id'];
    userId = json['user_id'];
    name = json['name'];
    managingDirector = json['managing_director'];
    ceo = json['ceo'];
    companyName = json['company_name'];
    operatorDesignation = json['operator_designation'];
    operatorName = json['operator_name'];
    businessAddress = json['business_address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zipCode = json['zip_code'];
    gstin = json['gstin'];
    website = json['website'];
    mobileNo = json['mobile_no'];
    altMobileNo = json['alt_mobile_no'];
    email = json['email'];
    altEmail = json['alt_email'];
    landlineNo = json['landline_no'];
    estYear = json['est_year'];
    businessTyp = json['business_typ'];
    ownershipTyp = json['ownership_typ'];
    totEmployee = json['tot_employee'];
    annualTurnover = json['annual_turnover'];
    panNo = json['pan_no'];
    tanNo = json['tan_no'];
    cinNo = json['cin_no'];
    dfgt = json['dfgt'];
    status = json['status'];
    addedDate = json['added_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comp_id'] = this.compId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['managing_director'] = this.managingDirector;
    data['ceo'] = this.ceo;
    data['company_name'] = this.companyName;
    data['operator_designation'] = this.operatorDesignation;
    data['operator_name'] = this.operatorName;
    data['business_address'] = this.businessAddress;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zip_code'] = this.zipCode;
    data['gstin'] = this.gstin;
    data['website'] = this.website;
    data['mobile_no'] = this.mobileNo;
    data['alt_mobile_no'] = this.altMobileNo;
    data['email'] = this.email;
    data['alt_email'] = this.altEmail;
    data['landline_no'] = this.landlineNo;
    data['est_year'] = this.estYear;
    data['business_typ'] = this.businessTyp;
    data['ownership_typ'] = this.ownershipTyp;
    data['tot_employee'] = this.totEmployee;
    data['annual_turnover'] = this.annualTurnover;
    data['pan_no'] = this.panNo;
    data['tan_no'] = this.tanNo;
    data['cin_no'] = this.cinNo;
    data['dfgt'] = this.dfgt;
    data['status'] = this.status;
    data['added_date'] = this.addedDate;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}

// class UserProfileModel {
//   String? userId;
//   String? name;
//   String? bussinessName;
//   String? catId;
//   String? subcatId;
//   String? subsubCatId;
//   String? businessTyp;
//   String? ownershipTyp;
//   String? estYear;
//   String? totEmployee;
//   String? annualTurnover;
//   String? gstNo;
//   String? address;
//   String? pinCode;
//   String? email;
//   String? mobileNo;
//   String? password;
//   String? roleId;
//   String? status;
//   String? addedDate;
//   String? updatedDate;
//   String? paymentStatus;
//   String? subscriptionFromDate;
//   String? subscriptionToDate;
//   String? companyLogo;
//   String? currentLeadStatus;
//   String? referralCode;
//   String? referBy;
//   String? referralStatus;
//   String? csrId;
//   String? catName;
//   String? subCatName;
//   String? ssCatName;
//
//   UserProfileModel(
//       {this.userId,
//         this.name,
//         this.bussinessName,
//         this.catId,
//         this.subcatId,
//         this.subsubCatId,
//         this.businessTyp,
//         this.ownershipTyp,
//         this.estYear,
//         this.totEmployee,
//         this.annualTurnover,
//         this.gstNo,
//         this.address,
//         this.pinCode,
//         this.email,
//         this.mobileNo,
//         this.password,
//         this.roleId,
//         this.status,
//         this.addedDate,
//         this.updatedDate,
//         this.paymentStatus,
//         this.subscriptionFromDate,
//         this.subscriptionToDate,
//         this.companyLogo,
//         this.currentLeadStatus,
//         this.referralCode,
//         this.referBy,
//         this.referralStatus,
//         this.csrId,
//         this.catName,
//         this.subCatName,
//         this.ssCatName});
//
//   UserProfileModel.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'];
//     name = json['name'];
//     bussinessName = json['bussiness_name'];
//     catId = json['cat_id'];
//     subcatId = json['subcat_id'];
//     subsubCatId = json['subsub_cat_id'];
//     businessTyp = json['business_typ'];
//     ownershipTyp = json['ownership_typ'];
//     estYear = json['est_year'];
//     totEmployee = json['tot_employee'];
//     annualTurnover = json['annual_turnover'];
//     gstNo = json['gst_no'];
//     address = json['address'];
//     pinCode = json['pin_code'];
//     email = json['email'];
//     mobileNo = json['mobile_no'];
//     password = json['password'];
//     roleId = json['role_id'];
//     status = json['status'];
//     addedDate = json['added_date'];
//     updatedDate = json['updated_date'];
//     paymentStatus = json['payment_status'];
//     subscriptionFromDate = json['subscription_from_date'];
//     subscriptionToDate = json['subscription_to_date'];
//     companyLogo = json['company_logo'];
//     currentLeadStatus = json['current_lead_status'];
//     referralCode = json['referral_code'];
//     referBy = json['refer_by'];
//     referralStatus = json['referral_status'];
//     csrId = json['csr_id'];
//     catName = json['cat_name'];
//     subCatName = json['sub_cat_name'];
//     ssCatName = json['ss_cat_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_id'] = this.userId;
//     data['name'] = this.name;
//     data['bussiness_name'] = this.bussinessName;
//     data['cat_id'] = this.catId;
//     data['subcat_id'] = this.subcatId;
//     data['subsub_cat_id'] = this.subsubCatId;
//     data['business_typ'] = this.businessTyp;
//     data['ownership_typ'] = this.ownershipTyp;
//     data['est_year'] = this.estYear;
//     data['tot_employee'] = this.totEmployee;
//     data['annual_turnover'] = this.annualTurnover;
//     data['gst_no'] = this.gstNo;
//     data['address'] = this.address;
//     data['pin_code'] = this.pinCode;
//     data['email'] = this.email;
//     data['mobile_no'] = this.mobileNo;
//     data['password'] = this.password;
//     data['role_id'] = this.roleId;
//     data['status'] = this.status;
//     data['added_date'] = this.addedDate;
//     data['updated_date'] = this.updatedDate;
//     data['payment_status'] = this.paymentStatus;
//     data['subscription_from_date'] = this.subscriptionFromDate;
//     data['subscription_to_date'] = this.subscriptionToDate;
//     data['company_logo'] = this.companyLogo;
//     data['current_lead_status'] = this.currentLeadStatus;
//     data['referral_code'] = this.referralCode;
//     data['refer_by'] = this.referBy;
//     data['referral_status'] = this.referralStatus;
//     data['csr_id'] = this.csrId;
//     data['cat_name'] = this.catName;
//     data['sub_cat_name'] = this.subCatName;
//     data['ss_cat_name'] = this.ssCatName;
//     return data;
//   }
// }
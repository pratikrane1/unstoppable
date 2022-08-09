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
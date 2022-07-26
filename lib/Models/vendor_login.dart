class VendorLoginResp {
  dynamic result;
  dynamic message;
  dynamic data;

  VendorLoginResp({this.result, this.message, this.data});

  VendorLoginResp.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['Message'];
    data = json['data'] != null ? new VendorLogin.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['Message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class VendorLogin {
  String? result;
  String? userId;
  String? name;
  String? bussinessName;
  String? email;
  String? gstNo;
  String? address;
  String? referralCode;

  VendorLogin(
      {this.result,
        this.userId,
        this.name,
        this.bussinessName,
        this.email,
        this.gstNo,
        this.address,
        this.referralCode});

  VendorLogin.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    userId = json['user_id'];
    name = json['name'];
    bussinessName = json['bussiness_name'];
    email = json['email'];
    gstNo = json['gst_no'];
    address = json['address'];
    referralCode = json['referral_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['bussiness_name'] = this.bussinessName;
    data['email'] = this.email;
    data['gst_no'] = this.gstNo;
    data['address'] = this.address;
    data['referral_code'] = this.referralCode;
    return data;
  }
}
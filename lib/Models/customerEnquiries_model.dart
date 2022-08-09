class CustomerEnquiriesModelRepo {
  String? result;
  dynamic data;

  CustomerEnquiriesModelRepo({this.result, this.data});
  factory CustomerEnquiriesModelRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return CustomerEnquiriesModelRepo(
        result: json['result'],
        data: json['data'],
      );
    } catch (error) {
      return CustomerEnquiriesModelRepo(
        result: "",
        data: null,
      );
    }
  }

  // CustomerEnquiriesModelRepo.fromJson(Map<String, dynamic> json) {
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

class CustomerEnquiriesModel {
  String? enqId;
  String? prodId;
  String? buyerId;
  String? message;
  String? status;
  String? addedDate;
  String? updatedDate;
  String? isRead;
  String? prodName;
  String? userId;
  String? name;
  String? email;
  String? mobileNo;

  CustomerEnquiriesModel(
      {this.enqId,
        this.prodId,
        this.buyerId,
        this.message,
        this.status,
        this.addedDate,
        this.updatedDate,
        this.isRead,
        this.prodName,
        this.userId,
        this.name,
        this.email,
        this.mobileNo});

  CustomerEnquiriesModel.fromJson(Map<String, dynamic> json) {
    enqId = json['enq_id'];
    prodId = json['prod_id'];
    buyerId = json['buyer_id'];
    message = json['message'];
    status = json['status'];
    addedDate = json['added_date'];
    updatedDate = json['updated_date'];
    isRead = json['is_read'];
    prodName = json['prod_name'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobile_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enq_id'] = this.enqId;
    data['prod_id'] = this.prodId;
    data['buyer_id'] = this.buyerId;
    data['message'] = this.message;
    data['status'] = this.status;
    data['added_date'] = this.addedDate;
    data['updated_date'] = this.updatedDate;
    data['is_read'] = this.isRead;
    data['prod_name'] = this.prodName;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    return data;
  }
}
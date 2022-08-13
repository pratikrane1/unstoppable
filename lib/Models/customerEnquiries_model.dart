class CustomerEnquiriesModelRepo {
String result;
dynamic data;

CustomerEnquiriesModelRepo({required this.result, this.data});

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
}

class CustomerEnquiriesModel {
  String? productId;
  String? categoryName;
  String? subCategoryName;
  String? ssCategoryName;
  String? productName;
  String? productImage;
  String? status;
  String? statusName;
  String? enqId;
  String? message;
  String? isRead;
  String? buyerId;
  String? name;
  String? email;
  String? mobileNo;
  String? enquiryDate;

  CustomerEnquiriesModel({this.productId, this.categoryName, this.subCategoryName, this.ssCategoryName, this.productName, this.productImage, this.status, this.statusName, this.enqId, this.message, this.isRead, this.buyerId, this.name, this.email, this.mobileNo, this.enquiryDate});

  CustomerEnquiriesModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryName = json['category_name'];
    subCategoryName = json['sub_category_name'];
    ssCategoryName = json['ss_category_name'];
    productName = json['product_name'];
    productImage = json['product_image'];
    status = json['status'];
    statusName = json['status_name'];
    enqId = json['enq_id'];
    message = json['message'];
    isRead = json['is_read'];
    buyerId = json['buyer_id'];
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    enquiryDate = json['enquiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['category_name'] = this.categoryName;
    data['sub_category_name'] = this.subCategoryName;
    data['ss_category_name'] = this.ssCategoryName;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['status'] = this.status;
    data['status_name'] = this.statusName;
    data['enq_id'] = this.enqId;
    data['message'] = this.message;
    data['is_read'] = this.isRead;
    data['buyer_id'] = this.buyerId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['enquiry_date'] = this.enquiryDate;
    return data;
  }
}
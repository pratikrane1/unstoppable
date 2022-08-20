class ProductNameListRepo {
  String? result;
  dynamic data;

  ProductNameListRepo({this.result, this.data});

  factory ProductNameListRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return ProductNameListRepo(
        result: json['result'],
        data: json['data'],
      );
    } catch (error) {
      return ProductNameListRepo(
        result: "",
        data: null,
      );
    }
  }

  // ProductNameListRepo.fromJson(Map<String, dynamic> json) {
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

class ProductNameModel {
  String? prodId;
  String? prodName;

  ProductNameModel({this.prodId, this.prodName});

  ProductNameModel.fromJson(Map<String, dynamic> json) {
    prodId = json['prod_id'];
    prodName = json['prod_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prod_id'] = this.prodId;
    data['prod_name'] = this.prodName;
    return data;
  }
}
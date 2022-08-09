class ProductImageRepo {
  String? result;
  dynamic data;

  ProductImageRepo({this.result, this.data});
  factory ProductImageRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return ProductImageRepo(
        result: json['result'],
        data: json['data'],
      );
    } catch (error) {
      return ProductImageRepo(
        result: "",
        data: null,
      );
    }
  }
  // ProductImageRepo.fromJson(Map<String, dynamic> json) {
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

class ProductImageModel {
  String? imgId;
  String? productImage;

  ProductImageModel({this.imgId, this.productImage});

  ProductImageModel.fromJson(Map<String, dynamic> json) {
    imgId = json['img_id'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img_id'] = this.imgId;
    data['product_image'] = this.productImage;
    return data;
  }
}
class ProductRepo {
  String? result;
  dynamic data;

  ProductRepo({this.result, this.data});
  factory ProductRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return ProductRepo(
        result: json['result'],
        data: json['data'],
      );
    } catch (error) {
      return ProductRepo(
        result: "",
        data: null,
      );
    }
  }


// ProductRepo.fromJson(Map<String, dynamic> json) {
  //   result = json['result'];
  //   if (json['data'] != null) {
  //     data = <ProductModel>[];
  //     json['data'].forEach((v) {
  //       data!.add(new ProductModel.fromJson(v));
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

class ProductModel {
  String? productId;
  String? categoryName;
  String? productName;
  String? price;
  String? description;
  String? status;
  String? statusName;

  ProductModel(
      {this.productId,
        this.categoryName,
        this.productName,
        this.price,
        this.description,
        this.status,
        this.statusName});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryName = json['category_name'];
    productName = json['product_name'];
    price = json['price'];
    description = json['description'];
    status = json['status'];
    statusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['category_name'] = this.categoryName;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['description'] = this.description;
    data['status'] = this.status;
    data['status_name'] = this.statusName;
    return data;
  }
}

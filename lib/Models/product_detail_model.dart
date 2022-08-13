class ProductDetailRepo {
  String? result;
  dynamic data;

  ProductDetailRepo({this.result, this.data});

  ProductDetailRepo.fromJson(Map<dynamic, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? new ProductDetail.fromJson(json['data']) : null;
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

class ProductDetail {
  String? productId;
  String? categoryName;
  String? subCategoryName;
  String? ssCategoryName;
  String? productName;
  String? price;
  String? description;
  String? status;
  String? statusName;
  String? catId;
  String? subCatId;
  String? productImg;

  ProductDetail(
      {
        this.productId,
        this.categoryName,
        this.subCategoryName,
        this.ssCategoryName,
        this.productName,
        this.price,
        this.description,
        this.status,
        this.statusName,
      this.catId,
      this.subCatId,
      this.productImg});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryName = json['category_name'];
    subCategoryName = json['sub_category_name'];
    ssCategoryName = json['ss_category_name'];
    productName = json['product_name'];
    price = json['price'];
    description = json['description'];
    status = json['status'];
    statusName = json['status_name'];
    catId=json['cat_id'];
    subCatId=json['subcat_id'];
    productImg=json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['category_name'] = this.categoryName;
    data['sub_category_name'] = this.subCategoryName;
    data['ss_category_name'] = this.ssCategoryName;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['description'] = this.description;
    data['status'] = this.status;
    data['status_name'] = this.statusName;
    data['cat_id']=this.catId;
    data['subcat_id']=this.subCatId;
    data['product_image']=this.productImg;
    return data;
  }
}
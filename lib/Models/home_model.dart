class DashBoardCountResp {
  String? totalProduct;
  DashBoardCountResp({this.totalProduct});
  DashBoardCountResp.fromJson(Map<String, dynamic> json) {
    totalProduct = json['total_product'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_product'] = this.totalProduct;
    return data;
  }
}

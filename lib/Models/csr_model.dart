class CSRRepo {
  String? result;
  dynamic data;

  CSRRepo({this.result, this.data});

  CSRRepo.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? new CSRData.fromJson(json['data']) : null;
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

class CSRData {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? category;
  String? active;
  String? createdAt;
  String? updatedAt;

  CSRData(
      {this.id,
        this.name,
        this.email,
        this.mobile,
        this.category,
        this.active,
        this.createdAt,
        this.updatedAt});

  CSRData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    category = json['category'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['category'] = this.category;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
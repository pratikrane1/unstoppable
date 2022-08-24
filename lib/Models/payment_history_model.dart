class PaymentHistoryRepo {
  String? result;
  dynamic data;

  PaymentHistoryRepo({this.result, this.data});

  factory PaymentHistoryRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return PaymentHistoryRepo(
        result: json['result'],
        data: json['data'],
      );
    } catch (error) {
      return PaymentHistoryRepo(
        result: "",
        data: null,
      );
    }
  }

  // PaymentRepo.fromJson(Map<String, dynamic> json) {
  //   result = json['result'];
  //   if (json['data'] != null) {
  //     data = <Data>[];
  //     json['data'].forEach((v) {
  //       data!.add(new Data.fromJson(v));
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

class PaymentHistoryModel {
  String? subscriptionId;
  String? userId;
  String? subscriptionFromDate;
  String? subscriptionToDate;
  String? subscriptionType;
  String? status;
  String? addedDate;

  PaymentHistoryModel(
      {this.subscriptionId,
        this.userId,
        this.subscriptionFromDate,
        this.subscriptionToDate,
        this.subscriptionType,
        this.status,
        this.addedDate});

  PaymentHistoryModel.fromJson(Map<String, dynamic> json) {
    subscriptionId = json['subscription_id'];
    userId = json['user_id'];
    subscriptionFromDate = json['subscription_from_date'];
    subscriptionToDate = json['subscription_to_date'];
    subscriptionType = json['subscription_type'];
    status = json['status'];
    addedDate = json['added_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscription_id'] = this.subscriptionId;
    data['user_id'] = this.userId;
    data['subscription_from_date'] = this.subscriptionFromDate;
    data['subscription_to_date'] = this.subscriptionToDate;
    data['subscription_type'] = this.subscriptionType;
    data['status'] = this.status;
    data['added_date'] = this.addedDate;
    return data;
  }
}
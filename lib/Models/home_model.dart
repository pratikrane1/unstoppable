class DashBoardCountResp {
  String? totalProduct;
  int? totalEnquiry;
  int? totalLeads;
  int? cancelLeads;
  int? monthlyTarget;
  int? achievement;
  String? badge;
  DashBoardCountResp({this.totalProduct,this.totalEnquiry,
    this.totalLeads,
    this.cancelLeads,
    this.monthlyTarget,
    this.achievement,
    this.badge});
  DashBoardCountResp.fromJson(Map<String, dynamic> json) {
    totalProduct = json['total_product'];
    totalEnquiry = json['total_enquiry'];
    totalLeads = json['total_leads'];
    cancelLeads = json['cancel_leads'];
    monthlyTarget = json['monthly_target'];
    achievement = json['achievement'];
    badge = json['badge'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_product'] = this.totalProduct;
    data['total_enquiry'] = this.totalEnquiry;
    data['total_leads'] = this.totalLeads;
    data['cancel_leads'] = this.cancelLeads;
    data['monthly_target'] = this.monthlyTarget;
    data['achievement'] = this.achievement;
    data['badge'] = this.badge;
    return data;
  }
}

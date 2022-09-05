import 'package:meta/meta.dart';

@immutable
abstract class BusinessOpportunityEvent {}


class OnLoadingBusinesNetworkingList extends BusinessOpportunityEvent {
  String userid;
  String offset;
  // String prodid;
  OnLoadingBusinesNetworkingList({required this.userid,required this.offset });
}

class OnLoadingBNC extends BusinessOpportunityEvent {
  String userid;
  String rowid;
  // String prodid;
  OnLoadingBNC({required this.userid,required this.rowid });
}

class UpdateBNC extends BusinessOpportunityEvent{
  String id;
  String rowid;
  String catid;
  String subcatid;
  String sscatid;
  String productid;
  String type;
  String userid;

  UpdateBNC({
    required this.catid,
    required this.subcatid,
    required this.sscatid,
    required this.id,
    required this.productid,
    required this.type,
    required this.userid,
    required this.rowid,
  });
}


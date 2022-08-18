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



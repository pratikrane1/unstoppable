import 'package:meta/meta.dart';

@immutable
abstract class BusinessOpportunityEvent {}


class OnLoadingBusinesNetworkingList extends BusinessOpportunityEvent {
  String userid;
  String offset;
  // String prodid;
  OnLoadingBusinesNetworkingList({required this.userid,required this.offset });
}





import 'package:meta/meta.dart';

@immutable
abstract class CustomerEnquiriesEvent {}


class OnLoadingCustomerEnquiriesList extends CustomerEnquiriesEvent {
  String userid;
  // String prodid;
  OnLoadingCustomerEnquiriesList({required this.userid, });
}


// class OnLoadingProductDetail extends ProductEvent {
//   String prodId;
//   OnLoadingProductDetail({required this.prodId});
// }
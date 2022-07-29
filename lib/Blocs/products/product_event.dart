import 'package:meta/meta.dart';

@immutable
abstract class ProductEvent {}


class OnLoadingProductList extends ProductEvent {
  String userid;
  // String prodid;
  OnLoadingProductList({required this.userid, });
}


class OnLoadingProductDetail extends ProductEvent {
  String prodId;
  OnLoadingProductDetail({required this.prodId});
}
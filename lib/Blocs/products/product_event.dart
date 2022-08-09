import 'package:meta/meta.dart';

@immutable
abstract class ProductEvent {}


class OnLoadingProductList extends ProductEvent {
  String userid;
  int offset;
  // String prodid;
  OnLoadingProductList({required this.userid,required this.offset });
}


class OnLoadingProductDetail extends ProductEvent {
  String prodId;
  OnLoadingProductDetail({required this.prodId});
}
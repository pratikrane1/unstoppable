import 'package:meta/meta.dart';

@immutable
abstract class ProductEvent {}


class OnLoadingProductList extends ProductEvent {
  String userid;
  int offset;
  // String prodid;
  OnLoadingProductList({required this.userid,required this.offset });
}

class DeleteProduct extends ProductEvent{
  String productid;


  DeleteProduct({required this.productid});
}

class UpdateProduct extends ProductEvent{
  String catid;
  String subcatid;
  String sscatid;
  String prodname;
  String price;
  String description;
  String productid;

  UpdateProduct({
    required this.catid,
    required this.subcatid,
    required this.sscatid,
    required this.prodname,
    required this.price,
    required this.description,
    required this.productid});
}

class OnLoadingProductDetail extends ProductEvent {
  String prodId;
  OnLoadingProductDetail({required this.prodId});
}
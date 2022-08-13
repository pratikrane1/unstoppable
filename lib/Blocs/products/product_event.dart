import 'package:meta/meta.dart';
import 'package:unstoppable/Screens/image_file.dart';

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



class OnLoadingProductDetail extends ProductEvent {
  String prodId;
  OnLoadingProductDetail({required this.prodId});
}
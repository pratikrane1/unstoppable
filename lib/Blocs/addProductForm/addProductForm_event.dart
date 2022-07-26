import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/addProductForm/addProductForm_state.dart';
import 'package:unstoppable/Screens/image_file.dart';

@immutable
abstract class AddProductFormEvent {}


class AddProductForm extends AddProductFormEvent{
  String catId,subCatId,sscatId,prodName,desc,price;
  ImageFile image;

  AddProductForm({required this.catId,required this.subCatId,required this.sscatId,required this.prodName,
  required this.desc,required this.image,required this.price
  });
}

class UploadProductImage extends AddProductFormEvent{
  String productId;
  ImageFile prodimg ;

  UploadProductImage({required this.productId,required this.prodimg});
}

class RemoveProductImage extends AddProductFormEvent{
  String imgId;


  RemoveProductImage({required this.imgId});
}

class OnLoadingProductImageList extends AddProductFormEvent {
  String productid,offset;
  // String prodid;
  OnLoadingProductImageList({required this.productid,required this.offset });
}


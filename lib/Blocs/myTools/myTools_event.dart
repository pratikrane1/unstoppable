import 'package:meta/meta.dart';
import 'package:unstoppable/Screens/image_file.dart';

@immutable
abstract class MytoolsEvent {}


class OnLoadingProductIamBuyingList extends MytoolsEvent {
  String userid;
  int offset;
  // String prodid;
  OnLoadingProductIamBuyingList({required this.userid,required this.offset });

}

class AddProductBuying extends MytoolsEvent{
  String catId,subCatId,sscatId,prodName;

  AddProductBuying({required this.catId,required this.subCatId,required this.sscatId,required this.prodName

  });
}
// class DeleteProduct extends ProductEvent{
//   String productid;
//
//
//   DeleteProduct({required this.productid});
// }





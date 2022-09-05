import 'package:meta/meta.dart';
import 'package:unstoppable/Models/product_model.dart';

@immutable
abstract class LeadsEvent {}


class OnLoadingLeadsList extends LeadsEvent {
  String userid;
  OnLoadingLeadsList({required this.userid});
}

// class OnUpdatePageCnt extends LeadsEvent {
//   List<ProductModel> productList;
//   int rowsPerPage;
//   OnUpdatePageCnt({required this.productList,required this.rowsPerPage});
// }

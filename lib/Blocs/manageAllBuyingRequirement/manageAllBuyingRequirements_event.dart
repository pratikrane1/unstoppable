import 'package:meta/meta.dart';
import 'package:unstoppable/Models/product_model.dart';

@immutable
abstract class ManageAllBuyingRequirementEvent {}


class OnLoadingManageAllBuyingRequirementList extends ManageAllBuyingRequirementEvent {
  String userid;
  OnLoadingManageAllBuyingRequirementList({required this.userid});
}


class DeleteAllBuyingRequirement extends ManageAllBuyingRequirementEvent{
  String id;


  DeleteAllBuyingRequirement({required this.id});
}

// class OnUpdatePageCnt extends LeadsEvent {
//   List<ProductModel> productList;
//   int rowsPerPage;
//   OnUpdatePageCnt({required this.productList,required this.rowsPerPage});
// }

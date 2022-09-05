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

class SaveBuyingRequirementForm extends ManageAllBuyingRequirementEvent{
  String userid;
  String categoryId;
  String subCateId;
  String prodName;
  String type;
  String other;
  String use;
  String other1;
  String approx;
  String unitType;
  String quantity;
  String suppFrom;
  String suppWill;
  String descrip;


  SaveBuyingRequirementForm({
    required this.userid,
    required this.categoryId,
    required this.subCateId,
    required this.prodName,
    required this.type,
    required this.other,
    required this.use,
    required this.other1,
    required this.approx,
    required this.unitType,
    required this.quantity,
    required this.suppFrom,
    required this.suppWill,
    required this.descrip,
  });
}

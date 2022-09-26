import 'package:meta/meta.dart';
import 'package:unstoppable/Models/product_model.dart';

@immutable
abstract class LeadsEvent {}


class OnLoadingLeadsList extends LeadsEvent {
  String userid;
  OnLoadingLeadsList({required this.userid});
}

class UpdateLead extends LeadsEvent {
  String userid;
  String leadId;
  String status;
  UpdateLead({required this.userid,required this.status, required this.leadId});
}

// class OnUpdatePageCnt extends LeadsEvent {
//   List<ProductModel> productList;
//   int rowsPerPage;
//   OnUpdatePageCnt({required this.productList,required this.rowsPerPage});
// }

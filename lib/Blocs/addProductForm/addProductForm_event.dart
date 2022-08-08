import 'package:meta/meta.dart';

@immutable
abstract class AddProductFormEvent {}


class OnLoadingCategoryList extends AddProductFormEvent {
 // String catid;
  // String? offset;
  // String prodid;
  OnLoadingCategoryList();
}
//SubCategory

abstract class AddProductFormSubCategoryEvent {}
class OnLoadingSubCategoryList extends AddProductFormEvent {
  String? catid;
  OnLoadingSubCategoryList({required this.catid});
}
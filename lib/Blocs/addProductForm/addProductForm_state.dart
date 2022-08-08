import 'package:meta/meta.dart';
import 'package:unstoppable/Models/subCategory_model.dart';

import '../../Models/category_model.dart';

@immutable
abstract class AddProductFormState {}


class InitialCategoryListState extends AddProductFormState {}


class CategoryLoading extends AddProductFormState {}



class CategoryListSuccess extends AddProductFormState {
 List<CategoryModel>? addProductFormCategoryList;
 CategoryListSuccess({this.addProductFormCategoryList});
}

class CategoryListLoadFail extends AddProductFormState {}



import 'package:meta/meta.dart';
import 'package:unstoppable/Models/productImage_model.dart';
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

// For Product ImageList

class InitialProductImageListState extends AddProductFormState {}

class AddProductLoading extends AddProductFormState{}
class ProductImageLoading extends AddProductFormState {}
class UploadImageLoading extends AddProductFormState {}
class RemoveImageLoading extends AddProductFormState {}

class AddProductSuccess extends AddProductFormState {
 String? message ;
 AddProductSuccess({this.message});
}

class AddProductFail extends AddProductFormState {
 String? message ;
 AddProductFail({this.message});
}

class UploadProductImageSuccess extends AddProductFormState {
 UploadProductImageSuccess();
}

class RemoveProductImageSuccess extends AddProductFormState {
 RemoveProductImageSuccess();
}

class ProductImageListSuccess extends AddProductFormState {
 List<ProductImageModel>? productImageList;
 ProductImageListSuccess({this.productImageList});
}


class ProductImageListLoadFail extends AddProductFormState {}




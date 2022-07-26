import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';

@immutable
abstract class ProductState {}


class InitialProductListState extends ProductState {}


class ProductLoading extends ProductState {}

class DeleteProductLoading extends ProductState {}

class UpdateProductLoading extends ProductState {}

class ProductListSuccess extends ProductState {
 List<ProductModel>? productList;
  ProductListSuccess({this.productList});
}

class ProductListLoadFail extends ProductState {}



class DeleteProductSuccess extends ProductState {
 DeleteProductSuccess();
}

class UpdateProductSuccess extends ProductState {
 UpdateProductSuccess();
}

// abstract class ProductDetailState {}


class InitialProductDetailState extends ProductState {}


class ProductDetailLoading extends ProductState {}



class ProductDetailSuccess extends ProductState {
 ProductDetail? data;
 ProductDetailSuccess({this.data});
}

class ProductDetailLoadFail extends ProductState {}

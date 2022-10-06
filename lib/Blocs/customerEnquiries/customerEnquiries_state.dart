import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';

import '../../Models/customerEnquiries_model.dart';

@immutable
abstract class CustomerEnquiriesState {}


class InitialCustomerEnquiriesListState extends CustomerEnquiriesState {}


class CustomerEnquiriesLoading extends CustomerEnquiriesState {}

class DeleteCustomerEnquiriesLoading extends CustomerEnquiriesState {}

class CustomerEnquiriesListSuccess extends CustomerEnquiriesState {
 List<CustomerEnquiriesModel>? CustomerEnquiriesList;
 CustomerEnquiriesListSuccess({this.CustomerEnquiriesList});
}

class CustomerEnquiriesListLoadFail extends CustomerEnquiriesState {}

class DeleteCustomerEnquiriesSuccess extends CustomerEnquiriesState {
 String message;
 DeleteCustomerEnquiriesSuccess({required this.message});
}

class DeleteCustomerEnquiriesFailed extends CustomerEnquiriesState {
 String message;
 DeleteCustomerEnquiriesFailed({required this.message});
}

// abstract class ProductDetailState {}


// class InitialProductDetailState extends ProductState {}
//
//
// class ProductDetailLoading extends ProductState {}
//
//
//
// class ProductDetailSuccess extends ProductState {
//  ProductDetail? data;
//  ProductDetailSuccess({this.data});
// }
//
// class ProductDetailLoadFail extends ProductState {}

import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Models/productIamBuying_model.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';

@immutable
abstract class MytoolsState {}


class InitialMytoolsState extends MytoolsState {}

class ProductIamBuyingLoading extends MytoolsState {}
class AddProductBuyingLoading extends MytoolsState {}


class AddProductBuyingSuccess extends MytoolsState {
 String? message ;
 AddProductBuyingSuccess({this.message});
}

class AddProductBuyingLoadFail extends MytoolsState {
 String? message ;
 AddProductBuyingLoadFail({this.message});
}

class ProductIamBuyingListSuccess extends MytoolsState {
 List<ProductBuyingModel>? productBuyingList;
 ProductIamBuyingListSuccess({this.productBuyingList});
}

class ProductIamBuyingListLoadFail extends MytoolsState {}








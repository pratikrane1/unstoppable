import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Models/productIamBuying_model.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';

import '../../Models/untoppable_order_model.dart';

@immutable
abstract class MytoolsState {}


class InitialMytoolsState extends MytoolsState {}

class ProductIamBuyingLoading extends MytoolsState {}
class AddProductBuyingLoading extends MytoolsState {}
class DeleteProductBuyingLoading extends MytoolsState {}
class UnstoppableOrdersLoading extends MytoolsState {}
class UpdateOrderDataLoading extends MytoolsState {}

class AddProductBuyingSuccess extends MytoolsState {
 String? message ;
 AddProductBuyingSuccess({this.message});
}

class DeleteProductBuyingSuccess extends MytoolsState {
 DeleteProductBuyingSuccess();
}
class AddProductBuyingLoadFail extends MytoolsState {
 String? message ;
 AddProductBuyingLoadFail({this.message});
}

class UnstoppableOrdersListSuccess extends MytoolsState {
 List<UnstoppableOrderModel>? ordersList;
 UnstoppableOrdersListSuccess({this.ordersList});
}

class UnstoppableOrdersListLoadFail extends MytoolsState {}

class ProductIamBuyingListSuccess extends MytoolsState {
 List<ProductBuyingModel>? productBuyingList;
 ProductIamBuyingListSuccess({this.productBuyingList});
}

class ProductIamBuyingListLoadFail extends MytoolsState {}

class UpdateOrderDataSuccess extends MytoolsState {
 UpdateOrderDataSuccess();
}
class UpdateOrderDataFail extends MytoolsState {
 UpdateOrderDataFail();
}






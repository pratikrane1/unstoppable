import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Models/get_BNC_model.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';

import '../../Models/businessNetworking_model.dart';

@immutable
abstract class BusinessOpportunityState {}


class InitialBusinessOpprortunityState extends BusinessOpportunityState {}
class BusinessNetworkingLoading extends BusinessOpportunityState {}
class GetBNCLoading extends BusinessOpportunityState {}

class BusinessNetworkingListSuccess extends BusinessOpportunityState {
 List<Requirements>? businessNetworkingList;
 BusinessNetworkingListSuccess({this.businessNetworkingList});
}

class GetBNCLoadSuccess extends BusinessOpportunityState {
 List<GetBNCmodel>? getBNCLeadList;
 GetBNCLoadSuccess({this.getBNCLeadList});
}

class BusinessNetworkingListLoadFail extends BusinessOpportunityState {}
class GetBNCLoadFail extends BusinessOpportunityState {}





// abstract class ProductDetailState {}



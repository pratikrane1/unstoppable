import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';

import '../../Models/businessNetworking_model.dart';

@immutable
abstract class BusinessOpportunityState {}


class InitialBusinessOpprortunityState extends BusinessOpportunityState {}


class BusinessNetworkingLoading extends BusinessOpportunityState {}

class BusinessNetworkingListSuccess extends BusinessOpportunityState {
 List<Requirements>? businessNetworkingList;
 BusinessNetworkingListSuccess({this.businessNetworkingList});
}

class BusinessNetworkingListLoadFail extends BusinessOpportunityState {}





// abstract class ProductDetailState {}



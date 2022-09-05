import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Models/leads_model.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';

@immutable
abstract class LeadsState {}


class InitialLeadsListState extends LeadsState {}


class LeadsListLoading extends LeadsState {}



class LeadsListSuccess extends LeadsState {
  List<LeadModel>? leadList;
  LeadsListSuccess({this.leadList});
}

class LeadsListLoadFail extends LeadsState {}

// class ProductPageCntSucess extends LeadsState {
//   double PageCnt;
//   ProductPageCntSucess({required this.PageCnt});
//
// }

import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';

@immutable
abstract class HomeState {}


class InitialHomeListState extends HomeState {}


class HomeLoading extends HomeState {}



class HomeListSuccess extends HomeState {
  var totalProd;
  var totalEnquiry;
  var totalLeads;
  var cancelLeads;
  var monthlyTarget;
  var achievements;
  HomeListSuccess({this.totalProd,this.achievements,this.cancelLeads,this.monthlyTarget,this.totalEnquiry,this.totalLeads,});
}

class HomeListLoadFail extends HomeState {}

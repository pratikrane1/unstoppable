import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';

@immutable
abstract class HomeState {}


class InitialHomeListState extends HomeState {}


class HomeLoading extends HomeState {}



class HomeListSuccess extends HomeState {
  var totalProd, totalLeads, totalEnquiry, monthlyTarget, achievements, cancelLeads ;

  HomeListSuccess({this.totalProd});
}

class HomeListLoadFail extends HomeState {}

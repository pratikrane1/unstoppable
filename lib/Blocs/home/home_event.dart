import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent {}


class OnLoadingHomeList extends HomeEvent {
  String userid;
  OnLoadingHomeList({required this.userid});
}





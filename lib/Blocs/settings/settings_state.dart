import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';

@immutable
abstract class SettingsState {}


class InitialSettingsState extends SettingsState {}


class ChangePassLoading extends SettingsState {}



class ChangePassSuccess extends SettingsState {
 String? message;
 ChangePassSuccess({this.message});
}

class ChangePassFail extends SettingsState {
 String? message;
 ChangePassFail({this.message});
}






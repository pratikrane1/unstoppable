
import 'package:meta/meta.dart';
import 'package:unstoppable/Models/vendor_login.dart';

@immutable
abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFail extends LoginState {
  final String? msg;

  LoginFail({this.msg});
}

class LoginSuccess extends LoginState {
  VendorLogin userModel;
  String message;
  LoginSuccess({required this.userModel,required this.message});

}

class VendorRegistrationLoading extends LoginState {}

class VendorRegistrationSuccess extends LoginState {
  String msg;
  VendorRegistrationSuccess({required this.msg});
}

class VendorRegistrationFail extends LoginState {
  String msg;
  VendorRegistrationFail({required this.msg});
}

class LogoutLoading extends LoginState {}

class LogoutFail extends LoginState {
  final String message;

  LogoutFail(this.message);
}

class LogoutSuccess extends LoginState {}

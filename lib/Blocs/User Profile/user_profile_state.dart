import 'package:meta/meta.dart';
import 'package:unstoppable/Models/user_profile_model.dart';
import '../../Models/company_profile_model.dart';

@immutable
abstract class UserProfileState {}


class InitialUserProfileState extends UserProfileState {}


class UserProfileUpdateLoading extends UserProfileState {}



class UserProfileUpdateSuccess extends UserProfileState {
String message;
UserProfileUpdateSuccess({required this.message});
}


class UserProfileUpdatefail extends UserProfileState {
  String message;
  UserProfileUpdatefail({required this.message});
}




class UserProfileLoadFail extends UserProfileState {}
import 'package:meta/meta.dart';
import '../../Models/company_profile_model.dart';
import '../../Models/user_profile_model.dart';

@immutable
abstract class CompanyProfileState {}


class InitialCompanyProfileListState extends CompanyProfileState {}


class CompanyProfileListLoading extends CompanyProfileState {}

class UpdateCompanyProfileLoading extends CompanyProfileState {}


class CompanyProfileSuccess extends CompanyProfileState {
  // List<CompanyProfileModel>? companyProfileData;
  List<CompanyProfileModel>? companyProfileData;
  CompanyProfileSuccess({this.companyProfileData});
}

class UpdateCompanyProfileSuccess extends CompanyProfileState {
  UpdateCompanyProfileSuccess();
}




class CompanyProfileListLoadFail extends CompanyProfileState {}

class UserProfileLoading extends CompanyProfileState {}

// class UpdateCompanyProfileLoading extends UserProfileState {}


class UserProfileSuccess extends CompanyProfileState {
  List<UserProfileModel>? userProfileData;
  UserProfileSuccess({this.userProfileData});
}

// class UpdateCompanyProfileSuccess extends UserProfileState {
//   UpdateCompanyProfileSuccess();
// }




class UserProfileLoadFail extends CompanyProfileState {}
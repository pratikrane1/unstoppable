import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Models/leads_model.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';

import '../../Models/company_profile_model.dart';

@immutable
abstract class CompanyProfileState {}


class InitialCompanyProfileListState extends CompanyProfileState {}


class CompanyProfileListLoading extends CompanyProfileState {}



class CompanyProfileListSuccess extends CompanyProfileState {
  // List<CompanyProfileModel>? companyProfileData;
  List<CompanyProfileModel>? companyProfileData;
  CompanyProfileListSuccess({this.companyProfileData});
}

class CompanyProfileListLoadFail extends CompanyProfileState {}
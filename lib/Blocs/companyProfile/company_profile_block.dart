import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:unstoppable/Blocs/leads/leads_event.dart';
import 'package:unstoppable/Blocs/leads/leads_state.dart';
import 'package:unstoppable/Models/leads_model.dart';
import 'package:unstoppable/Repository/UserRepository.dart';

import '../../Models/company_profile_model.dart';
import 'comapny_profile_state.dart';
import 'company_profile_event.dart';


class CompanyProfileBloc extends Bloc<CompanyProfileEvent, CompanyProfileState> {
  CompanyProfileBloc({this.companyProfileRepo}) : super(InitialCompanyProfileListState());
  final UserRepository? companyProfileRepo;


  @override
  Stream<CompanyProfileState> mapEventToState(event) async* {


    ///Event for Leads
    if (event is OnLoadingCompanyProfileList) {
      ///Notify loading to UI
      yield CompanyProfileListLoading();

      ///Fetch API via repository
      final CompanyProfileRepo response = await companyProfileRepo!
          .fetchCompanyProfile(
        userId: event.userid,
        // userId: "874",
      );

      final Iterable refactorProduct = response.data ?? [];
      final companyProfileData = refactorProduct.map((item) {
        return CompanyProfileModel.fromJson(item);
      }).toList();
      if(refactorProduct.length>0){
        yield CompanyProfileListSuccess(companyProfileData: companyProfileData);

      }else{
        yield CompanyProfileListLoadFail();

      }


    }

  }



}

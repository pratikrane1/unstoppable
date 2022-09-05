import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:unstoppable/Blocs/leads/leads_event.dart';
import 'package:unstoppable/Blocs/leads/leads_state.dart';
import 'package:unstoppable/Models/leads_model.dart';
import 'package:unstoppable/Repository/UserRepository.dart';
import 'package:http/http.dart' as http;
import '../../Api/api.dart';
import '../../Models/company_profile_model.dart';
import '../../Models/user_profile_model.dart';
import 'comapny_profile_state.dart';
import 'company_profile_event.dart';


class CompanyProfileBloc extends Bloc<CompanyProfileEvent, CompanyProfileState> {
  CompanyProfileBloc({this.companyProfileRepo}) : super(InitialCompanyProfileListState());
  final UserRepository? companyProfileRepo;


  @override
  Stream<CompanyProfileState> mapEventToState(event) async* {


    ///Event for Company Profile
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
        yield CompanyProfileSuccess(companyProfileData: companyProfileData);

      }else{
        yield CompanyProfileListLoadFail();

      }


    }


    //For Company Profile Update
    if (event is UpdateCompanyProfile) {
      yield UpdateCompanyProfileLoading();
      Map<String, String> params;
      params = {
        'user_id': event.userid,
        'name':event.name,
        'managing_director':event.managingdirector,
        'ceo':event.ceo,
        'company_name':event.companyname,
        'operator_designation':event.operatordesignation,
        'operator_name':event.operatorname,
        'business_address': event.businessaddress,
        'country':event.country,
        'state':event.state,
        'city':event.city,
        'zip_code':event.zipcode,
        'gstin':event.gstin,
        'website':event.website,
        'mobile_no':event.mobileno,
        'alt_mobile_no':event.altmobile,
        'email':event.email,
        'alt_email':event.altemail,
        'landline_no':event.landline,
        'est_year': event.estyear,
        'business_typ':event.businesstype,
        'ownership_typ':event.ownershiptype,
        'tot_employee':event.totemp,
        'annual_turnover':event.anualturnover,
        'pan_no':event.panno,
        'tan_no':event.tanno,
        'cin_no':event.cinno,
        'dfgt':event.dfgt,
      };

      var response = await http.post(
          Uri.parse(Api.updateCompanyProfile),
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp['result'] == 'Success') {
          yield UpdateCompanyProfileSuccess();
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }



    //User Profile
    if (event is OnLoadingUserProfile) {
      ///Notify loading to UI
      yield UserProfileLoading();

      ///Fetch API via repository
      final UserProfileRepo response = await companyProfileRepo!
          .fetchUserProfile(
        userId: event.userid,
        // userId: "874",
      );

      final Iterable refactorProduct = response.data ?? [];
      final userProfileData = refactorProduct.map((item) {
        return UserProfileModel.fromJson(item);
      }).toList();
      if(refactorProduct.length>0){
        yield UserProfileSuccess(userProfileData: userProfileData);

      }else{
        yield UserProfileLoadFail();

      }


    }


  }





}

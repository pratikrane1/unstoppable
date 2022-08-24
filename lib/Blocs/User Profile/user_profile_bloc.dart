// import 'dart:async';
// import 'dart:convert';
// import 'package:bloc/bloc.dart';
// import 'package:unstoppable/Blocs/User%20Profile/user_profile_event.dart';
// import 'package:unstoppable/Blocs/User%20Profile/user_profile_state.dart';
// import 'package:unstoppable/Models/user_profile_model.dart';
// import 'package:unstoppable/Repository/UserRepository.dart';
// import 'package:http/http.dart' as http;
// import '../../Api/api.dart';
// import '../../Models/company_profile_model.dart';
//
//
//
// class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
//   UserProfileBloc({this.userProfileRepo}) : super(InitialUserProfileState());
//   final UserRepository? userProfileRepo;
//
//
//   @override
//   Stream<UserProfileState> mapEventToState(event) async* {
//
//
//
//     if (event is OnLoadingUserProfile) {
//       ///Notify loading to UI
//       yield UserProfileLoading();
//
//       ///Fetch API via repository
//       final UserProfileRepo response = await userProfileRepo!
//           .fetchUserProfile(
//         userId: event.userid,
//         // userId: "874",
//       );
//
//       final Iterable refactorProduct = response.data ?? [];
//       final userProfileData = refactorProduct.map((item) {
//         return UserProfileModel.fromJson(item);
//       }).toList();
//       if(refactorProduct.length>0){
//         yield UserProfileSuccess(userProfileData: userProfileData);
//
//       }else{
//         yield UserProfileLoadFail();
//
//       }
//
//
//     }
//
//
//     //For Company Profile Update
//     // if (event is UpdateCompanyProfile) {
//     //   yield UpdateCompanyProfileLoading();
//     //   Map<String, String> params;
//     //   params = {
//     //     'user_id': event.userid,
//     //     'name':event.name,
//     //     'managing_director':event.managingdirector,
//     //     'ceo':event.ceo,
//     //     'company_name':event.companyname,
//     //     'operator_designation':event.operatordesignation,
//     //     'operator_name':event.operatorname,
//     //     'business_address': event.businessaddress,
//     //     'country':event.country,
//     //     'state':event.state,
//     //     'city':event.city,
//     //     'zip_code':event.zipcode,
//     //     'gstin':event.gstin,
//     //     'website':event.website,
//     //     'mobile_no':event.mobileno,
//     //     'alt_mobile_no':event.altmobile,
//     //     'email':event.email,
//     //     'alt_email':event.altemail,
//     //     'landline_no':event.landline,
//     //     'est_year': event.estyear,
//     //     'business_typ':event.businesstype,
//     //     'ownership_typ':event.ownershiptype,
//     //     'tot_employee':event.totemp,
//     //     'annual_turnover':event.anualturnover,
//     //     'pan_no':event.panno,
//     //     'tan_no':event.tanno,
//     //     'cin_no':event.cinno,
//     //     'dfgt':event.dfgt,
//     //   };
//     //
//     //   var response = await http.post(
//     //       Uri.parse(Api.updateCompanyProfile),
//     //       body: params
//     //   );
//     //
//     //   try {
//     //     final resp = json.decode(response.body);
//     //     if (resp['result'] == 'Success') {
//     //       yield UpdateCompanyProfileSuccess();
//     //     }
//     //   } catch (e) {
//     //     print(e);
//     //     rethrow;
//     //   }
//     // }
//
//   }
//
//
//
// }

import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:unstoppable/Blocs/User%20Profile/user_profile_event.dart';
import 'package:unstoppable/Blocs/User%20Profile/user_profile_state.dart';
import 'package:unstoppable/Models/user_profile_model.dart';
import 'package:unstoppable/Repository/UserRepository.dart';
import 'package:http/http.dart' as http;
import '../../Api/api.dart';
import '../../Models/company_profile_model.dart';



class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc({this.userProfileRepo}) : super(InitialUserProfileState());
  final UserRepository? userProfileRepo;


  @override
  Stream<UserProfileState> mapEventToState(event) async* {



    // if (event is OnLoadingUserProfile) {
    //   ///Notify loading to UI
    //   yield UserProfileLoading();
    //
    //   ///Fetch API via repository
    //   final UserProfileRepo response = await userProfileRepo!
    //       .fetchUserProfile(
    //     userId: event.userid,
    //     // userId: "874",
    //   );
    //
    //   final Iterable refactorProduct = response.data ?? [];
    //   final userProfileData = refactorProduct.map((item) {
    //     return UserProfileModel.fromJson(item);
    //   }).toList();
    //   if(refactorProduct.length>0){
    //     yield UserProfileSuccess(userProfileData: userProfileData);
    //
    //   }else{
    //     yield UserProfileLoadFail();
    //
    //   }
    //
    //
    // }

    // if (event is UserProfileUpdate) {
    //   yield UserProfileUpdateLoading();
    //
    //
    //   MultipartRequest request = new MultipartRequest(
    //       'POST', Uri.parse(Api.USER_PROFILE_UPDATE));
    //   request.fields['vendor_user_id'] = event.userid;
    //   request.fields['full_name '] = event.name;
    //   request.fields['bussiness_name'] = event.businessName;
    //   request.fields['cat_id '] = event.catId;
    //   request.fields['subcat_id '] = event.subCatId;
    //   request.fields['subsub_cat_id '] = event.subSubCatId;
    //   request.fields['ownership_typ'] = event.ownershipType;
    //   request.fields['est_year'] = event.estYear;
    //   request.fields['tot_employee'] = event.totEmp;
    //   request.fields['annual_turnover'] = event.annualTurnover;
    //   request.fields['gst_no'] = event.gstNo;
    //   request.fields['address'] = event.address;
    //   request.fields['pin_code'] = event.pinCode;
    //   request.fields['mobile_no'] = event.mobileNo;
    //
    //   List<MultipartFile> imageUpload = <MultipartFile>[];
    //
    //   // final multipartFile = await http.MultipartFile.fromPath(
    //   //   'com_logo', event.comLogo!.imagePath.toString(),
    //   //   // contentType: MediaType(mimeTypeData[0], mimeTypeData[1])
    //   // );
    //
    //   if(event.imgFlag=="0"){//0 cropped file,1=existing image
    //     final multipartFile = await http.MultipartFile.fromPath(
    //       'com_logo', event.comLogo!.imagePath.toString(),
    //       // contentType: MediaType(mimeTypeData[0], mimeTypeData[1])
    //     );
    //     imageUpload.add(multipartFile);
    //     request.files.addAll(imageUpload);
    //
    //   }else{
    //     request.fields['com_logo'] = "";
    //
    //   }
    //
    //   final streamedResponse = await request.send();
    //   final response = await http.Response.fromStream(streamedResponse);
    //   var resp = json.decode(response.body);
    //   try {
    //     if (resp[0]['result'] == 'S') {
    //       yield UserProfileUpdateSuccess( message: resp[0]['msg']);
    //     }else{
    //       yield UserProfileUpdatefail(message: resp[0]['msg']);
    //
    //     }
    //   } catch (e) {
    //     yield UserProfileUpdatefail(message: resp[0]['msg']);
    //     rethrow;
    //   }
    // }


    if (event is UserProfileUpdate) {
      yield UserProfileUpdateLoading();

      Map<String, String> params;
      params = {
        'vendor_user_id': event.userid,
        'full_name ': event.name,
        'bussiness_name':event.businessName,
        'cat_id ':event.catId,
        'subcat_id ': event.subCatId,
        'subsub_cat_id ': event.subSubCatId,
        'ownership_typ': event.ownershipType,
        'est_year': event.estYear,
        'tot_employee': event.totEmp,
        'annual_turnover':event.annualTurnover,
        'gst_no': event.gstNo,
        'address': event.address,
        'pin_code': event.pinCode,
        'mobile_no': event.mobileNo,
        // 'com_logo': event.comLogo,
      };

      var response = await http.post(
          Uri.parse("https://unstoppabletrade.in/App_details/update_vendor_profile"),
          body: params
      );

      try {
        String respBody = response.body;
        final resp = json.decode(respBody);
        if (resp[0]['result'] == 'S') {
          yield UserProfileUpdateSuccess(message: resp[0]['msg']);
          print(resp[0]['msg']);
        }
        else{
          UserProfileUpdatefail(message: resp[0]['msg']);
        }
      } catch (e) {
        print(e);
        rethrow;
      }

    }


  }



}

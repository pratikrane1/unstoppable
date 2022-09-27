import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Blocs/authentication/authentication_event.dart';
import 'package:unstoppable/Blocs/login/login_event.dart';
import 'package:unstoppable/Blocs/login/login_state.dart';
import 'package:unstoppable/Models/vendor_login.dart';
import 'package:unstoppable/Repository/UserRepository.dart';
import 'package:unstoppable/app_bloc.dart';

import '../../Utils/application.dart';

//for multipart
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mime/mime.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({this.userRepository}) : super(InitialLoginState());
  final UserRepository? userRepository;


  @override
  Stream<LoginState> mapEventToState(event) async* {



    ///Event for login
    if (event is OnLogin) {
      ///Notify loading to UI
      yield LoginLoading();

      ///Fetch API via repository
      final VendorLoginResp result = await userRepository!.login(
        email: event.email,
          password: event.password,
      );
      print(result);
      ///Case API fail but not have token
      if (result.result=="Success") {
        ///Login API success
       // final  VendorLogin user = VendorLogin.fromJson(result.data);
       VendorLogin user = new VendorLogin();
       user.result=result.data!.result.toString();
       user=result.data!;
        try {
          ///Begin start AuthBloc Event AuthenticationSave
          AppBloc.authBloc.add(OnSaveUser(user));
          yield LoginSuccess(userModel: user, message: result.message.toString());
        } catch (error) {
          ///Notify loading to UI
          yield LoginFail(msg: result.message.toString());
        }
      } else {
        ///Notify loading to UI
        yield LoginFail(msg:result.message.toString());
      }
    }


    ///Event for logout
    if (event is OnLogout) {
      yield LogoutLoading();


            final deletePreferences = await userRepository!.deleteUser();

            ///Clear user Storage user via repository
            Application.preferences = null;
            // Application.cartModel = null;

            /////updated on 10/02/2021
            if (deletePreferences) {
              yield LogoutSuccess();
            } else {
              final String message = "Cannot delete user data to storage phone";
              throw Exception(message);
            }
          }
          else{
            ///Notify loading to UI
            yield LogoutFail("error");
          }



    if (event is OnRegistration) {
      yield VendorRegistrationLoading();


      MultipartRequest request = new MultipartRequest(
          'POST', Uri.parse(Api.VENDOR_Registration));
      request.fields['user_type'] = event.userType;
      request.fields['full_name'] = event.fullName;
      request.fields['cat_id'] = event.catId;
      request.fields['subcat_id'] = event.subId;
      request.fields['subsubcat_id'] = event.subSubId;
      request.fields['bussiness_name'] = event.businessName;
      request.fields['ownership_type'] = event.ownershipType;
      request.fields['est_year'] = event.estYear;
      request.fields['tot_employee'] = event.totalEmp;
      request.fields['annual_turnover'] = event.annualTurnover;
      request.fields['gst_no'] = event.gSTIN;
      request.fields['address'] = event.address;
      request.fields['pin_code'] = event.pinCode;
      request.fields['mobile_no'] = event.mobile;
      request.fields['email'] = event.email;
      request.fields['refer_by'] = event.referby;

      List<MultipartFile> imageUpload = <MultipartFile>[];

      final multipartFile = await http.MultipartFile.fromPath(
        'com_logo', event.comLogo!.imagePath.toString(),
        // contentType: MediaType(mimeTypeData[0], mimeTypeData[1])
      );

      imageUpload.add(multipartFile);
      request.files.addAll(imageUpload);
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      var resp = json.decode(response.body);
      try {
        if (resp['result'] == 'Success') {
          yield VendorRegistrationSuccess(msg: resp['Message']);
        }else{
          yield VendorRegistrationFail(msg: resp['Message']);

        }
      } catch (e) {
        yield VendorRegistrationFail(msg: resp['Message']);
        rethrow;
      }
    }

  }

          // yield LogoutSuccess();
        }





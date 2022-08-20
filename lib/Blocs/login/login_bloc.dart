import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Blocs/authentication/authentication_event.dart';
import 'package:unstoppable/Blocs/login/login_event.dart';
import 'package:unstoppable/Blocs/login/login_state.dart';
import 'package:unstoppable/Models/vendor_login.dart';
import 'package:unstoppable/Repository/UserRepository.dart';
import 'package:unstoppable/app_bloc.dart';

import '../../Utils/application.dart';


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
          yield LoginSuccess(userModel: user);
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
      yield VendorRegistration();
      Map<String, String> params;
      params = {
        'user_type': event.userType,
        'full_name':event.fullName,
        'cat_id':event.catId,
        'subcat_id':event.subId,
        'subsubcat_id':event.subSubId,
        'bussiness_name':event.businessName,
        'ownership_type':event.ownershipType,
        'est_year': event.estYear,
        'tot_employee':event.totalEmp,
        'annual_turnover':event.annualTurnover,
        'gst_no':event.gSTIN,
        'address':event.address,
        'pin_code':event.pinCode,
        'mobile_no':event.mobile,
        'email':event.email,
        'refer_by':event.referby,
        'com_logo ':event.comLogo,
      };

      var response = await http.post(
          Uri.parse(Api.VENDOR_Registration),
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp['result'] == 'Success') {
          yield VendorRegistrationSuccess();
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }

  }

          // yield LogoutSuccess();
        }





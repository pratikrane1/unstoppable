import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
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
          }

          // yield LogoutSuccess();
        }





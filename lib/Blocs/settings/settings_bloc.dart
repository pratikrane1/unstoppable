import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Blocs/authentication/authentication_event.dart';
import 'package:unstoppable/Blocs/login/login_event.dart';
import 'package:unstoppable/Blocs/login/login_state.dart';
import 'package:unstoppable/Models/home_model.dart';
import 'package:unstoppable/Models/product_model.dart';
import 'package:unstoppable/Models/vendor_login.dart';
import 'package:unstoppable/Repository/UserRepository.dart';
import 'package:unstoppable/app_bloc.dart';

import '../../Models/product_detail_model.dart';
import '../../Utils/application.dart';
import 'settings_event.dart';
import 'settings_state.dart';

//for multipart
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mime/mime.dart';


class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({this.settingsRepo}) : super(InitialSettingsState());
  final UserRepository? settingsRepo;


  @override
  Stream<SettingsState> mapEventToState(event) async* {
    if (event is OnChangePassword) {
      ///Notify loading to UI
      yield ChangePassLoading();

      Map<String,dynamic> params={
        'user_id':Application.vendorLogin!.userId.toString(),
        'old_pass':event.currentPwd,
        'new_pass':event.newPwd
      };

      var response=await http.post(Uri.parse(Api.CHANGE_PASS),body: params);
      try {
        var resp = json.decode(response.body);
        if(resp['result']=='Success'){
          yield ChangePassSuccess(message: resp['msg']);
        }else{
          yield ChangePassFail(message: resp['msg']);
        }
      }catch(e){
        print(e);
      }


    }




  }
}




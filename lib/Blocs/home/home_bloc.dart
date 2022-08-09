import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import 'package:unstoppable/Blocs/authentication/authentication_event.dart';
import 'package:unstoppable/Blocs/login/login_event.dart';
import 'package:unstoppable/Blocs/login/login_state.dart';
import 'package:unstoppable/Models/home_model.dart';
import 'package:unstoppable/Models/vendor_login.dart';
import 'package:unstoppable/Repository/UserRepository.dart';
import 'package:unstoppable/app_bloc.dart';

import '../../Utils/application.dart';
import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({this.dashboardRepo}) : super(InitialHomeListState());
  final UserRepository? dashboardRepo;


  @override
  Stream<HomeState> mapEventToState(event) async* {


    ///Event for login
    if (event is OnLoadingHomeList) {
      ///Notify loading to UI
      yield HomeLoading();

      ///Fetch API via repository
      final DashBoardCountResp response = await dashboardRepo!
          .fetchDashboardCount(
          userId: event.userid
      );

      ///Case API fail but not have token

      String totalProduct = response.totalProduct.toString();

      yield HomeListSuccess(totalProd: totalProduct);
    }
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Blocs/businessOpportunity/bloc.dart';
import 'package:unstoppable/Models/businessNetworking_model.dart';
import 'package:unstoppable/Models/product_model.dart';
import 'package:unstoppable/Repository/UserRepository.dart';

import '../../Models/product_detail_model.dart';




class BusinessOpprtunityBloc extends Bloc<BusinessOpportunityEvent, BusinessOpportunityState> {
  BusinessOpprtunityBloc({this.businessOpportunityRepo})
      : super(InitialBusinessOpprortunityState());
  final UserRepository? businessOpportunityRepo;


  @override
  Stream<BusinessOpportunityState> mapEventToState(event) async* {
    if (event is OnLoadingBusinesNetworkingList) {
      ///Notify loading to UI
      yield BusinessNetworkingLoading();

      ///Fetch API via repository
      final BusinessNetworkingRepo response = await businessOpportunityRepo!
          .fetchBusinessNetworking(
          userId: event.userid,
          offset:
          event.offset.toString()
      );

      // final Iterable refactorbusiness = response.data.requirements ?? [];
      // final listBusinessNetworking = refactorbusiness.map((item) {
      //   return Requirements.fromJson(item);
      // }).toList();
      List<Requirements>? data=response.data!.requirements;
      if (data!.length>0) {
        yield BusinessNetworkingListSuccess(
            businessNetworkingList: data);
      } else {
        yield BusinessNetworkingListLoadFail();
      }
    }
  }
}





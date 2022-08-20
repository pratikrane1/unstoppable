import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Blocs/businessOpportunity/bloc.dart';
import 'package:unstoppable/Models/businessNetworking_model.dart';
import 'package:unstoppable/Models/get_BNC_model.dart';
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
      List<Requirements>? data = response.data!.requirements;
      if (data!.length > 0) {
        yield BusinessNetworkingListSuccess(
            businessNetworkingList: data);
      } else {
        yield BusinessNetworkingListLoadFail();
      }
    }


    if (event is OnLoadingBNC) {
      ///Notify loading to UI
      yield BusinessNetworkingLoading();

      ///Fetch API via repository
      final GetBNCRepo response = await businessOpportunityRepo!
          .getBNCLead(
        userId: event.userid,
        rowId:
        event.rowid,
      );

      // final Iterable refactorbusiness = response.data.requirements ?? [];
      // final listBusinessNetworking = refactorbusiness.map((item) {
      //   return Requirements.fromJson(item);
      // }).toList();
      final Iterable refactorBNCLead = response.data ?? [];
      final listBNCLead = refactorBNCLead.map((item) {
        return GetBNCmodel.fromJson(item);
      }).toList();
      if (refactorBNCLead.length > 0) {
        yield GetBNCLoadSuccess(getBNCLeadList: listBNCLead);
      } else {
        yield GetBNCLoadFail();
      }
    }


    // For bnc Update
    if (event is UpdateBNC) {
      yield GetBNCLoading();
      Map<String, String> params;
      params = {
        'id':event.id,
        'user_id': event.userid,
        'row_id':event.rowid,
        'cat_id':event.catid,
        'sub_cat_id':event.subcatid,
        'sscatid':event.sscatid,
        'product_id':event.productid,
        'type':event.type,


      };

      var response = await http.post(
          Uri.parse(Api.updateBNC),
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp['result'] == 'Success') {
          yield UpdateBNCSuccess();
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }
  }
}

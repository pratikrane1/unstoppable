import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:unstoppable/Blocs/leads/leads_event.dart';
import 'package:unstoppable/Blocs/leads/leads_state.dart';
import 'package:unstoppable/Models/leads_model.dart';
import 'package:unstoppable/Repository/UserRepository.dart';
import 'package:http/http.dart' as http;

import '../../Api/api.dart';


class LeadsBloc extends Bloc<LeadsEvent, LeadsState> {
  LeadsBloc({this.leadsRepo}) : super(InitialLeadsListState());
  final UserRepository? leadsRepo;


  @override
  Stream<LeadsState> mapEventToState(event) async* {


    ///Event for Leads
    if (event is OnLoadingLeadsList) {
      ///Notify loading to UI
      yield LeadsListLoading();

      ///Fetch API via repository
      final LeadsRepo response = await leadsRepo!
          .fetchLeads(
          userId: event.userid,
      );

      final Iterable refactorProduct = response.data ?? [];
      final listLeads = refactorProduct.map((item) {
        return LeadModel.fromJson(item);
      }).toList();
      if(refactorProduct.length>0){
        yield LeadsListSuccess(leadList: listLeads);

      }else{
        yield LeadsListLoadFail();

      }


    }

    // For Lead Update
    if (event is UpdateLead) {
      yield UpdateLeadLoading();

      Map<String, String> params;
      params = {
        'vendor_id': event.userid,
        'lead_history_id': event.leadId,
        'status': event.status,
      };

      var response = await http.post(
          Uri.parse(Api.UPDATE_LEAD_STATUS),
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp["result"] == "S") {
          yield UpdateLeadSuccess(message: resp['msg']);
        }
        else{
          UpdateLeadFail(message: resp['msg']);
        }
      } catch (e) {
        print(e);
        rethrow;
      }

    }

  }



}

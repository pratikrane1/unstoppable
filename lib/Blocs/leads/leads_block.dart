import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:unstoppable/Blocs/leads/leads_event.dart';
import 'package:unstoppable/Blocs/leads/leads_state.dart';
import 'package:unstoppable/Models/leads_model.dart';
import 'package:unstoppable/Repository/UserRepository.dart';


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

  }



}

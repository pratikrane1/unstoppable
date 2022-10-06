import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:unstoppable/Repository/UserRepository.dart';
import 'package:http/http.dart' as http;
import '../../Api/api.dart';
import '../../Models/manageAllBuyingRequirements_model.dart';
import 'manageAllBuyingRequirement_state.dart';
import 'manageAllBuyingRequirements_event.dart';


class ManageAllBuyingRequirementBloc extends Bloc<ManageAllBuyingRequirementEvent, ManageAllBuyingRequirementState> {
  ManageAllBuyingRequirementBloc({this.manageAllBuyingRequirementRepo}) : super(InitialManageAllBuyingRequirementListState());
  final UserRepository? manageAllBuyingRequirementRepo;


  @override
  Stream<ManageAllBuyingRequirementState> mapEventToState(event) async* {


    ///Event for Leads
    if (event is OnLoadingManageAllBuyingRequirementList) {
      ///Notify loading to UI
      yield ManageAllBuyingRequirementListLoading();

      ///Fetch API via repository
      final ManageAllBuyingRequirementRepo response = await manageAllBuyingRequirementRepo!
          .fetchManageAllBuying(
          userId: event.userid,
      );

      final Iterable refactorProduct = response.data ?? [];
      final manageAllBuyingLeads = refactorProduct.map((item) {
        return ManageAllBuyingRequirementModel.fromJson(item);
      }).toList();
      if(refactorProduct.length>0){
        yield ManageAllBuyingRequirementListSuccess(manageAllBuyingList: manageAllBuyingLeads);

      }else{
        yield ManageAllBuyingRequirementListLoadFail();

      }


    }

    if (event is SaveBuyingRequirementForm) {
      yield SaveBuyingRequiementForm();
      Map<String, String> params;
      params = {
        'user_id': event.userid,
        'cat_id':event.categoryId,
        'sub_cat_id':event.subCateId,
        'product_name':event.prodName,
        'type':event.type,
        'other':event.other,
        'use':event.use,
        'other1': event.other1,
        'approx':event.approx,
        'unit_type':event.unitType,
        'qty':event.quantity,
        'supplier_from':event.suppFrom,
        'supplier_will':event.suppWill,
        'description':event.descrip,
      };

      var response = await http.post(
          Uri.parse(Api.BuyingRequirementForm),
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp['result'] == 'Success') {
          yield SaveBuyingRequiementFormSuccess(message: resp['msg']);
        }
        else{
          yield SaveBuyingRequiementFormFailed(message: resp['msg']);
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }

    if (event is DeleteAllBuyingRequirement) {
      yield DeleteAllBuyingRequirementLoading();
      Map<String, String> params;
      params = {
        'id': event.id
      };

      var response = await http.post(
          Uri.parse(Api.delAllBuyingRequirement),
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp['result'] == 'Success') {
          yield DeleteAllBuyingRequirementSuccess();
        }else{
          DeleteAllBuyingRequirementFail();
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }

  }



}

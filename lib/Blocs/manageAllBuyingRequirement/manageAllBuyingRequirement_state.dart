import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Models/leads_model.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';

import '../../Models/manageAllBuyingRequirements_model.dart';

@immutable
abstract class ManageAllBuyingRequirementState {}


class InitialManageAllBuyingRequirementListState extends ManageAllBuyingRequirementState {}

class DeleteAllBuyingRequirementLoading extends ManageAllBuyingRequirementState {}


class ManageAllBuyingRequirementListLoading extends ManageAllBuyingRequirementState {}



class ManageAllBuyingRequirementListSuccess extends ManageAllBuyingRequirementState {
  List<ManageAllBuyingRequirementModel>? manageAllBuyingList;
  ManageAllBuyingRequirementListSuccess({this.manageAllBuyingList});
}


class SaveBuyingRequiementForm extends ManageAllBuyingRequirementState {}


class SaveBuyingRequiementFormSuccess extends ManageAllBuyingRequirementState {
  String message;
  SaveBuyingRequiementFormSuccess({required this.message});
}

class SaveBuyingRequiementFormFailed extends ManageAllBuyingRequirementState {
  String message;
  SaveBuyingRequiementFormFailed({required this.message});
}



class DeleteAllBuyingRequirementSuccess extends ManageAllBuyingRequirementState {
  DeleteAllBuyingRequirementSuccess();
}

class DeleteAllBuyingRequirementFail extends ManageAllBuyingRequirementState {
  DeleteAllBuyingRequirementFail();
}

class ManageAllBuyingRequirementListLoadFail extends ManageAllBuyingRequirementState {}



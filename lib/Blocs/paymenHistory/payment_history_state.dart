import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Models/leads_model.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';

import '../../Models/manageAllBuyingRequirements_model.dart';
import '../../Models/payment_history_model.dart';

@immutable
abstract class PaymentHistoryState {}


class InitialPaymentHistoryListState extends PaymentHistoryState {}


class PaymentHistoryListLoading extends PaymentHistoryState {}



class PaymentHistoryListSuccess extends PaymentHistoryState {
  List<PaymentHistoryModel>? paymentHistoryData;
  PaymentHistoryListSuccess({this.paymentHistoryData});
}

class PaymentHistoryListLoadFail extends PaymentHistoryState {}




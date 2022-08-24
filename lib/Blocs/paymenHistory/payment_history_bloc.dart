

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unstoppable/Blocs/paymenHistory/payment_history_event.dart';
import 'package:unstoppable/Blocs/paymenHistory/payment_history_state.dart';
import 'package:unstoppable/Models/payment_history_model.dart';

import '../../Repository/UserRepository.dart';

class PaymentHistoryBloc extends Bloc<PaymentHistoryEvent, PaymentHistoryState> {
  PaymentHistoryBloc({this.paymentHistoryRepo}) : super(InitialPaymentHistoryListState());
  final UserRepository? paymentHistoryRepo;


  @override
  Stream<PaymentHistoryState> mapEventToState(event) async* {


    ///Event for Leads
    if (event is OnLoadingPaymentHistoryList) {
      ///Notify loading to UI
      yield PaymentHistoryListLoading();

      ///Fetch API via repository
      final PaymentHistoryRepo response = await paymentHistoryRepo!
          .fetchPaymentHistory(
        userId: event.userid,
      );

      final Iterable refactorProduct = response.data ?? [];
      final paymentHistory = refactorProduct.map((item) {
        return PaymentHistoryModel.fromJson(item);
      }).toList();
      if(refactorProduct.length>0){
        yield PaymentHistoryListSuccess(paymentHistoryData: paymentHistory);

      }else{
        yield PaymentHistoryListLoadFail();

      }


    }

  }



}

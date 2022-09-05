import 'package:meta/meta.dart';

@immutable
abstract class PaymentHistoryEvent {}


class OnLoadingPaymentHistoryList extends PaymentHistoryEvent {
  String userid;
  OnLoadingPaymentHistoryList({required this.userid});
}

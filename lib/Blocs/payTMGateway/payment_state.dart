import 'package:meta/meta.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/product_model.dart';

@immutable
abstract class PaymentState {}


class InitialPaymentState extends PaymentState {}


class TokenLoading extends PaymentState {}



class TokenSuccess extends PaymentState {
  double? amount;
  String? orderId;
  String? txtToken;
  TokenSuccess({this.amount, this.txtToken, this.orderId});
}

class TokenFail extends PaymentState{
  TokenFail();
}

// class TokenSuccess extends PaymentState {
//
//   TokenSuccess();
// }

class ProductListLoadFail extends PaymentState {}

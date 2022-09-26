import 'package:meta/meta.dart';
import 'package:unstoppable/Screens/image_file.dart';

@immutable
abstract class PaymentEvent {}


class OnLoadingPayment extends PaymentEvent {
  String mId;
  String mKey;
  String website;
  String amount;
  String orderId;
  final callBackUrl;
  OnLoadingPayment({required this.callBackUrl,required this.orderId,required this.amount,required this.mId, required this.mKey, required this.website});
}



class OnLoadingProductDetail extends PaymentEvent {
  String prodId;
  OnLoadingProductDetail({required this.prodId});
}
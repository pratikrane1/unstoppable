// import 'dart:async';
// import 'dart:convert';
//
// import 'package:bloc/bloc.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:unstoppable/Blocs/payTMGateway/payment_event.dart';
// import 'package:unstoppable/Blocs/payTMGateway/payment_state.dart';
// import 'package:unstoppable/Blocs/payTMGateway/paytm_constant.dart';
//
// import '../../Repository/UserRepository.dart';
//
//
// class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
//   PaymentBloc({this.paymentRepo}) : super(InitialPaymentState());
//   final UserRepository? paymentRepo;
//
//
//   @override
//   Stream<PaymentState> mapEventToState(event) async* {
//     if (event is OnLoadingPayment) {
//       ///Notify loading to UI
//       yield TokenLoading();
//
//
//       // final String _url =
//       //     'https://flutter-paytm-backend.herokuapp.com/generateTxnToken'; //
//       // // Future<void> generateTxnToken(double amount, String orderId) async {
//       //   final callBackUrl =
//       //       'https://securegw.paytm.in/theia/paytmCallback?ORDER_ID=$orderId';
//       //   final body = PaytmConfig().getMap(amount, callBackUrl, orderId);
//
//         Map<String, String> params;
//         params= {
//           "mid": event.mId,
//           "key_secret": event.mKey,
//           "website": event.website,
//           "orderId": event.orderId,
//           "amount": event.amount.toString(),
//           "callbackUrl": event.callBackUrl,
//           "custId": "122",
//         };
//
//         try {
//           final response = await http.post(
//             Uri.parse("https://securegw-stage.paytm.in/theia/api/v1/initiateTransaction?mid={mid}&orderId={order-id}"),
//             body: params,
//             headers: {'Content-type': "application/json"},
//           );
//           String txnToken = response.body;
//           // await initiateTransaction(orderId, amount, txnToken, callBackUrl);
//            yield TokenSuccess(txtToken: txnToken, orderId: event.orderId);
//         } catch (e) {
//           print(e);
//         }
//       // }
//
//
//       // ///Fetch API via repository
//       // final ProductRepo response = await productRepo!
//       //     .fetchProduct(
//       //     userId: event.userid,
//       //     offset:
//       //     event.offset.toString()
//       // );
//       //
//       // final Iterable refactorProduct = response.data ?? [];
//       // final listproduct = refactorProduct.map((item) {
//       //   return ProductModel.fromJson(item);
//       // }).toList();
//       // if (refactorProduct.length > 0) {
//       //   yield ProductListSuccess(productList: listproduct);
//       // } else {
//       //   yield ProductListLoadFail();
//       // }
//     }
//
//
//
//
//
//   }
// }
//


import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';

class PaytmConfig {
  final String _mid = "ctqcfC52960494856707";
  final String _mKey = "IE3XtJ4BGHcSo167";
  final String _website = "WEBSTAGING";
  // final String _url =
  //     'https://securegw-stage.paytm.in/theia/api/v1/initiateTransaction?mid={mid}&orderId={order-id}';

  String get mid => _mid;
  String get mKey => _mKey;
  String get website => _website;
  // String get url => _url;

  String getMap(double amount, String callbackUrl, String orderId) {
    return json.encode({
      "mid": mid,
      "key_secret": mKey,
      "website": website,
      "orderId": orderId,
      "amount": amount.toString(),
      "callbackUrl": callbackUrl,
      "custId": "122",
    });
  }

  Future<void> generateTxnToken(double amount, String orderId) async {
    final callBackUrl =
        'https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=$orderId';
    final body = getMap(amount, callBackUrl, orderId);
    final String url =
        'https://securegw-stage.paytm.in/theia/api/v1/initiateTransaction?mid=$mid&orderId=$orderId';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {'Content-type': "application/json"},
      );
      String txnToken = response.body;

      await initiateTransaction(orderId, amount, txnToken, callBackUrl);
    } catch (e) {
      print(e);
    }
  }

  Future<void> initiateTransaction(String orderId, double amount,
      String txnToken, String callBackUrl) async {
    String result = '';
    try {
      var response = AllInOneSdk.startTransaction(
        mid,
        orderId,
        amount.toString(),
        txnToken,
        callBackUrl,
        true,
        true,
      );
      response.then((value) {
        // Transaction successfull
        print(value);
      }).catchError((onError) {
        if (onError is PlatformException) {
          result = onError.message! + " \n  " + onError.details.toString();
          print(result);
        } else {
          result = onError.toString();
          print(result);
        }
      });
    } catch (err) {
      // Transaction failed
      result = err.toString();
      print(result);
    }
  }
}
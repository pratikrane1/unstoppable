// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// // import 'package:flutter_app/Models/model_payment_instruction.dart';
// // import 'package:flutter_app/Screens/Recharge/thankyouScreen.dart';
// // import 'package:flutter_app/Screens/mainNavigation.dart';
// // import 'package:flutter_app/Utils/connectivity.dart';
// // import 'package:flutter_app/Utils/utilOther.dart';
// // import 'package:flutter_app/Widgets/app_button.dart';
// // import 'package:flutter_app/Widgets/app_dialogs.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
// import 'package:unstoppable/Blocs/payTMGateway/payment_bloc.dart';
//
// import '../../Blocs/payTMGateway/payment_event.dart';
// import '../../Blocs/payTMGateway/payment_state.dart';
// import '../../Utils/connectivity_check.dart';
// import '../../Utils/other.dart';
// import '../../widgets/app_button.dart';
// import '../../widgets/app_dialogs.dart';
//
// class PaymentInstructionScreen extends StatefulWidget {
//   String? amount;
//   // String? customerId;
//
//   PaymentInstructionScreen(
//       {Key? key,
//
//       @required this.amount,
//       // @required this.customerId,
//       })
//       : super(key: key);
//
//   _PaymentInstructionState createState() => _PaymentInstructionState();
// }
//
// class _PaymentInstructionState extends State<PaymentInstructionScreen> {
//   PaymentBloc? _paymentBloc;
//   // List<PaymentData>? paymentDataList;
//   bool isloading = false;
//   var response, result;
//   bool flagPayLoading = false;
//   ScrollController _scrollController = ScrollController();
//   var scaffoldKey = new GlobalKey<ScaffoldState>();
//
//   //username=9809555999 pwd=sanjay2020
//   //testMid=irDmRy37812914905791
//   //liveMid=XrMOOC13329630142541
//   String? mid = "irDmRy37812914905791", txnToken;
//   bool isStaging = false; //for production mode
//   String? callbackUrl;
//   bool restrictAppInvoke =
//       true; //used to have fullacces to paytm,with UPI,netBanking,creditCard,it redirects to all part
//   var res;
//   String? orderId;
//   bool isconnectedToInternet = false;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _paymentBloc = BlocProvider.of<PaymentBloc>(context);
//     setBlocData();
//     _startTransaction(widget.amount!, txnToken!, orderId!, isStaging,
//         restrictAppInvoke);
//   }
//
//   void setBlocData() async {
//     isconnectedToInternet = await ConnectivityCheck.checkInternetConnectivity();
//     if (isconnectedToInternet == true) {
//       // _rechargeBloc.add(GetPaymentInst());
//     } else {
//       CustomDialogs.showDialogCustom(
//           "Internet", "Please check your Internet Connection!", context);
//     }
//   }
//
//
//
//   Future<void> _startTransaction(String amount, String txnToken, String orderId,
//       bool isStaging, bool restrictAppInvoke) async {
//     UtilOther.hiddenKeyboard(context);
//     if (txnToken.isEmpty) {
//       return;
//     }
//     try {
//       var response = AllInOneSdk.startTransaction(mid!, orderId, amount,
//           txnToken, callbackUrl!, isStaging, restrictAppInvoke);
//       response.then((value) {
//         // setState(() {
//         // if(validity!=""){
//         //   Fluttertoast.showToast(msg: "Recharge is successfully done");
//         // }else{
//         //   Fluttertoast.showToast(msg: "Recharge failed,not a valid plan");
//         // }
//         //   Fluttertoast.showToast(msg: "Please wait while recharge is succesfully done,you will get message of it");
//         // _showMessage("Payment done succesfully",'success');
//         // Future.delayed(Duration(seconds: 2), () {
//         //   Navigator.pop(context);
//         //
//         // });
//         // scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Payment done successfully"),
//         //   backgroundColor: Colors.green,));
//
//         result = value;
//         // _rechargeBloc.add(PaymentDone(
//         //     mid: mid,
//         //     currency: value['CURRENCY'],
//         //     gatewayName: value['GATEWAYNAME'],
//         //     respMsg: value['RESPMSG'],
//         //     bankName: value['BANKNAME'],
//         //     paymentMode: value['PAYMENTMODE'],
//         //     respCode: value['RESPCODE'],
//         //     TxnAmt: value['TXNAMOUNT'],
//         //     txnId: value['TXNID'],
//         //     orderId: value['ORDERID'],
//         //     status: value['STATUS'],
//         //     bankTxnId: value['BANKTXNID'],
//         //     txnDate: value['TXNDATE'],
//         //     checksum: value['CHECKSUMHASH']));
//         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ThankYouScreen(mid:mid,
//         //     currency:value['CURRENCY'],
//         //     gatewayName:value['GATEWAYNAME'],
//         //     respMsg:value['RESPMSG'],
//         //     bankname:value['BANKNAME'],
//         //     paymentMode:value['PAYMENTMODE'],
//         //     respCode:value['RESPCODE'],
//         //     txnAmt:value['TXNAMOUNT'],
//         //     txnId:value['TXNID'],
//         //     orderId:value['ORDERID'],
//         //     status:value['STATUS'],
//         //     bankTxnId:value['BANKTXNID'],
//         //     txnDate:value['TXNDATE'],
//         //     checksum:value['CHECKSUMHASH']
//         // )));
//
//         print(result.toString());
//       }).catchError((onError) {
//         if (onError is PlatformException) {
//           setState(() {
//             result = onError.message! + " \n  " + onError.details.toString();
//             // Fluttertoast.showToast(msg: result);
//             // scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(onError.message),backgroundColor: Colors.red,));
//             _showMessage("Payment failed", 'fail');
//             Future.delayed(Duration(seconds: 1), () {
//               Navigator.pop(context);
//             });
//             isloading = false;
//           });
//         } else {
//           setState(() {
//             result = onError.toString();
//             // scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(result),backgroundColor: Colors.red,));
//             _showMessage("Payment failed", 'fail');
//             Future.delayed(Duration(seconds: 1), () {
//               Navigator.pop(context);
//             });
//             isloading = false;
//           });
//         }
//       });
//     } catch (err) {
//       result = err;
//     }
//   }
//
//   Future<void> _showMessage(String message, String status) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: status == "success" ? Colors.green : Colors.red,
//
//           title: Text("Payment",
//               style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w400,
//                   color: Colors.white)),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text(
//                   message,
//                   style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           // actions: <Widget>[
//           //   FlatButton(
//           //     child: Text(
//           //       "OK",
//           //     ),
//           //     onPressed: () {
//           //       // Navigator.pushReplacement(
//           //       //     context,
//           //       //     MaterialPageRoute(
//           //       //         builder: (context) =>
//           //       //             MainNavigation(flagNavigate: "1")));
//           //       if (status == "success") {
//           //         Navigator.push(
//           //             context,
//           //             MaterialPageRoute(
//           //                 builder: (context) =>
//           //                     MainNavigation(flagNavigate: "1")));
//           //       } else {
//           //         Navigator.pop(context);
//           //       }
//           //     },
//           //   ),
//           // ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         key: scaffoldKey,
//         appBar: AppBar(
//           title: Text(
//             "Payment Instruction",
//             style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w600,
//                 fontSize: 18.0,
//                 color: Colors.white),
//           ),
//         ),
//         body:
//             BlocBuilder<PaymentBloc, PaymentState>(
//                 builder: (context, paytmData) {
//                   return BlocListener<PaymentBloc, PaymentState>(
//                       listener: (context, state) {
//                         // if (state is RechargePaymentDataSuccess) {
//                         //   paymentDataList = state.paymentDataList;
//                         // }
//                         if (state is TokenSuccess) {
//                           txnToken = state.txtToken;
//                           orderId = state.orderId;
//
//                           //production url=https://securegw.paytm.in/theia/paytmCallback?ORDER_ID=
//                           //test url=https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=
//                           callbackUrl =
//                               "https://securegw.paytm.in/theia/paytmCallback?ORDER_ID=" +
//                                   orderId!;
//                           // isStaging = true for test mode;
//                           //vvimp
//                           isStaging = false; //for production mode isStaging =false
//                           restrictAppInvoke = true; //this only redirects to paytm app,if installed else to website so restrictAppInvoke should be false
//                           _startTransaction(widget.amount.toString(), txnToken!, orderId!, isStaging,
//                               restrictAppInvoke);
//                         }
//
//                         if (state is TokenFail) {
//                           Fluttertoast.showToast(msg: "Failed");
//                         }
//
//                         // if (state is PaymentSuccess) {
//                         //   // Fluttertoast.showToast(msg: state.msg,);
//                         //   _showMessage(state.msg, state.status);
//                         //   // scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(state.msg),backgroundColor: Colors.green,));
//                         //   Future.delayed(Duration(seconds: 2), () {
//                         //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavigation(flagNavigate: "1")));
//                         //
//                         //   });
//                         //   isloading=false;
//                         // }
//                         // if (state is PaymentFail) {
//                         //   // Fluttertoast.showToast(msg: state.msg);
//                         //   // Navigator.of(context).pop();
//                         //   _showMessage(state.msg, state.status);
//                         //   // scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(state.msg),
//                         //   //   backgroundColor: Colors.red,));
//                         //   Future.delayed(Duration(seconds: 1), () {
//                         //     Navigator.pop(context);
//                         //
//                         //   });
//                         //   isloading=false;
//                         //
//                         // }
//                         //
//                         // if (state is PaymentLoading) {
//                         //  isloading=true;
//                         // }
//                       },
//                       child: Container(
//                         // height: 420.0,
//                         // decoration: BoxDecoration(
//                         //     color: Colors.white,
//                         //     borderRadius: BorderRadius.only(topLeft:Radius.circular(8.0),topRight: Radius.circular(8.0))
//                         // ),
//                         child:
//                         // paymentDataList!=null
//                         //     ?
//                         Stack(
//                           children: [
//
//                             Container(
//                                 margin:
//                                 EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
//                                 child: ListView.separated(
//                                     controller: _scrollController,
//                                     // shrinkWrap: true,
//                                     physics: const AlwaysScrollableScrollPhysics(),
//                                     separatorBuilder: (context, index) {
//                                       return SizedBox(
//                                         height: 0.0,
//                                       );
//                                     },
//                                     // itemCount: paymentDataList.length,
//                                     itemCount: 10,
//                                     itemBuilder: (context, index) {
//                                       return GestureDetector(
//                                           onTap: () {
//                                             // Navigator.push(
//                                             //     context,
//                                             //     MaterialPageRoute(
//                                             //         builder: (context) =>
//                                             //         new CustOrderDetail(
//                                             //             orderData:
//                                             //             searchresult[
//                                             //             index])));
//                                           },
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 Expanded(
//                                                     child: Text("Payment Type",
//                                                       // paymentDataList[index]
//                                                       //     .paymentType,
//                                                       style: TextStyle(
//                                                           fontFamily: 'Sofia Pro',
//                                                           fontSize: 14.0,
//                                                           color: Colors.black,
//                                                           fontWeight: FontWeight.w500),
//                                                     )),
//                                                 SizedBox(
//                                                   width: 8.0,
//                                                 ),
//                                                 Expanded(
//                                                     child: Text("Description",
//                                                       // paymentDataList[index]
//                                                       //     .description,
//                                                       style: TextStyle(
//                                                           fontFamily: 'Sofia Pro',
//                                                           fontSize: 14.0,
//                                                           color: Colors.black,
//                                                           fontWeight: FontWeight.w500),
//                                                     )),
//                                               ],
//                                             ),
//                                           ));
//                                     })),
//                             if(isloading==true)
//                               Center(
//                                   child: SizedBox(
//                                     height: 25.0,
//                                     width: 25.0,
//                                     child: CircularProgressIndicator(
//                                       color: Colors.blue,
//                                       strokeWidth: 1.5,
//                                     ),
//                                   )),
//                             if(isloading==false)
//                               Positioned(
//                                   bottom: 10.0,
//                                   right: 10.0,
//                                   left: 10.0,
//                                   child: Container(
//                                     // margin: EdgeInsets.all(15.0),
//                                     child: AppButton(
//                                       disableTouchWhenLoading: false,
//                                       onPressed: () {
//                                         setState(() {
//                                           isloading=true;
//                                         });
//                                         _paymentBloc!.add(OnLoadingPayment(
//                                             amount: widget.amount.toString(),
//                                           website: "DEFAULT",
//                                           callBackUrl: "https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=$orderId",
//                                           mId: "ctqcfC52960494856707",
//                                            mKey: "IE3XtJ4BGHcSo167",
//                                           orderId: "1",
//                                         ));
//                                       },
//                                       shape: const RoundedRectangleBorder(
//                                           borderRadius:
//                                           BorderRadius.all(Radius.circular(15))),
//                                       text: "Confirm",
//                                       // loading: paytmData is PaymentLoading,
//                                       // disableTouchWhenLoading: false,
//                                     ),
//                                   )),
//                           ],
//                         )
//                             // :
//                   //       Center(child:SizedBox(
//                   //         height: 20.0,
//                   //         width: 20.0,
//                   //         child: CircularProgressIndicator(
//                   //           color: Colors.blue,
//                   //           strokeWidth: 1.3,
//                   //         ),
//                   //       )
//                   // ),
//                       ));
//                 }));
//
//   }
// }

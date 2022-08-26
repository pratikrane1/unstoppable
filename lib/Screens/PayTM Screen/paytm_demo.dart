// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
//
//
//
//
// class Payment extends StatefulWidget {
//   const Payment({Key? key}) : super(key: key);
//
//   @override
//   _PaymentState createState() => _PaymentState();
// }
//
// class _PaymentState extends State<Payment> {
//   String payment_response = '';
//   final String M_ID = "";      //Production MID
//   final String CHANNEL_ID = "WAP";// type here your channel id given by paytm
//   final String INDUSTRY_TYPE_ID = "Retail";  // type here your industry type id given by paytm
//   final String WEBSITE = "DEFAULT";    //for production
//
//   TextEditingController amountController = new TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Paytm example app'),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextFormField(
//                 controller: amountController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter Amount',
//                   prefix: Text('Rs. '),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 5.0,),
//               RaisedButton(
//                 onPressed: () {
//                   //Firstly Generate CheckSum bcoz Paytm Require this
//                   generateCheckSum();
//                 },
//                 color: Colors.blue,
//                 child: Text(
//                   "Pay Now",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               SizedBox(height: 20.0,),
//               Text('Response: $payment_response\n'),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void generateCheckSum() async {
//     String? mid = "ctqcfC52960494856707";
//
//
//     String orderId = DateTime
//         .now()
//         .millisecondsSinceEpoch
//         .toString();
//
//     var url =
//         'https://securegw-stage.paytm.in/theia/api/v1/initiateTransaction?mid=$mid&orderId=$orderId';
//
//
//     String callBackUrl =
//         'https://securegw.paytm.in/theia/paytmCallback?ORDER_ID=' +
//             orderId;
//
//     //Please use your parameters here
//     //CHANNEL_ID etc provided to you by paytm
//
//     final response = await http.post(Uri.parse(url), headers: {
//       "Content-Type": "application/x-www-form-urlencoded"
//     }, body: {
//       "M_ID": M_ID,
//       "CHANNEL_ID": CHANNEL_ID,
//       'INDUSTRY_TYPE_ID': INDUSTRY_TYPE_ID,
//       'WEBSITE': WEBSITE,
//       'TXN_AMOUNT': amountController.text,
//       'CALLBACK_URL': callBackUrl,
//       'ORDER_ID': orderId,
//       'CUST_ID': '1',
//     });
//
//     //for Testing(Stagging) use this
//
//     //https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=
//
//     //https://securegw.paytm.in/theia/paytmCallback?ORDER_ID=
//
//
//     if (response.statusCode == 200) {
//       var result = json.decode(response.body);
//
//       print("Response :" + response.body + "\nchecksumhash:" + result['CHECKSUMHASH']);
//
//       var paytmResponse = AllInOneSdk.startTransaction(
//           mid, orderId, amount,
//           txnToken, callbackUrl, isStaging, restrictAppInvoke
//           );
//
//       paytmResponse.then((value) {
//         setState(() {
//           payment_response = value.toString();
//         });
//       });
//     }
//     else{
//       print(response.statusCode);
//     }
//   }
// }
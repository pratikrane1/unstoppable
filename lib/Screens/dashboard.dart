import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import 'package:unstoppable/Blocs/home/bloc.dart';
import 'package:unstoppable/Screens/PayTM%20Screen/paytm_gateway.dart';
import 'package:unstoppable/Screens/search_page.dart';
import 'package:unstoppable/Screens/Products/unstoppableProducts.dart';
import 'package:unstoppable/Utils/application.dart';
import 'package:unstoppable/constant/theme_colors.dart';
import 'package:unstoppable/widgets/drawer.dart';
import 'package:http/http.dart' as http;
import '../Api/api.dart';
import '../Blocs/payTMGateway/payment_bloc.dart';
import '../widgets/bell_icon.dart';
import 'Leads/Leads.dart';
import 'YourBNC/business_networking_lead.dart';
import 'bottom_navbar.dart';
import 'customerEnquiries.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  //final FirebaseAuth auth = FirebaseAuth.instance;
  HomeBloc? _userHomeBloc;
  String? totalProd;
  int? totalInquiries,
      totalLeads,cancelledLeads,monthlyTarget,achievements;
  bool? isStaging;
  bool? restrictAppInvoke;
  String _mid = "ctqcfC52960494856707"; //live mid=GXytVC30838085377757
  String _mKey = "IE3XtJ4BGHcSo167"; //live mKey=IE3XtJ4BGHcSo167
  String _website = "WEBSTAGING";
  // String? orderId = Application.vendorLogin!.userId.toString();
  double? amount = 100;
  String orderId = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
  String? txnToken;
  String? callbackUrl;
  String? result;

  Future<void> generateTxnToken(double amount) async {

    Map<String,String> params={
      "amount": amount.toString(),
      "customer_id": Application.vendorLogin!.userId.toString(),
    };

    try {
      final response = await http.post(
        Uri.parse(Api.GENERATE_TOKEN),
        body: params,
        // headers: {'Content-type': "application/json"},
      );
      var resp=jsonDecode(response.body);

      final callBackUrl =
          'https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID='+resp['order_id'].toString();
      await initiateTransaction(resp['order_id'], amount, resp['txnToken'], callBackUrl);
    } catch (e) {
      print(e);
    }
  }

  Future<void> initiateTransaction(String orderId, double amount,
      String txnToken, String callBackUrl) async {
    String result = '';
    try {
      var response = AllInOneSdk.startTransaction(
        _mid,
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
        Fluttertoast.showToast(msg: "Payment done successfully");
        Navigator.pop(context);

      }).catchError((onError) {
        if (onError is PlatformException) {
          // result = onError.message! + " \n  " + onError.details.toString();
          result = onError.message! + " \n  " + onError.details.toString();
          Fluttertoast.showToast(msg: "Payment cancelled successfully");

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


  void initState() {
    // TODO: implement initState
    super.initState();
    _userHomeBloc = BlocProvider.of<HomeBloc>(context);
    _userHomeBloc!.add(OnLoadingHomeList(userid: Application.vendorLogin!.userId.toString()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:
      AppBar(
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Unstoppable Trade", style: TextStyle(color: ThemeColors.whiteTextColor),),
                // DropdownButton<String>(
                //   value: dropdownValue,
                //   icon: const Icon(
                //     Icons.keyboard_arrow_down_sharp,
                //     color: Colors.white,
                //     size: 30,
                //   ),
                //   elevation: 16,
                //   style: const TextStyle(
                //       color: ThemeColors.whiteTextColor,
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold),
                //   // underline: Container(
                //   //   height: 2,
                //   //   color: Colors.deepPurpleAccent,
                //   // ),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownValue = newValue!;
                //     });
                //   },
                //   items: <String>['My Acc', 'Two', 'Free', 'Four']
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(
                //         value, style: TextStyle(color: ThemeColors.scaffoldBgColor),
                //       ),
                //     );
                //   }).toList(),
                // ),
                // SizedBox(
                //   width: 130,
                // ),
                // Expanded(
                //   child: IconButton(
                //     icon: Icon(
                //       Icons.search,
                //       size: 30,
                //     ),
                //     onPressed: () {
                //       Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => SearchPage()));
                //     },
                //   ),
                // ),
                myAppBarIcon(),
              ],
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
      body: Scaffold(
          body: BlocBuilder<HomeBloc,HomeState>(builder:(context,dashboard){
            return BlocListener<HomeBloc,HomeState>(listener: (context,state){
              if(state is HomeListSuccess){
                totalProd=state.totalProd;
                totalLeads=state.totalLeads;
                totalInquiries=state.totalEnquiry;
                monthlyTarget=state.monthlyTarget;
                achievements=state.achievements;
                cancelledLeads=state.cancelLeads;
              }
            },
              child: GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(15),
                childAspectRatio: 0.7,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5,
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                (totalProd!=null)
                                    ?
                                Text(
                                  totalProd.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                )
                                :
                                Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),

                                Text(
                                  'Total Products',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            if(totalProd != 0){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavigation(index: 1,)));
                            }else {
                              Fluttertoast.showToast(
                                  msg: "Don't have any products");
                            }

                          },
                          child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(left: 0, top: 0),
                            decoration: BoxDecoration(
                              color: const Color(0xff228B22),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  <Widget>[
                                Text(
                                  'More info',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                (totalInquiries!=null)
                                    ?
                                Text(
                                  totalInquiries.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                )
                                    :
                                Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  'Total Enquiries',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            if(totalInquiries != 0){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavigation(index: 4,)));
                            }else {
                              Fluttertoast.showToast(
                                  msg: "Don't have any enquiry");
                            }

                          },
                          child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(left: 0, top: 0),
                            decoration: BoxDecoration(
                              color: const Color(0xff0d62a6),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  <Widget>[
                                Text(
                                  'More info',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.blue[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children:  [
                                (totalLeads!=null)
                                    ?
                                Text(
                                  totalLeads.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                )
                                    :
                                Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  'Total Leads',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            if(totalLeads != 0){
                              // Fluttertoast.showToast(
                              //     msg: "monthly target");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Leads()));
                            }else {
                              Fluttertoast.showToast(
                                  msg: "Don't have any total leads");
                            }
                          },
                          child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(left: 0, top: 0),
                            decoration: BoxDecoration(
                              color: const Color(0xff0d62a6),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  <Widget>[
                                Text(
                                  'More info',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children:  [
                                (cancelledLeads!=null)
                                    ?
                                Text(
                                  cancelledLeads.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                )
                                    :
                                Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                                Center(
                                  child: Text(
                                    'Cancelled Leads',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            if(cancelledLeads != 0){
                              // Fluttertoast.showToast(
                              //     msg: "monthly target");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Leads()));
                            }else {
                              Fluttertoast.showToast(
                                  msg: "Don't have any cancelled leads");
                            }

                          },
                          child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(left: 0, top: 0),
                            decoration: BoxDecoration(
                              color: const Color(0xffc77716),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  <Widget>[
                                Text(
                                  'More info',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children:  [
                                (monthlyTarget!=null)
                                    ?
                                Text(
                                  monthlyTarget.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                )
                                    :
                                Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  'Monthly Target',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            if(monthlyTarget != 0){
                              Fluttertoast.showToast(
                                  msg: "monthly target");
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => BusinessNetworkingLead()));
                            }else {
                              Fluttertoast.showToast(
                                  msg: "Don't have any monthly target");
                            }

                          },
                          child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(left: 0, top: 0),
                            decoration: BoxDecoration(
                              color: const Color(0xff2f7e32),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  <Widget>[
                                Text(
                                  'More info',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children:  [
                                (achievements!=null)
                                    ?
                                Text(
                                  achievements.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                )
                                    :
                                Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  'Achievements',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),

                        InkWell(
                            onTap: (){
                              if(achievements != 0){
                                Fluttertoast.showToast(
                                    msg: " achievements");
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => BusinessNetworkingLead()));
                              }else {
                                Fluttertoast.showToast(
                                    msg: "Do not have any achievements");
                              }

                            },
                            child: Container(
                              height: 60,
                              margin: const EdgeInsets.only(left: 0, top: 0),
                              decoration: BoxDecoration(
                                color: const Color(0xff0d62a6),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  <Widget>[
                                  Text(
                                    'More info',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_sharp,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                  // Center(
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(0),
                  //     child: SizedBox(
                  //       width: MediaQuery.of(context).size.width,
                  //       height: 40,
                  //       child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: ThemeColors.drawerTextColor,
                  //         ),
                  //         onPressed: ()  {
                  //            // PaytmConfig().generateTxnToken(amount!);
                  //           generateTxnToken(amount!);
                  //         },
                  //         child: Text(
                  //           'PayTM',
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            );
          })

      ),
    );
  }
}

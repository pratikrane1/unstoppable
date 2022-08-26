import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unstoppable/constant/font_size.dart';

import '../../../Blocs/paymenHistory/payment_history_bloc.dart';
import '../../../Blocs/paymenHistory/payment_history_event.dart';
import '../../../Blocs/paymenHistory/payment_history_state.dart';
import '../../../Constant/theme_colors.dart';
import '../../../Models/payment_history_model.dart';
import '../../../Utils/application.dart';
import '../../../widgets/drawer.dart';

class PaymentHistoryUpdated extends StatefulWidget {
  @override
  State<PaymentHistoryUpdated> createState() => _PaymentHistoryUpdatedState();
}

class _PaymentHistoryUpdatedState extends State<PaymentHistoryUpdated> {
  PaymentHistoryBloc? _paymentHistoryBloc;
  List<PaymentHistoryModel> paymentHistoryList = [];

  void initState() {
    // TODO: implement initState
    super.initState();

    _paymentHistoryBloc = BlocProvider.of<PaymentHistoryBloc>(context);
    _paymentHistoryBloc!.add(OnLoadingPaymentHistoryList(
        userid: Application.vendorLogin!.userId.toString()));
  }

  Widget buildSubscriptionList(
      BuildContext context, List<PaymentHistoryModel> paymentHistoryList) {
    if (paymentHistoryList.length <= 0) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        // padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Theme.of(context).hoverColor,
            highlightColor: Theme.of(context).highlightColor,
            enabled: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  // leading: nameIcon(),
                  leading: CachedNetworkImage(
                    filterQuality: FilterQuality.medium,
                    // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                    imageUrl: "https://picsum.photos/250?image=9",
                    // imageUrl: model.cart[index].productImg == null
                    //     ? "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
                    //     : model.cart[index].productImg,
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        baseColor: Theme.of(context).hoverColor,
                        highlightColor: Theme.of(context).highlightColor,
                        enabled: true,
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    },
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Shimmer.fromColors(
                        baseColor: Theme.of(context).hoverColor,
                        highlightColor: Theme.of(context).highlightColor,
                        enabled: true,
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.error),
                        ),
                      );
                    },
                  ),
                  title: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Loading...",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            //color: Theme.of(context).accentColor
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(
                                ".......",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black87,
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
              ),
            ),
          );
        },
        itemCount: List.generate(8, (index) => index).length,
      );
    }

    // return ListView.builder(
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 10, bottom: 15),
      itemBuilder: (context, index) {
        return SubInfoCard(context, paymentHistoryList[index]);
      },
      itemCount: paymentHistoryList.length,
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DrawerWidget()));
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Payment History'),
      ),
      body: BlocBuilder<PaymentHistoryBloc, PaymentHistoryState>(
          builder: (context, state) {
            if (state is PaymentHistoryListSuccess) {
              paymentHistoryList = state.paymentHistoryData!;
            }
            if (state is PaymentHistoryListLoading) {}

            // if (state is ProductDetailLoadFail) {
            //   flagNoDataAvailable = true;
            // }
            return Container(
              // decoration: new BoxDecoration(
              //   //borderRadius: new BorderRadius.circular(16.0),
              //   color: Colors.black12,
              // ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20.0, bottom: 10),
                child: Container(
                  // decoration: new BoxDecoration(
                  //   borderRadius: new BorderRadius.circular(16.0),
                  //   color: Colors.white,
                  // ),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // PaymentCard(),
                      // Card(
                      //   elevation: 40,
                      //   shape: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(15),
                      //       borderSide: BorderSide(color: Colors.white, width: 1)),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(16.0),
                      //       color: Colors.white,
                      //     ),
                      //     child: Column(
                      //       children: [
                      //         Container(
                      //           decoration: BoxDecoration(
                      //               border: Border(
                      //                   bottom: BorderSide(
                      //                     width: 0.5,
                      //                   ))),
                      //           child: ListTile(
                      //             title: Text(
                      //               "Payment History",
                      //               style: TextStyle(fontSize: FontSize.xLarge),
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           height: 5,
                      //         ),
                      //         Container(
                      //             height: 190,
                      //             child: ListView(
                      //               children: [
                      //                 infoCard(),
                      //                 infoCard(),
                      //                 infoCard(),
                      //                 infoCard(),
                      //                 infoCard(),
                      //               ],
                      //             )),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 50,
                      ),
                      // SubscribeCard(),
                      Card(
                        elevation: 40,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white, width: 1)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          width: 0.5,
                                        ))),
                                child: ListTile(
                                  title: Text(
                                    "Subscription History",
                                    style: TextStyle(fontSize: FontSize.xLarge),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  height: MediaQuery.of(context).size.height * 0.5,
                                  child: buildSubscriptionList(
                                      context, paymentHistoryList)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          })
      ,
    );
  }
}


Widget infoCard() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 2, color: Colors.blue),
        // color: Colors.black12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
          ),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "From Paytm",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        //color: Theme.of(context).accentColor
                      ),
                    ),
                  ),
                  Text("₹999")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        "3545ASD2255",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  Text(
                    "Yesterday, 09:10 PM",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: ThemeColors.textFieldHintColor),
                  ),
                ],
              ),
            ],
          ),

          //dense: true,
          // trailing:eyephone()
        ),
      ),
    ),
  );
}

Widget SubInfoCard(BuildContext context, PaymentHistoryModel subscriptionData) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 2, color: Colors.blue),
        // color: Colors.black12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
          ),
          title: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  subscriptionData.subscriptionType.toString(),
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    //color: Theme.of(context).accentColor
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        subscriptionData.subscriptionFromDate.toString()+" to "+subscriptionData.subscriptionToDate.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: ThemeColors.textFieldHintColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          //dense: true,
          // trailing:eyephone()
        ),
      ),
    ),
  );
}

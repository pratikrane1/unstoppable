import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unstoppable/Blocs/leads/leads_event.dart';
import 'package:unstoppable/Blocs/leads/leads_state.dart';
import 'package:unstoppable/Screens/Leads/Leads.dart';
import 'package:unstoppable/Utils/application.dart';

import '../../Blocs/leads/leads_block.dart';
import '../../Models/leads_model.dart';
import '../../widgets/seeIcon.dart';
import '../../constant/theme_colors.dart';

class LeadsDetails extends StatefulWidget {
  LeadModel leadData;
  LeadsDetails({Key? key, required this.leadData}) : super(key: key);
  @override
  State<LeadsDetails> createState() => _LeadsDetailsState();
}

class _LeadsDetailsState extends State<LeadsDetails> {
  LeadsBloc? _leadsBloc;
  List<LeadModel> leadList = [];
  LeadModel? leadData;
  int statusID = 2;

  void initState() {
    // TODO: implement initState
    super.initState();
    _leadsBloc = BlocProvider.of<LeadsBloc>(context);
    _leadsBloc!.add(
        OnLoadingLeadsList(userid: Application.vendorLogin!.userId.toString()));
  }

   getStatus(){
    if(statusID ==2){
      Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                  width: 0.4,
                ),
                bottom: BorderSide(
                  width: 0.4,
                ))),
        child: ListTile(
          onTap: () {
            statusID = 3;
          },
          title: const Text(
            'Viewed',
            style:
            TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
          ),
        ),
      );

    }
    else if(statusID == 3){
      Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                  width: 0.4,
                ),
                bottom: BorderSide(
                  width: 0.4,
                ))),
        child: ListTile(
          onTap: () {
            statusID = 4;
          },
          title: const Text(
            'Not-Interested',
            style:
            TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
          ),
        ),
      );
      Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                  width: 0.4,
                ),
                bottom: BorderSide(
                  width: 0.4,
                ))),
        child: ListTile(
          onTap: () {
            statusID = 5;
          },
          title: const Text(
            'Completed',
            style:
            TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
          ),
        ),
      );
      Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                  width: 0.4,
                ),
                bottom: BorderSide(
                  width: 0.4,
                ))),
        child: ListTile(
          onTap: () {
            statusID = 6;
          },
          title: const Text(
            'Cancelled',
            style:
            TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
          ),
        ),
      );
    }
    else if(statusID == 5){
      Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                  width: 0.4,
                ),
                bottom: BorderSide(
                  width: 0.4,
                ))),
        child: ListTile(
          onTap: () {
            statusID = 5;
          },
          title: const Text(
            'Completed',
            style:
            TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Leads()));
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: false,
        title: Text("Product Details"),
      ),
      body: BlocBuilder<LeadsBloc, LeadsState>(builder: (context, state) {
        if (state is LeadsListSuccess) {
          leadList = state.leadList!;
        }
        return Container(
          decoration: new BoxDecoration(
            //borderRadius: new BorderRadius.circular(16.0),
            color: Colors.black12,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListView(
                    children: [
                      // businessName( ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          top: 8.0,
                        ),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Business Name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.account_tree,
                                        color: Colors.black54,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        widget.leadData.businessName.toString(),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // nameIcon(),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          top: 8.0,
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Owner Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.mail,
                                    color: Colors.black54,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    widget.leadData.customerName.toString(),
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 13.0,
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Name",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: Colors.black54,
                              size: 15,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              widget.leadData.prodName.toString(),
                              style: TextStyle(color: Colors.black54, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          top: 13.0,
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Approximate Other Value (Rs.)",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.mail,
                                    color: Colors.black54,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    widget.leadData.approx.toString(),
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                  top: 13.0,
                                ),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Use",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today_rounded,
                                            color: Colors.black54,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            widget.leadData.useCase.toString(),
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Type(),
                              //date
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                  top: 13.0,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Date",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today_rounded,
                                          color: Colors.black54,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          widget.leadData.dateTime.toString(),
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                  top: 13.0,
                                ),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Email",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.mail,
                                            color: Colors.black54,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            widget.leadData.customerMail.toString(),
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    top: 13.0,
                                  ),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Unit Type",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_today_rounded,
                                              color: Colors.black54,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Text(
                                              widget.leadData.unitType.toString(),
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    top: 13.0,
                                  ),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Quantity",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_today_rounded,
                                              color: Colors.black54,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Text(
                                              widget.leadData.unit.toString(),
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                               //contact
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    top: 13.0,
                                  ),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Contact",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_today_rounded,
                                              color: Colors.black54,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Text(
                                              widget.leadData.customerContact.toString(),
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // TypeUse(),
                      // UnitTypeQuantity(),
                      // ContactDate(),
                      // Email(),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Status",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ),
                      BlocBuilder<LeadsBloc, LeadsState>(builder: (context, state) {
                        if (state is UpdateLeadSuccess) {
                          // Navigator.of(context).pop();
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                          Navigator.pushReplacement(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Leads()));
                          });

                          Fluttertoast.showToast(msg: state.message.toString());
                        }
                        // if (state is LeadsListLoading) {
                        //   CircularProgressIndicator();
                        // }

                        if (state is UpdateLeadFail) {
                          Fluttertoast.showToast(msg: state.message.toString());
                        }
                        return
                          Card(
                            elevation: 1,
                            margin: EdgeInsets.all(10),
                            color: Colors.white,
                            shadowColor: Colors.blueGrey,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: ThemeColors.buttonColor, width: 1)),
                            child: ExpansionTile(
                              // leading: Icon(
                              //   CupertinoIcons.pencil_ellipsis_rectangle,
                              //   color: ThemeColors.drawerTextColor,
                              // ),
                              title: Text(
                               widget.leadData.status.toString(),
                                style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
                              ),
                              children:
                              [

                                // Container(
                                //   decoration: BoxDecoration(
                                //       border: Border(
                                //           top: BorderSide(
                                //             width: 0.4,
                                //           ),
                                //           bottom: BorderSide(
                                //             width: 0.4,
                                //           ))),
                                //   child: ListTile(
                                //     onTap: () {
                                //
                                //     },
                                //     title: const Text(
                                //       'In-Progress',
                                //       style:
                                //       TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
                                //     ),
                                //   ),
                                // ),
                                // Container(
                                //   decoration: BoxDecoration(
                                //       border: Border(
                                //           top: BorderSide(
                                //             width: 0.4,
                                //           ),
                                //           bottom: BorderSide(
                                //             width: 0.4,
                                //           ))),
                                //   child: ListTile(
                                //     onTap: () {
                                //
                                //     },
                                //     title: const Text(
                                //       'Viewed',
                                //       style:
                                //       TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
                                //     ),
                                //   ),
                                // ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                            width: 0.4,
                                          ),
                                          bottom: BorderSide(
                                            width: 0.4,
                                          ))),
                                  child: ListTile(
                                    onTap: () {
                                      _leadsBloc!.add(UpdateLead(
                                          userid: Application.vendorLogin!.userId.toString(),
                                          status: 4.toString(),
                                          leadId: widget.leadData.id.toString()));
                                    },
                                    title: const Text(
                                      'Not Interested',
                                      style:
                                      TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
                                    ),
                                  ),
                                ),

                                ListTile(
                                  onTap: () {
                                    _leadsBloc!.add(UpdateLead(
                                        userid: Application.vendorLogin!.userId.toString(),
                                        status: 5.toString(),
                                        leadId: widget.leadData.id.toString()));
                                  },
                                  title: const Text(
                                    'Completed',
                                    style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
                                  ),
                                ),
                                // Container(
                                //   decoration: BoxDecoration(
                                //       border: Border(
                                //           top: BorderSide(
                                //             width: 0.4,
                                //           ),
                                //           bottom: BorderSide(
                                //             width: 0.4,
                                //           ))),
                                //   child: ListTile(
                                //     onTap: () {
                                //
                                //     },
                                //     title: const Text(
                                //       'Cancelled',
                                //       style:
                                //       TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          );
                      }
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

Widget deleteUpdateIcon() {
  return Padding(
    padding: const EdgeInsets.only(top: 18.0),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          deleteIcon(),
          SizedBox(
            width: 15,
          ),
          editIcon(),
        ],
      ),
    ),
  );
}

Widget businessName() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 8.0,
    ),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Business Name",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Row(
                children: [
                  Icon(
                    Icons.account_tree,
                    color: Colors.black54,
                    size: 15,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "Business",
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          nameIcon(),
        ],
      ),
    ),
  );
}

Widget ownerName() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 8.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Owner Name",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.mail,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Laptops, PC, Mainframes & Computers",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget approximateOtherValue() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 13.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Approximate Other Value (Rs.)",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.mail,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "16000 To 19999",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget productName() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 13.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Product Name",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.mail,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Product 1",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Type() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 13.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Type",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_today_rounded,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Automatic, Manual Other",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Use() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 13.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Use",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_today_rounded,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Agricultural Other",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget UnitType() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 13.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Unit Type",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_today_rounded,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Piece",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Quantity() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 13.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quantity",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_today_rounded,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "3",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Contact() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 13.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_today_rounded,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "+91 1234567890",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Date() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 13.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Date",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_today_rounded,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "11-04-2022",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Email() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 13.0,
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.mail,
                color: Colors.black54,
                size: 15,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Computers Systems",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget UnitTypeQuantity() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      UnitType(),
      Quantity(),
    ],
  );
}

Widget ContactDate() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Contact(),
      Date(),
    ],
  );
}

Widget TypeUse() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Type(),
      Use(),
    ],
  );
}

Widget updateStatusButton() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        // height: 40,
        // width:70,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent, width: 2),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Update Status",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ">",
                style: TextStyle(color: Colors.blueAccent, fontSize: 35),
              ),
            ],
          ),
        )),
  );
}

Widget usequantitydate() {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UnitType(),
        Quantity(),
        Date(),
        SizedBox(
          height: 55,
        ),
      ],
    ),
  );
}

Widget TypeUnitContactEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Use(),
      Type(),
      Contact(),
      Email(),
    ],
  );
}

Widget detail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TypeUnitContactEmail(),
      usequantitydate(),
    ],
  );
}

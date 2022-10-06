import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unstoppable/Blocs/leads/leads_event.dart';
import 'package:unstoppable/Blocs/leads/leads_state.dart';
import 'package:unstoppable/Screens/Leads/Leads.dart';
import 'package:unstoppable/Utils/application.dart';

import '../../Blocs/myTools/myTools_bloc.dart';
import '../../Blocs/myTools/myTools_event.dart';
import '../../Blocs/myTools/myTools_state.dart';
import '../../Constant/theme_colors.dart';
import '../../Models/untoppable_order_model.dart';
import 'unstoppable_orders.dart';


class MyUnstoppableOrdersDetail extends StatefulWidget {
  UnstoppableOrderModel ordersData;
  MyUnstoppableOrdersDetail({Key? key, required this.ordersData}) : super(key: key);
  @override
  State<MyUnstoppableOrdersDetail> createState() => _MyUnstoppableOrdersDetailState();
}

class _MyUnstoppableOrdersDetailState extends State<MyUnstoppableOrdersDetail> {
  MytoolsBloc? _ordersBloc;

  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();



  void initState() {
    // TODO: implement initState
    super.initState();
    _ordersBloc = BlocProvider.of<MytoolsBloc>(context);
    if(widget.ordersData!=null){
      _priceController.text = widget.ordersData.amount.toString();
      _quantityController.text = widget.ordersData.qty.toString();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => UnstoppableOrders()));
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: false,
        title: Center(child: Text("Order Detail")),
      ),
      body: Container(
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
                child: Form(
                  key: _formKey,
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
                                        widget.ordersData.businessName.toString(),
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
                                "Customer Name",
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
                                    widget.ordersData.customerName.toString(),
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
                                    widget.ordersData.prodName.toString(),
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
                                "Unit Type",
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
                                  widget.ordersData.unitType.toString(),
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
                                      widget.ordersData.customerMail.toString(),
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
                                  widget.ordersData.customerContact.toString(),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Quantity',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  child: TextFormField(
                                    controller: _quantityController,
                                    // initialValue: companyData![0].operatorDesignation.toString(),
                                    // controller: profile.addressController,
                                    obscureText: false,
                                    //initialValue: widget.userdata['name'],
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    style: TextStyle(
                                      fontSize: 18,
                                      height: 1.5,
                                    ),
                                    decoration:  InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                      hintStyle: TextStyle(fontSize: 15),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: ThemeColors.scaffoldBgColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: ThemeColors.scaffoldBgColor),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(width: 0.8, color: ThemeColors.scaffoldBgColor)),
                                      hintText: "Quantity",
                                    ),
                                    validator: (value) {
                                      if(value==null || value.isEmpty){
                                        return 'Please enter Quantity';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        if ( _formKey.currentState!.validate()) {}
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Price',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  child: TextFormField(
                                    controller: _priceController,
                                    // initialValue: companyData![0].operatorName.toString(),
                                    // controller: profile.addressController,
                                    obscureText: false,
                                    //initialValue: widget.userdata['name'],
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    style: TextStyle(
                                      fontSize: 18,
                                      height: 1.5,
                                    ),
                                    decoration:  InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                      hintStyle: TextStyle(fontSize: 15),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: ThemeColors.scaffoldBgColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: ThemeColors.scaffoldBgColor),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(width: 0.8, color: ThemeColors.scaffoldBgColor)),
                                      hintText: "Price",
                                    ),
                                    validator: (value) {
                                      if(value==null || value.isEmpty){
                                        return 'Please enter Price';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        if ( _formKey.currentState!.validate()) {}
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      BlocBuilder<MytoolsBloc, MytoolsState>(builder: (context, state){
                        if(state is UpdateOrderDataSuccess){
                          Navigator.of(context).pop();
                          Fluttertoast.showToast(msg: "Save Successfully");
                          // Navigator.push(
                          //     context, MaterialPageRoute(builder: (context) => UnstoppableOrders()));
                        }
                        if(state is UpdateOrderDataFail){
                          Fluttertoast.showToast(msg: "Could not save data");

                        }
                        return  Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: ThemeColors.drawerTextColor,
                                ),
                                onPressed: () {
                                  if(_formKey.currentState!.validate()){
                                    // Fluttertoast.showToast(msg: "Save Successfully");
                                    _ordersBloc!.add(UpdateOrderData(
                                        qty: _quantityController.text,
                                        amount: _priceController.text,
                                        leadid: widget.ordersData.leadId.toString(),


                                    ));
                                  }else {
                                    Fluttertoast.showToast(msg: "Please fill the data");
                                  }
                                },
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );

                      })

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}




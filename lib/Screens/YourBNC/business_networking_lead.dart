
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unstoppable/Blocs/businessOpportunity/bloc.dart';
import 'package:unstoppable/Models/get_BNC_model.dart';
import 'package:unstoppable/widgets/drawer.dart';
import '../../Blocs/businessOpportunity/businessOpportunity_bloc.dart';
import '../../Utils/application.dart';
import '../../constant/theme_colors.dart';
import '../bottom_navbar.dart';
import 'business_networking_contact.dart';

class BusinessNetworkingLead extends StatefulWidget{
  @override
  State<BusinessNetworkingLead> createState() => _BusinessNetworkingLeadState();
}

class _BusinessNetworkingLeadState extends State<BusinessNetworkingLead>{
  String rowid1 = "0";
  String rowid2 = "2";
  String rowid3 = "3";
  String rowid4 = "4";
  String rowid5 = "5";

  BusinessOpprtunityBloc? _businessOpprtunityBloc;
  List<GetBNCmodel> LeadList=[];


  void initState() {
    // TODO: implement initState
    super.initState();
    // rowid1;
    _businessOpprtunityBloc = BlocProvider.of<BusinessOpprtunityBloc>(context);

    _businessOpprtunityBloc!.add(OnLoadingBNC(
      userid: Application.vendorLogin!.userId.toString(), rowid: rowid1,
    ));

    // for update product
    // if(widget.rowId!=null){
    //   getSubCategoryByCategoryData();
    //   getSubSubCategoryBySubCatData();
    //
    // }
  }

  rowId(){
    if(rowid1 == 1){
      _businessOpprtunityBloc!.add(OnLoadingBNC(
        userid: Application.vendorLogin!.userId.toString(), rowid: rowid1,
      ));
    }
    else if( rowid1 == 2){
      _businessOpprtunityBloc!.add(OnLoadingBNC(
        userid: Application.vendorLogin!.userId.toString(), rowid: rowid1,
      ));
    }
    else if(rowid1 ==3){
      _businessOpprtunityBloc!.add(OnLoadingBNC(
        userid: Application.vendorLogin!.userId.toString(), rowid: rowid1,
      ));
    }
    else if(rowid1 == 4){
      _businessOpprtunityBloc!.add(OnLoadingBNC(
        userid: Application.vendorLogin!.userId.toString(), rowid: rowid1,
      ));
    }
    else if(rowid1 ==5){
      _businessOpprtunityBloc!.add(OnLoadingBNC(
        userid: Application.vendorLogin!.userId.toString(), rowid: rowid1,
      ));
    }
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
        title: Text('Business Networking'),
      ),
      body:
      Container(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
          Container(
            decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
            child:  ListView(
              children: [
                // For Lead 1
                BlocBuilder<BusinessOpprtunityBloc, BusinessOpportunityState>(builder: (context, state) {
                  if (state is GetBNCLoadSuccess) {
                    LeadList = state.getBNCLeadList!;
                    // data = LeadList[0];
                    // companyData = state.companyProfileData;
                    // setData(companyData!);
                    // setData(LeadList);
                  }

                  // if(state is CompanyProfileListLoadFail){
                  //   // companyData=[];
                  //   // setData(companyData!);
                  //   // setData();
                  // }

                  return
                    InkWell(
                        onTap: () {
                          setState((){
                            rowid1= "1";
                          });

                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => BusinessNetworkingContact(LeadList: LeadList[0])));

                        },
                        child: Padding(
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
                                  // leading: nameIcon(),
                                  leading:  Text(
                                    "Lead 1",
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      //color: Theme.of(context).accentColor
                                    ),
                                  ),
                                  //dense: true,
                                  trailing:  // For Edit Icon
                                  Container(
                                    width: 40,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius:  BorderRadius.circular(5.0),
                                      //color: Color(0xffc32c37),
                                      color: Colors.indigo,
                                      // border: Border.all(color: Colors.black, width: 1)
                                    ),
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.center,
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                              size: 21,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )));
                }
                ),



                // For Lead 2
                BlocBuilder<BusinessOpprtunityBloc, BusinessOpportunityState>(builder: (context, state) {
                  if (state is GetBNCLoadSuccess) {
                    LeadList = state.getBNCLeadList!;
                    // data = LeadList[0];
                    // companyData = state.companyProfileData;
                    // setData(companyData!);
                    // setData(LeadList);
                  }

                  // if(state is CompanyProfileListLoadFail){
                  //   // companyData=[];
                  //   // setData(companyData!);
                  //   // setData();
                  // }

                  return
                    InkWell(
                        onTap: () {
                          // setState((){
                          //   rowid1 = "2";
                          // });
                          _businessOpprtunityBloc!.add(OnLoadingBNC(
                            userid: Application.vendorLogin!.userId.toString(), rowid: rowid2,
                          ));
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => BusinessNetworkingContact(LeadList: LeadList[0])));


                        },
                        child: Padding(
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
                                  // leading: nameIcon(),
                                  leading:  Text(
                                    "Lead 2",
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      //color: Theme.of(context).accentColor
                                    ),
                                  ),
                                  //dense: true,
                                  trailing:  // For Edit Icon
                                  Container(
                                    width: 40,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius:  BorderRadius.circular(5.0),
                                      //color: Color(0xffc32c37),
                                      color: Colors.indigo,
                                      // border: Border.all(color: Colors.black, width: 1)
                                    ),
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.center,
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                              size: 21,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )));
                }
                ),


                // For Lead 3
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => BusinessNetworkingContact(LeadList: LeadList[0],)));


                    },
                    child: Padding(
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
                              // leading: nameIcon(),
                              leading:  Text(
                                "Lead 3",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  //color: Theme.of(context).accentColor
                                ),
                              ),
                              //dense: true,
                              trailing:  // For Edit Icon
                              Container(
                                width: 40,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:  BorderRadius.circular(5.0),
                                  //color: Color(0xffc32c37),
                                  color: Colors.indigo,
                                  // border: Border.all(color: Colors.black, width: 1)
                                ),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 21,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))),

                // For Lead 4
                InkWell(
                    onTap: () {

                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => BusinessNetworkingContact(LeadList: LeadList[0])));


                    },
                    child: Padding(
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
                              // leading: nameIcon(),
                              leading:  Text(
                                "Lead 4",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  //color: Theme.of(context).accentColor
                                ),
                              ),
                              //dense: true,
                              trailing:  // For Edit Icon
                              Container(
                                width: 40,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:  BorderRadius.circular(5.0),
                                  //color: Color(0xffc32c37),
                                  color: Colors.indigo,
                                  // border: Border.all(color: Colors.black, width: 1)
                                ),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 21,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))),

                // For Lead 5
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => BusinessNetworkingContact(LeadList: LeadList[0])));


                    },
                    child: Padding(
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
                              // leading: nameIcon(),
                              leading:  Text(
                                "Lead 5",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  //color: Theme.of(context).accentColor
                                ),
                              ),
                              //dense: true,
                              trailing:  // For Edit Icon
                              Container(
                                width: 40,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:  BorderRadius.circular(5.0),
                                  //color: Color(0xffc32c37),
                                  color: Colors.indigo,
                                  // border: Border.all(color: Colors.black, width: 1)
                                ),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 21,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))),
              ],
            ),



              ),


        ),
      ),
    );
  }

}



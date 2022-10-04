
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
  String rowId = "0";
  String rowid1 = "1";
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



    // for update product
    // if(widget.rowId!=null){
    //   getSubCategoryByCategoryData();
    //   getSubSubCategoryBySubCatData();
    //
    // }
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => DrawerWidget()));
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Business Networking'),
      ),
      body:BlocBuilder<BusinessOpprtunityBloc, BusinessOpportunityState>(builder: (context, state) {
        if (state is GetBNCLoadSuccess) {
          LeadList = state.getBNCLeadList!;
          Future.delayed(Duration(milliseconds: 3), () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BusinessNetworkingContact(LeadList: LeadList[0])));
          });

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
                    Padding(
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
                              InkWell(
                                onTap: (){
                                  rowId= "1";

                                  _businessOpprtunityBloc!.add(OnLoadingBNC(
                                    userid: Application.vendorLogin!.userId.toString(), rowid: rowId,
                                  ));
                                },
                                child:Container(
                                width: 40,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:  BorderRadius.circular(5.0),
                                  //color: Color(0xffc32c37),
                                  color: ThemeColors.buttonColor,
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
                          )),
                        )),



                    // For Lead 2
                    InkWell(
                        onTap: () {
                          // setState((){
                            rowId = "2";
                          // });
                          _businessOpprtunityBloc!.add(OnLoadingBNC(
                            userid: Application.vendorLogin!.userId.toString(), rowid: rowId,
                          ));
                          // Navigator.push(
                          //     context, MaterialPageRoute(builder: (context) => BusinessNetworkingContact(LeadList: LeadList[0])));


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
                                      color: ThemeColors.buttonColor,
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


                    // For Lead 3
                    InkWell(
                        onTap: () {
                          // setState((){
                            rowId= "3";
                          // });
                          _businessOpprtunityBloc!.add(OnLoadingBNC(
                            userid: Application.vendorLogin!.userId.toString(), rowid: rowId,
                          ));

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
                                      color: ThemeColors.buttonColor,
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

                          // setState((){
                            rowId= "4";
                          // });
                          _businessOpprtunityBloc!.add(OnLoadingBNC(
                            userid: Application.vendorLogin!.userId.toString(), rowid: rowId,
                          ));

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
                                      color: ThemeColors.buttonColor,
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
                          // setState((){
                            rowId= "5";
                          // });
                          _businessOpprtunityBloc!.add(OnLoadingBNC(
                            userid: Application.vendorLogin!.userId.toString(), rowid: rowId,
                          ));

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
                                      color: ThemeColors.buttonColor,
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
          );
      }
      )

    );
  }

}



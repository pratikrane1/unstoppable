import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unstoppable/Blocs/manageAllBuyingRequirement/manageAllBuyingRequirement_state.dart';
import 'package:unstoppable/Models/manageAllBuyingRequirements_model.dart';
import 'package:unstoppable/Screens/manageAllBuyingRequirement.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Blocs/manageAllBuyingRequirement/manageAllBuyingRequirement_block.dart';
import '../Blocs/manageAllBuyingRequirement/manageAllBuyingRequirements_event.dart';
import '../Constant/theme_colors.dart';
import '../Utils/translate.dart';
import '../widgets/seeIcon.dart';

class ManageAllBuyingRequirementDetails  extends StatefulWidget{
  ManageAllBuyingRequirementModel? allBuyingRequirementData;
  ManageAllBuyingRequirementDetails({Key? key, required this.allBuyingRequirementData}) : super(key: key);

  @override
  State<ManageAllBuyingRequirementDetails> createState() => _ManageAllBuyingRequirementDetailsState();
}

class _ManageAllBuyingRequirementDetailsState extends State<ManageAllBuyingRequirementDetails> {
  ManageAllBuyingRequirementBloc? _allBuyingRequirementBloc;

  void initState() {
    // TODO: implement initState
    super.initState();

    _allBuyingRequirementBloc = BlocProvider.of<ManageAllBuyingRequirementBloc>(context);


  }

  // Future<void> _showMessage(String message,int? role) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(
  //             "Delete Prduct",
  //             style:TextStyle(
  //                 fontFamily: 'Inter-SemiBold',
  //                 fontWeight: FontWeight.w500,
  //                 color: Colors.black
  //             )
  //         ),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text(
  //                 message,
  //                 style: Theme.of(context).textTheme.bodyText1,
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text(
  //               "OK",
  //             ),
  //             onPressed: () {
  //               Navigator.push(context, MaterialPageRoute(builder: (context)=>MainNavigation(userType:role.toString())));
  //
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }


  @override

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ManageAllBuyingRequirement()));
            // Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: false,
        title: Text("Manage All Buying Requirements Detail"),
      ),
      body:Container(
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
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Category Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
                                Row(
                                  children: [
                                    Icon(Icons.account_tree,color: Colors.black54,size: 15,),
                                    SizedBox(width: 7,),
                                    Text(widget.allBuyingRequirementData!.catId.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
                                  ],
                                ),
                              ],
                            ),
                            nameIcon(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sub Category",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
                            Row(
                              children: [
                                Icon(Icons.account_circle_outlined,color: Colors.black54,size: 15,),
                                SizedBox(width: 7,),
                                Text(widget.allBuyingRequirementData!.subcatId.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Product Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
                            Row(
                              children: [
                                Icon(Icons.mail,color: Colors.black54,size: 15,),
                                SizedBox(width: 7,),
                                Text(widget.allBuyingRequirementData!.prodName.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Approximate Other Value (Rs.)",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
                            Row(
                              children: [
                                Icon(Icons.mail,color: Colors.black54,size: 15,),
                                SizedBox(width: 7,),
                                Text(widget.allBuyingRequirementData!.approx.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
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
                              padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Type",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
                                        SizedBox(width: 7,),
                                        Text(widget.allBuyingRequirementData!.type.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Unit Type",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
                                        SizedBox(width: 7,),
                                        Text(widget.allBuyingRequirementData!.unitType.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Suppliers Will Be",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
                                        SizedBox(width: 7,),
                                        Text(widget.allBuyingRequirementData!.supWill.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Description",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
                                        SizedBox(width: 7,),
                                        Text(widget.allBuyingRequirementData!.description.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )    ,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Use",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
                                        SizedBox(width: 7,),
                                        Text(widget.allBuyingRequirementData!.useCase.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Quantity",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
                                        SizedBox(width: 7,),
                                        Text(widget.allBuyingRequirementData!.unit.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Suppliers Forms",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
                                        SizedBox(width: 7,),
                                        Text(widget.allBuyingRequirementData!.sup.toString(),style: TextStyle(color: Colors.black54,fontSize:12),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 40,),
                          ],
                        ),

                      ],
                    ),
                    // TypeUse(),
                    // UnitTypeQuantity(),
                    // SuppliersFormsSuppliersWillBe(),
                    // Description(),
                    SizedBox(height: 20,),
                    BlocBuilder<ManageAllBuyingRequirementBloc, ManageAllBuyingRequirementState>(builder: (context, state) {
                      if (state is DeleteAllBuyingRequirementSuccess) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => ManageAllBuyingRequirement()));
                        Fluttertoast.showToast(msg: "Product Deleted Successfully");

                      }
                      if(state is DeleteAllBuyingRequirementFail){
                        Fluttertoast.showToast(msg: "Couldn't Deleted Product");

                      }

                      return
                        InkWell(
                          onTap: (){
                            _allBuyingRequirementBloc!.add(DeleteAllBuyingRequirement(id:widget.allBuyingRequirementData!.id.toString()));


                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                //color: Color(0xffc32c37),
                                color: Colors.blue,
                                border: Border.all(color: Colors.black, width: 1)),
                            child: Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Center(
                                    child:
                                    Icon(Icons.delete,color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                    }
                    )
                     ,
                  ],
                ),
              ),
            ),
          ),
        ),

      ),
    );
  }
}

Widget Manageall()
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TypeUnitSuppliersDescription(),
      UseQuantitySuppliersWil(),

    ],
  );
}

Widget TypeUnitSuppliersDescription()
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Type(),
      UnitType(),
      SuppliersForms(),
      Description(),
    ],
  );
}

Widget UseQuantitySuppliersWil()
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Use(),
      Quantity(),
      SuppliersWillBe(),
      SizedBox(height: 40,),
    ],
  );
}




Widget deleteUpdateIcon(){
  return Padding(
    padding: const EdgeInsets.only(top: 18.0),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          deleteIcon(),
          SizedBox(width: 15,),
          editIcon(),
        ],
      ),
    ),
  );
}

Widget categoryName()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Category Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
              Row(
                children: [
                  Icon(Icons.account_tree,color: Colors.black54,size: 15,),
                  SizedBox(width: 7,),
                  Text("Select Category",style: TextStyle(color: Colors.black54,fontSize:12),),
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

Widget subcategoryName()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sub Category",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.account_circle_outlined,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Animal Clothing and Accessories",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}


Widget approximateOtherValue()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Approximate Other Value (Rs.)",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.mail,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("999-9999",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget productName()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.mail,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Product 1",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Type()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Type",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Multipurpose",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Use()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Use",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Commercial",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}
Widget UnitType()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Unit Type",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Multipurpose",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Quantity()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Quantity",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Commercial",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget SuppliersForms()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Suppliers Forms",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Multipurpose",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget SuppliersWillBe()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Suppliers Will Be",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Manufacturing",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Description()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("999-9999",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget UnitTypeQuantity(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      UnitType(),
      Quantity(),
    ],
  );
}

Widget SuppliersFormsSuppliersWillBe(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SuppliersForms(),
      SuppliersWillBe(),
    ],
  );
}

Widget TypeUse()
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Type(),
      Use(),
    ],
  );
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant/theme_colors.dart';
import '../widgets/icons_buttons.dart';
import 'bottom_navbar.dart';

class ManageAllBuyingRequirementDetails  extends StatefulWidget{
  @override
  State<ManageAllBuyingRequirementDetails> createState() => _ManageAllBuyingRequirementDetailsState();
}

class _ManageAllBuyingRequirementDetailsState extends State<ManageAllBuyingRequirementDetails> {
  @override

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:
      AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomNavigation(index: 0,)));
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Manage All Buying Requirement Details'),
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
                    categoryName(),
                    subcategoryName(),
                    productName(),
                    approximateOtherValue(),
                    Manageall(),
                    // TypeUse(),
                    // UnitTypeQuantity(),
                    // SuppliersFormsSuppliersWillBe(),
                    // Description(),
                    SizedBox(height: 20,),
                    delete()
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
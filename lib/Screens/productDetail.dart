import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/bell_icon.dart';
import '../widgets/icons_buttons.dart';



class ProductsDetails  extends StatefulWidget{
  var productId;
  ProductsDetails({Key? key,this.productId}):super(key: key);
  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  @override

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45.10,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.deepOrange[500],
        leading: Icon(CupertinoIcons.chevron_left,color: Colors.white,size: 18,),
        title: Text("Products Details",style: TextStyle(fontSize: 15),),

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
                    businessName(),
                    ownerName(),
                    productName(),
                    approximateOtherValue(),
                    detail(),
                    // TypeUse(),
                    // UnitTypeQuantity(),
                    // ContactDate(),
                    // Email(),
                    SizedBox(height: 20,),
                    updateStatusButton(),
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

Widget businessName()
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
              Text("Business Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
              Row(
                children: [
                  Icon(Icons.account_tree,color: Colors.black54,size: 15,),
                  SizedBox(width: 7,),
                  Text("Computer & IT Solutions",style: TextStyle(color: Colors.black54,fontSize:12),),
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

Widget ownerName()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Owner Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.mail,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Laptops, PC, Mainframes & Computers",style: TextStyle(color: Colors.black54,fontSize:12),),
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
              Text("16000 To 19999",style: TextStyle(color: Colors.black54,fontSize:12),),
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
              Text("Automatic, Manual Other",style: TextStyle(color: Colors.black54,fontSize:12),),
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
              Text("Agricultural Other",style: TextStyle(color: Colors.black54,fontSize:12),),
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
              Text("Piece",style: TextStyle(color: Colors.black54,fontSize:12),),
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
              Text("3",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Contact()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Contact",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("+91 1234567890",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Date()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Date",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.calendar_today_rounded,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("11-04-2022",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget Email()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 13.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:15),),
          Row(
            children: [
              Icon(Icons.mail,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Computers Systems",style: TextStyle(color: Colors.black54,fontSize:12),),
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

Widget ContactDate(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Contact(),
      Date(),
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

Widget updateStatusButton(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
     // height: 40,
     // width:70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent,width: 2),
        borderRadius: BorderRadius.circular(12)
      ),
      child:Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Update Status",style: TextStyle(color:Colors.blueAccent,fontSize: 15,fontWeight: FontWeight.bold),),
            Text(">",style: TextStyle(color:Colors.blueAccent,fontSize: 35),),

          ],
        ),
      )
    ),
  );
}

Widget usequantitydate()
{
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UnitType(),
        Quantity(),
        Date(),
        SizedBox(height: 55,),
      ],
    ),
  );
}

Widget TypeUnitContactEmail()
{
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

Widget detail()
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TypeUnitContactEmail(),
      usequantitydate(),
    ],
  );
}
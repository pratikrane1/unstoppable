import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unstoppable/Screens/search_page.dart';
import '../constant/theme_colors.dart';
import '../widgets/bell_icon.dart';
import '../widgets/drawer.dart';

class BuyingRequirmentSubmit  extends StatefulWidget{
  @override
  State<BuyingRequirmentSubmit> createState() => _BuyingRequirmentSubmitState();
}

class _BuyingRequirmentSubmitState extends State<BuyingRequirmentSubmit> {
  @override

  Widget build(BuildContext context)
  {
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
                Text("Buying Requirements"),

                myAppBarIcon(),
              ],
            ),
          ],
        ),
      ),
      // AppBar(
      //   toolbarHeight: 45.10,
      //   bottomOpacity: 0.0,
      //   elevation: 0.0,
      //   backgroundColor: Colors.deepOrange[500],
      //   //leading: Center(child: Text("<",style: TextStyle(color: Colors.white,fontSize: 30),)),
      //   title: Column(
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text("Business Networking",style: TextStyle(fontSize: 16),),
      //           myAppBarIcon(),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      //
      drawer: DrawerWidget(),

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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      _SelectCategory(),
                      SizedBox(height: 8,),
                      _subCategory(),
                      SizedBox(height: 8,),
                      _approximateOtherValue(),
                      SizedBox(height: 8,),
                      _unitTypeQuantity(context),
                      //_unitType(),
                      SizedBox(height: 8,),
                     // _quantity(),
                      SizedBox(height: 8,),
                      _productName(context),
                      SizedBox(height: 8,),
                      Manageall(),
                      SizedBox(height: 5,),
                      _agricultureCommersial(),
                      SizedBox(height: 5,),
                      _domestic(),
                      SizedBox(height: 5,),
                      _manuexportwhole(),
                      SizedBox(height: 5,),
                      _msgContainer(),
                      SizedBox(height: 5,),
                      _UpdateButton(context),
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

Widget _UpdateButton(BuildContext context) {
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ThemeColors.drawerTextColor,
          ),
          onPressed: () {},
          child: Text(
            'Submit',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ),
  );
}


Widget _unitTypeQuantity(BuildContext context)
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _unitType(context),
      //SizedBox(height: 8,),
      _quantity(context),
      SizedBox(height: 8,),
    ],
  );
}

Widget _SelectCategory() {
  String? selectedValue = '';

  return Column(
    children: [
      DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintStyle: TextStyle(fontSize: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide:
            BorderSide(width: 0.8, color:Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide:
            BorderSide(width: 0.8, color:Colors.black),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color:Colors.black)),
          hintText: "Select Category",
        ),
        // value: selectedValue,
        items: ['A', 'B', 'C']
            .map(
              (String item) => DropdownMenuItem<String>(
            child: Text(item),
            value: item,
          ),
        )
            .toList(),
        onChanged: (String? value) {
          // setState(() {
          //   selectedValue = value;
          // });
        },
      ),
    ],
  );
}

Widget _subCategory() {
  String? selectedValue = '';

  return Column(
    children: [
      DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintStyle: TextStyle(fontSize: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide:
            BorderSide(width: 0.8, color:Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide:
            BorderSide(width: 0.8, color:Colors.black),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color:Colors.black)),
          hintText: "Sub Category",
        ),
        // value: selectedValue,
        items: ['A', 'B', 'C']
            .map(
              (String item) => DropdownMenuItem<String>(
            child: Text(item),
            value: item,
          ),
        )
            .toList(),
        onChanged: (String? value) {
          // setState(() {
          //   selectedValue = value;
          // });
        },
      ),
    ],
  );
}


Widget _approximateOtherValue() {
  String? selectedValue = '';

  return Column(
    children: [
      DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintStyle: TextStyle(fontSize: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide:
            BorderSide(width: 0.8, color:Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide:
            BorderSide(width: 0.8, color:Colors.black),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color:Colors.black)),
          hintText: "Approximate other value (RS)",
        ),
        // value: selectedValue,
        items: ['A', 'B', 'C']
            .map(
              (String item) => DropdownMenuItem<String>(
            child: Text(item),
            value: item,
          ),
        )
            .toList(),
        onChanged: (String? value) {
          // setState(() {
          //   selectedValue = value;
          // });
        },
      ),
    ],
  );
}

Widget _unitType(BuildContext context)
{
  String? selectedValue = '';

  return Container(
    //width: MediaQuery.of(context).size.width * 0.3,
    width: 130,
    child: Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            hintStyle: TextStyle(fontSize: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color:Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color:Colors.black),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide:
                BorderSide(width: 0.8, color:Colors.black)),
            hintText: "Unit Type",
          ),
          // value: selectedValue,
          items: ['A', 'B', 'C']
              .map(
                (String item) => DropdownMenuItem<String>(
              child: Text(item),
              value: item,
            ),
          )
              .toList(),
          onChanged: (String? value) {
            // setState(() {
            //   selectedValue = value;
            // });
          },
        ),
      ],
    ),
  );
}

Widget _quantity(BuildContext context) {
  String? selectedValue = '';

  return Container(
   // width: MediaQuery.of(context).size.width * 0.3,
      width: 130,
    child: Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            hintStyle: TextStyle(fontSize: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color:Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color:Colors.black),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide:
                BorderSide(width: 0.8, color:Colors.black)),
            hintText: "Quantity",
          ),
          // value: selectedValue,
          items: ['A', 'B', 'C']
              .map(
                (String item) => DropdownMenuItem<String>(
              child: Text(item),
              value: item,
            ),
          )
              .toList(),
          onChanged: (String? value) {
            // setState(() {
            //   selectedValue = value;
            // });
          },
        ),
      ],
    ),
  );
}

Widget _productName(BuildContext context)
{
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.4,
    child: TextFormField(
      // controller: profile.addressController,
      obscureText: false,
      //initialValue: widget.userdata['name'],
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontSize: 18,
        height: 0.8,
      ),
      decoration: const InputDecoration(
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        hintStyle: TextStyle(fontSize: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide:
          BorderSide(width: 0.8, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide:
          BorderSide(width: 0.8, color: Colors.black),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide:
            BorderSide(width: 0.8, color: Colors.black)),
        hintText: "Product Name",
      ),
      validator: (value) {
        // profile.address = value!.trim();
      },
      onChanged: (value) {
        // profile.address = value;
      },
    ),
  );
}

Widget _selectItem()
{
  return Container(

  );
}


Widget Manageall()
{
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _atomaticManualOther(),
            _semiatomaticMultiporpose()

          ],
        ),
      ),
    ),
  );
}

Widget _atomaticManualOther()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Automatic",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Manual",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Other",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _semiatomaticMultiporpose()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Semi Automatic",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Multipurpose",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 28,)
        ],
      ),
    ),
  );
}


Widget _agricultureCommersial()
{
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _agriclututreEnduseOther(),
            _commercialIndustrial()

          ],
        ),
      ),
    ),
  );
}

Widget _agriclututreEnduseOther()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Agriculture",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("End use",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Other",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _commercialIndustrial()
{
  return Padding(
    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Commercial",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 7,),
              Text("Industrial",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 28,)
        ],
      ),
    ),
  );
}

Widget _manuexportwhole()
{
  return Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left:8.0,right: 2.0,bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _manufacturingRetailer(),
            _exporterCounsultant(),
            _wholesealerFreelancer()

          ],
        ),
      ),
    ),
  );
}

Widget _manufacturingRetailer()
{
  return Padding(
    padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 8.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 3,),
              Text("Manufacturing",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 3,),
              Text("Retailer",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 3,),
              Text("Service Provider",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
        ],
      ),
    ),
  );
}
Widget _exporterCounsultant()
{
  return Padding(
    padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 8.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 3,),
              Text("Exporter",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 3,),
              Text("Consultant",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 28,)
        ],
      ),
    ),
  );
}

Widget _wholesealerFreelancer()
{
  return Padding(
    padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 8.0,),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width: 3,),
              Text("Wholesaler",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
              SizedBox(width:3,),
              Text("Freelancer",style: TextStyle(color: Colors.black54,fontSize:12),),
            ],
          ),
          SizedBox(height: 28,)
        ],
      ),
    ),
  );
}

Widget _domesticStateNational()
{
  return Padding(
    padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 8.0,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(

          children: [
            Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
            SizedBox(width: 3,),
            Text("Domestic",style: TextStyle(color: Colors.black54,fontSize:12),),
          ],
        ),
        SizedBox(width: 5,),
        Row(
          children: [
            Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
            SizedBox(width:3,),
            Text("State",style: TextStyle(color: Colors.black54,fontSize:12),),
          ],
        ),
        SizedBox(width: 5,),
        Row(
          children: [
            Icon(CupertinoIcons.circle,color: Colors.black54,size: 15,),
            SizedBox(width:3,),
            Text("National",style: TextStyle(color: Colors.black54,fontSize:12),),
          ],
        ),
      ],
    ),
  );
}

Widget _domestic()
{
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:_domesticStateNational(),
      ),
    ),
  );
}

Widget _msgContainer()
{
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Text("Description",style: TextStyle(color: Colors.black54,fontSize:12),)
      ),
    ),
  );
}

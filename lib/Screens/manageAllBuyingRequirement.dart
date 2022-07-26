import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant/theme_colors.dart';
import '../widgets/bell_icon.dart';
import '../widgets/drawer.dart';
import '../widgets/dropdown.dart';
import '../widgets/icons_buttons.dart';
import 'bottom_navbar.dart';



class ManageAllBuyingRequirement  extends StatefulWidget{
  @override
  State<ManageAllBuyingRequirement> createState() => _ManageAllBuyingRequirementState();
}

class _ManageAllBuyingRequirementState extends State<ManageAllBuyingRequirement> {


  @override

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:
      AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DrawerWidget(context)));
            // Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Manage All Buying Requirement"),
                // myAppBarIcon(),
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
      //   leading: Icon(CupertinoIcons.chevron_left,color: Colors.white,size: 18,),
      //   title: Column(
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text("Manage All Buying Requirement",style: TextStyle(fontSize: 16),),
      //           myAppBarIcon(),
      //         ],
      //       ),
      //
      //     ],
      //   ),
      //
      // ),
      body:SingleChildScrollView(
        child: Container(
          height: 700,
          decoration: new BoxDecoration(
            //borderRadius: new BorderRadius.circular(16.0),
            color: Colors.black12,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(16.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  //Searchbar(),
                  searchDot(),
                  SizedBox(height: 5,),
                  info(),
                  pagenationdetail(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget searchDot()
{
  return ListTile(
    title:Searchbar() ,
    trailing:Icon(Icons.more_vert) ,
  );
}

Widget info(){
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          height: 500,
          child:ListView(
            children: [
              infoManage(),
              infoManage(),
              infoManage(),
              infoManage(),
              infoManage(),
              infoManage(),
            ],
          )
      )
  );
}

Widget Searchbar()
{
  return Padding(
    padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 0.0),
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8.0),
        /* -- Text and Icon -- */
        hintText: "Search Here...",
        hintStyle: const TextStyle(
          fontSize: 18,
          color: Color(0xFFB3B1B1),
        ), // TextStyle

        // Icon
        /* -- Border Styling -- */
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45.0),
          borderSide: const BorderSide(
            width: 1.0,
            color: Color(0xFFFF0000),
          ), // BorderSide
        ), // OutlineInputBorder
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45.0),
          borderSide: const BorderSide(
            width: 1.0,
            color: Colors.grey,
          ), // BorderSide
        ), // OutlineInputBorder
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45.0),
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.grey,
          ), // BorderSide
        ), // OutlineInputBorder
      ), // InputDecoration
    ),
  ); // Expanded
}


Widget infoManage(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration:  BoxDecoration(
        borderRadius:  BorderRadius.circular(10.0),
        border: Border.all(width: 2, color: Colors.blue),
        // color: Colors.black12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            contentPadding: EdgeInsets.zero,
            //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            leading: nameIcon(),
            title: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Table",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
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
                          "Require tables for office use",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(width: 20,)
                      ],
                    ),
                    Text(
                      "2022-04-01",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),

            //dense: true,
            trailing:eyeIcon()
        ),
      ),
    ),
  );
}


Widget pagegnation()
{
  return Column(
    children: [
      Text("Items per page:",style: TextStyle(fontSize: 14,color: Colors.black),),
      DropdownButtonWidget(),
    ],
  );
}

Widget backForwordIcons(){
  return Row(
    children: [
      backIcon(),
      SizedBox(width: 5,),
      forwordIcon(),
    ],
  );
}
Widget pagenationdetail()
{
  return Padding(
    padding: const EdgeInsets.only(top:15.0,right: 15,left: 15,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        pagegnation(),
        backForwordIcons()
      ],
    ),
  );
}



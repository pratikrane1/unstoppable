import 'package:flutter/material.dart';
import '../constant/theme_colors.dart';
import '../widgets/bell_icon.dart';
import '../widgets/drawer.dart';
import '../widgets/dropdown.dart';
import '../widgets/icons_buttons.dart';
import 'bottom_navbar.dart';



class BusinessNetworking  extends StatefulWidget{
  @override
  State<BusinessNetworking> createState() => _BusinessNetworkingState();
}

class _BusinessNetworkingState extends State<BusinessNetworking> {

  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    //MyAccountPage(),
    Text(
      'Index 1: Products',
      style: optionStyle,
    ),
    Text(
      'Index 2: Network',
      style: optionStyle,
    ),
    Text(
      'Index 3: Buying Req',
      style: optionStyle,
    ),
    Text(
      'Index 4: Enquires',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


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
                Text("Business Networking"),

                myAppBarIcon(),
              ],
            ),
          ],
        ),
      ),

      drawer: DrawerWidget(context),
      body:SingleChildScrollView(
        child: Container(
          height: 650,
          decoration: new BoxDecoration(
            //borderRadius: new BorderRadius.circular(16.0),
            color: Colors.black12,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:15.0,right: 15.0,top: 20.0,bottom: 10),
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
          height: 450,
          child:ListView(
            children: [
              infoCard(),
              infoCard(),
              infoCard(),
              infoCard(),
              infoCard(),
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


Widget infoCard(){
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
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
          ),
          title: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Amolak sweets",
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
                        "Ajay tiki",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(width: 20,)
                    ],
                  ),
                  Text(
                        "Processing",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: Colors.orange),
                  ),
                ],
              ),
            ],
          ),

          //dense: true,
          trailing:eyephone()
        ),
      ),
    ),
  );
}

Widget detailCard(){
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
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue,
            ),
            title: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "A for apple",
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
                          "Kavita Lande",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black87,
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(width: 20,)
                      ],
                    ),
                    Text(
                      "Cancel",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                          color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),

            //dense: true,
            trailing:eyepdelete()
        ),
      ),
    ),
  );
}

Widget eyephone()
{
  return Row(
      mainAxisSize: MainAxisSize.min,
    children: [
      eyeIcon(),
      SizedBox(width: 5,),
      phoneIcon(),
    ],
  );
}

Widget eyepdelete()
{
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      eyeIcon(),
      SizedBox(width: 5,),
      deleteIcon(),
    ],
  );
}

Widget pagegnation()
{
  return Column(
    children: [
      Text("Items per page:",style: TextStyle(fontSize: 10,color: Colors.black),),
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
    padding: const EdgeInsets.only(top:8.0,right: 15,left: 15,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        pagegnation(),
        backForwordIcons()
      ],
    ),
  );
}




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unstoppable/widgets/drawer.dart';

import '../constant/theme_colors.dart';
import 'bottom_navbar.dart';
import 'business_networking_contact.dart';

class BusinessNetworkingLead extends StatefulWidget{
  @override
  State<BusinessNetworkingLead> createState() => _BusinessNetworkingLeadState();
}

class _BusinessNetworkingLeadState extends State<BusinessNetworkingLead>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DrawerWidget(context)));
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Business Networking'),
      ),
      body: Container(
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
                InkWell(
                    onTap: () {

                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => BusinessNetworkingContact()));

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
                        ))),


                // For Lead 2
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => BusinessNetworkingContact()));

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
                        ))),

                // For Lead 3
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => BusinessNetworkingContact()));

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
                          context, MaterialPageRoute(builder: (context) => BusinessNetworkingContact()));

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
                          context, MaterialPageRoute(builder: (context) => BusinessNetworkingContact()));

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



// Widget _UpdateButton(BuildContext context) {
//   return Center(
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(0),
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: 40,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: ThemeColors.drawerTextColor,
//           ),
//           onPressed: () {},
//           child: Text(
//             'Save',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
//
// Widget _List(BuildContext context){
//   return SingleChildScrollView(
//     scrollDirection: Axis.vertical,
//     child: Container(
//       height: 600,
//       decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(16),
//     ),
//       child: ListView(
//         children: [
//           _Category(context),
//           _SubCategory(context),
//           _SubSubCategory(context),
//           _ProductName(context),
//           _Type(context)
//         ],
//       ),
//
//     ),
//   );
// }
// Widget _Category(BuildContext context){
//   return Card(
//     elevation: 1,
//     margin: EdgeInsets.all(10),
//     color: Colors.white,
//     shadowColor: Colors.blueGrey,
//     shape:  OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
//     ),
//     child: Container(
//
//       child: ExpansionTile(
//
//         // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
//         title: Text('Category', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//                       width: 0.3,
//                     )
//                 )
//             ),
//             child: ListTile(
//               onTap: (){},
//               title: const Text('Not Intrested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//             ),
//           ),
//           ListTile(
//             onTap: (){
//               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));
//
//             },
//             title: const Text('Complete', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget _SubCategory(BuildContext context){
//   return Card(
//     elevation: 1,
//     margin: EdgeInsets.all(10),
//     color: Colors.white,
//     shadowColor: Colors.blueGrey,
//     shape:  OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
//     ),
//     child: Container(
//
//       child: ExpansionTile(
//
//         // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
//         title: Text('Sub Category', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//                       width: 0.3,
//                     )
//                 )
//             ),
//             child: ListTile(
//               onTap: (){},
//               title: const Text('Not Interested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//             ),
//           ),
//           ListTile(
//             onTap: (){
//               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));
//
//             },
//             title: const Text('Completed', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget _SubSubCategory(BuildContext context){
//   return Card(
//     elevation: 1,
//     margin: EdgeInsets.all(10),
//     color: Colors.white,
//     shadowColor: Colors.blueGrey,
//     shape:  OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
//     ),
//     child: Container(
//
//       child: ExpansionTile(
//
//         // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
//         title: Text('Sub Sub Category', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//                       width: 0.3,
//                     )
//                 )
//             ),
//             child: ListTile(
//               onTap: (){},
//               title: const Text('Not Interested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//             ),
//           ),
//           ListTile(
//             onTap: (){
//               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));
//
//             },
//             title: const Text('Completed', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget _ProductName(BuildContext context){
//   return Card(
//     elevation: 1,
//     margin: EdgeInsets.all(10),
//     color: Colors.white,
//     shadowColor: Colors.blueGrey,
//     shape:  OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
//     ),
//     child: Container(
//
//       child: ExpansionTile(
//
//         // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
//         title: Text('Product Name', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//                       width: 0.3,
//                     )
//                 )
//             ),
//             child: ListTile(
//               onTap: (){},
//               title: const Text('Not Interested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//             ),
//           ),
//           ListTile(
//             onTap: (){
//               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));
//
//             },
//             title: const Text('Completed', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget _Type(BuildContext context){
//   return Card(
//     elevation: 1,
//     margin: EdgeInsets.all(10),
//     color: Colors.white,
//     shadowColor: Colors.blueGrey,
//     shape:  OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
//     ),
//     child: Container(
//
//       child: ExpansionTile(
//
//         // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
//         title: Text('Type', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//                       width: 0.3,
//                     )
//                 )
//             ),
//             child: ListTile(
//               onTap: (){},
//               title: const Text('Not Interested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//             ),
//           ),
//           ListTile(
//             onTap: (){
//               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));
//
//             },
//             title: const Text('Completed', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//           ),
//         ],
//       ),
//     ),
//   );
// }
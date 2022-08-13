
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unstoppable/widgets/drawer.dart';

import '../constant/theme_colors.dart';
import 'bottom_navbar.dart';

class BusinessNetworkingContact extends StatefulWidget{
  @override
  State<BusinessNetworkingContact> createState() => _BusinessNetworkingContactState();
}

class _BusinessNetworkingContactState extends State<BusinessNetworkingContact>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pushReplacement(context,
        //         MaterialPageRoute(builder: (context) => DrawerWidget(context)));
        //   },
        //   child: Icon(Icons.arrow_back_ios),
        // ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Business Networking'),
      ),
      body: Container(
        decoration: new BoxDecoration(
          //borderRadius: new BorderRadius.circular(16.0),
          color: Colors.black12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
            SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Expanded(
                child: ListView(
                  children: [
                    // For Category
                  Card(
                  elevation: 1,
                  margin: EdgeInsets.all(10),
                  color: Colors.white,
                  shadowColor: Colors.blueGrey,
                  shape:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
                  ),
                  child: Container(

                    child: ExpansionTile(

                      // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
                      title: Text('Category', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),

                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                    width: 0.3,
                                  )
                              )
                          ),
                          child: ListTile(
                            onTap: (){},
                            title: const Text('Not Intrested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
                          ),
                        ),
                        ListTile(
                          onTap: (){
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));

                          },
                          title: const Text('Complete', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
                        ),
                      ],
                    ),
                  ),
                ),

                    // For Sub category
                  Card(
                    elevation: 1,
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    shadowColor: Colors.blueGrey,
                    shape:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
                    ),
                    child: Container(

                      child: ExpansionTile(

                        // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
                        title: Text('Sub Category', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),

                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      width: 0.3,
                                    )
                                )
                            ),
                            child: ListTile(
                              onTap: (){},
                              title: const Text('Not Interested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
                            ),
                          ),
                          ListTile(
                            onTap: (){
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));

                            },
                            title: const Text('Completed', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
                          ),
                        ],
                      ),
                    ),
                  ),

                    // For Subsubcategory
                  Card(
                    elevation: 1,
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    shadowColor: Colors.blueGrey,
                    shape:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
                    ),
                    child: Container(

                      child: ExpansionTile(

                        // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
                        title: Text('Sub Sub Category', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),

                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      width: 0.3,
                                    )
                                )
                            ),
                            child: ListTile(
                              onTap: (){},
                              title: const Text('Not Interested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
                            ),
                          ),
                          ListTile(
                            onTap: (){
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));

                            },
                            title: const Text('Completed', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
                          ),
                        ],
                      ),
                    ),
                  ),

                   // For Product Name
                  Card(
                    elevation: 1,
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    shadowColor: Colors.blueGrey,
                    shape:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
                    ),
                    child: Container(

                      child: ExpansionTile(

                        // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
                        title: Text('Product Name', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),

                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      width: 0.3,
                                    )
                                )
                            ),
                            child: ListTile(
                              onTap: (){},
                              title: const Text('Not Interested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
                            ),
                          ),
                          ListTile(
                            onTap: (){
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));

                            },
                            title: const Text('Completed', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
                          ),
                        ],
                      ),
                    ),
                  ),

                    // For Type
                  Card(
                    elevation: 1,
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    shadowColor: Colors.blueGrey,
                    shape:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
                    ),
                    child: Container(

                      child: ExpansionTile(

                        // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
                        title: Text('Type', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),

                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      width: 0.3,
                                    )
                                )
                            ),
                            child: ListTile(
                              onTap: (){},
                              title: const Text('Not Interested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
                            ),
                          ),
                          ListTile(
                            onTap: (){
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));

                            },
                            title: const Text('Completed', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ],
                ),
              ),

            ),
          ),
              SizedBox(height: 15,),
              // UpdateButton
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: SizedBox(
                 // width: 200,
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ThemeColors.drawerTextColor,
                    ),
                    onPressed: () {},
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
            ),
            ],
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
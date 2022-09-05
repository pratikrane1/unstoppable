import 'package:flutter/material.dart';

import '../Screens/bottom_navbar.dart';
import '../constant/theme_colors.dart';

Widget appBarWidget(BuildContext context){
  return Scaffold(
    appBar: AppBar(
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
      // title: Text('Payment History'),
    ),
    // AppBar(
    //   toolbarHeight: 35.10,
    //   bottomOpacity: 0.0,
    //   elevation: 0.0,
    //   backgroundColor: Colors.deepOrange[500],
    //   leading: GestureDetector(
    //     onTap: (){
    //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavigation()));
    //     },
    //     child: Icon(Icons.arrow_back_ios),
    //   ),
    //   title: Column(
    //     children: [
    //       SizedBox(height: 10,),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text("Notification"),
    //         ],
    //       ),
    //     ],
    //   ),
    // ),
  );
}

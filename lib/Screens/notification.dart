import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constant/theme_colors.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {


  Widget notificationCard(){
    return Center(
      child: Text("No Notifications",
      style: TextStyle(
        fontSize: 20
      ),),
    );
    // return ListView.builder(
    //     scrollDirection: Axis.vertical,
    //     itemCount: 10,
    //     itemBuilder: (context, index) {
    //       return Card(
    //         elevation: 4,
    //         margin: EdgeInsets.all(10),
    //         color: Colors.white,
    //         shadowColor: Colors.blueGrey,
    //         shape:  OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(10),
    //             borderSide: BorderSide(color: ThemeColors.primaryColor, width: 1)
    //         ),
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children:  <Widget>[
    //             ListTile(
    //                 leading: Container(
    //                     height: double.infinity,
    //                     child: Icon(Icons.message_rounded, color: Colors.black,)),
    //                 title:  Container(
    //                   width: MediaQuery.of(context).size.width/2.5,
    //                   child: Text(
    //                     "Saikripa Enterprises Replyed you for Sendisk hard drive 10 Units",
    //                     style: TextStyle(
    //                       fontFamily: 'SF-Pro-Display-Medium',
    //                       fontWeight: FontWeight.w500,
    //                       color: ThemeColors.greyTextColor.withOpacity(0.7),
    //                       fontSize: 12.0,
    //                     ),
    //                     maxLines: 3,
    //
    //                   ),
    //                 ),
    //                 subtitle: Row(
    //                   children: [
    //                     Icon(Icons.access_time, size: 12,),
    //                     SizedBox(width: 5,),
    //                     Text("8H", style:
    //                     TextStyle(
    //                       fontSize: 11,
    //                       fontFamily: 'SF-Pro-Display-Regular',
    //                     ),),
    //                   ],
    //                 )
    //             )
    //
    //           ],
    //         ),
    //       );
    //
    //     },
    //   );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios,color: ThemeColors.whiteTextColor),
          ),
          backgroundColor: ThemeColors.baseThemeColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Notification', style: TextStyle(color: ThemeColors.whiteTextColor),),
        ),
        backgroundColor: Color(0xffF8F9FC),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Container(
                child: notificationCard()),
          ),
        )

    );
  }
}
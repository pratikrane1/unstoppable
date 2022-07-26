import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/theme_colors.dart';
import '../widgets/bell_icon.dart';
import 'bottom_navbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomNavigation()));
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Profile'),
      ),
      // PreferredSize(
      //   preferredSize: Size.fromHeight(50),
      //   child: AppBar(
      //     toolbarHeight: 35.10,
      //     bottomOpacity: 0.0,
      //     elevation: 0.0,
      //     backgroundColor: Colors.deepOrange[500],
      //     leading: GestureDetector(
      //       onTap: (){
      //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavigation()));
      //       },
      //       child: Icon(Icons.arrow_back_ios),
      //     ),
      //     title: Column(
      //       children: [
      //         SizedBox(height: 10,),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text("Notification"),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            shadowColor: Colors.blueGrey,
            shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.green, width: 1)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  <Widget>[
                ListTile(
                  leading: Icon(Icons.message_rounded, color: Colors.black,),
                  title: Text("Notification", style: TextStyle(fontSize: 20),),
                  subtitle: Row(
                    children: [
                      Icon(Icons.access_time, size: 17,),
                      SizedBox(width: 5,),
                      Text("8H"),
                    ],
                  )
                )

              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            shadowColor: Colors.blueGrey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  <Widget>[
                ListTile(
                    leading: Icon(Icons.message_rounded, color: Colors.black,),
                    title: Text("Notification", style: TextStyle(fontSize: 20),),
                    subtitle: Row(
                      children: [
                        Icon(Icons.access_time, size: 17,),
                        SizedBox(width: 5,),
                        Text("8H"),
                      ],
                    )
                )

              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            shadowColor: Colors.blueGrey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  <Widget>[
                ListTile(
                    leading: Icon(Icons.message_rounded, color: Colors.black,),
                    title: Text("Notification", style: TextStyle(fontSize: 20),),
                    subtitle: Row(
                      children: [
                        Icon(Icons.access_time, size: 17,),
                        SizedBox(width: 5,),
                        Text("8H"),
                      ],
                    )
                )

              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            shadowColor: Colors.blueGrey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  <Widget>[
                ListTile(
                    leading: Icon(Icons.message_rounded, color: Colors.black,),
                    title: Text("Notification", style: TextStyle(fontSize: 20),),
                    subtitle: Row(
                      children: [
                        Icon(Icons.access_time, size: 17,),
                        SizedBox(width: 5,),
                        Text("8H"),
                      ],
                    )
                )

              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            shadowColor: Colors.blueGrey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  <Widget>[
                ListTile(
                    leading: Icon(Icons.message_rounded, color: Colors.black,),
                    title: Text("Notification", style: TextStyle(fontSize: 20),),
                    subtitle: Row(
                      children: [
                        Icon(Icons.access_time, size: 17,),
                        SizedBox(width: 5,),
                        Text("8H"),
                      ],
                    )
                )

              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            shadowColor: Colors.blueGrey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  <Widget>[
                ListTile(
                    leading: Icon(Icons.message_rounded, color: Colors.black,),
                    title: Text("Notification", style: TextStyle(fontSize: 20),),
                    subtitle: Row(
                      children: [
                        Icon(Icons.access_time, size: 17,),
                        SizedBox(width: 5,),
                        Text("8H"),
                      ],
                    )
                )

              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            shadowColor: Colors.blueGrey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  <Widget>[
                ListTile(
                    leading: Icon(Icons.message_rounded, color: Colors.black,),
                    title: Text("Notification", style: TextStyle(fontSize: 20),),
                    subtitle: Row(
                      children: [
                        Icon(Icons.access_time, size: 17,),
                        SizedBox(width: 5,),
                        Text("8H"),
                      ],
                    )
                )

              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            shadowColor: Colors.blueGrey,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  <Widget>[
                ListTile(
                    leading: Icon(Icons.message_rounded, color: Colors.black,),
                    title: Text("Notification", style: TextStyle(fontSize: 20),),
                    subtitle: Row(
                      children: [
                        Icon(Icons.access_time, size: 17,),
                        SizedBox(width: 5,),
                        Text("8H"),
                      ],
                    )
                )

              ],
            ),
          )
        ],
      )

    );
  }
}
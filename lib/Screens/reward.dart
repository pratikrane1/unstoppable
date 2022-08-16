import 'package:flutter/material.dart';

import '../constant/theme_colors.dart';
import '../widgets/drawer.dart';
import 'bottom_navbar.dart';

class Rewards extends StatefulWidget{
  @override
  State<Rewards> createState()=> _RewardsState();
}

class _RewardsState extends State<Rewards>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DrawerWidget()));
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Reward'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
              children: <Widget>[
              ]
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/bell_icon.dart';
import 'bottom_navbar.dart';

class BuyingReq extends StatefulWidget {
  const BuyingReq({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BuyingReqState createState() => _BuyingReqState();
}

class _BuyingReqState extends State<BuyingReq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          toolbarHeight: 35.10,
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.deepOrange[500],
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomNavigation(index: 0,)));
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          title: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Buying Requirement"),
                  myAppBarIcon(),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: new BoxDecoration(
          //borderRadius: new BorderRadius.circular(16.0),
          color: Colors.black12,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 20.0, bottom: 55),
          child: Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                // Searchbar(),
                SizedBox(
                  height: 5,
                ),
                // info(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unstoppable/constant/font_size.dart';
import '../constant/theme_colors.dart';
import '../widgets/drawer.dart';
import 'bottom_navbar.dart';

class PaymentHistory extends StatefulWidget {
  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
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
        title: Text('Payment History'),
      ),
      body: Container(
        // decoration: new BoxDecoration(
        //   //borderRadius: new BorderRadius.circular(16.0),
        //   color: Colors.black12,
        // ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 20.0, bottom: 10),
          child: Container(
            // decoration: new BoxDecoration(
            //   borderRadius: new BorderRadius.circular(16.0),
            //   color: Colors.white,
            // ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                PaymentCard(),
                SizedBox(
                  height: 30,
                ),
                SubscribeCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget PaymentCard() {
  return Card(
    elevation: 40,
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white, width: 1)),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          PaymentText(),
          SizedBox(
            height: 5,
          ),
          info(),
        ],
      ),
    ),
  );
}

Widget SubscribeCard() {
  return Card(
    elevation: 40,
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white, width: 1)),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SubscribeText(),
          SizedBox(
            height: 5,
          ),
          SubInfo(),
        ],
      ),
    ),
  );
}

Widget PaymentText() {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
      width: 0.5,
    ))),
    child: ListTile(
      title: Text(
        "Payment History",
        style: TextStyle(fontSize: FontSize.xLarge),
      ),
    ),
  );
}

Widget SubscribeText() {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
      width: 0.5,
    ))),
    child: ListTile(
      title: Text(
        "Subscription History",
        style: TextStyle(fontSize: FontSize.xLarge),
      ),
    ),
  );
}

Widget info() {
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          height: 190,
          child: ListView(
            children: [
              infoCard(),
              infoCard(),
              infoCard(),
              infoCard(),
              infoCard(),
            ],
          )));
}

Widget SubInfo() {
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          height: 190,
          child: ListView(
            children: [
              SubInfoCard(),
            ],
          )));
}

Widget infoCard() {
  return Padding(
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
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
          ),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "From Paytm",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        //color: Theme.of(context).accentColor
                      ),
                    ),
                  ),
                  Text("₹999")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        "3545ASD2255",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  Text(
                    "Yesterday, 09:10 PM",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: ThemeColors.textFieldHintColor),
                  ),
                ],
              ),
            ],
          ),

          //dense: true,
          // trailing:eyephone()
        ),
      ),
    ),
  );
}

Widget SubInfoCard() {
  return Padding(
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
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
          ),
          title: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Free Trial",
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    //color: Theme.of(context).accentColor
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        "04-04-2022 to 20-04-2022",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: ThemeColors.textFieldHintColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          //dense: true,
          // trailing:eyephone()
        ),
      ),
    ),
  );
}

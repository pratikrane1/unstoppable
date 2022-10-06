import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unstoppable/Screens/notification.dart';

class myAppBarIcon extends StatefulWidget {
  const myAppBarIcon({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _myAppBarIconState createState() => _myAppBarIconState();
}
class _myAppBarIconState extends State<myAppBarIcon> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          //color: Color(0xffc32c37),
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1)),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationPage()));

        },
        child: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          child: Stack(
            children: [
              const Center(
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                  size: 21,
                ),
              ),
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 5, left: 4),
                child: Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //color: Color(0xffc32c37),
                      color: Colors.green,
                      border: Border.all(color: Colors.black, width: 1)),
                  child: const Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Center(
                      child: Text(
                        "",
                        // _counter.toString(),
                        style: TextStyle(fontSize: 10),
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
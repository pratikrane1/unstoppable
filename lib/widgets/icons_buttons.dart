import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget eyeIcon(){
  return Container(
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
              Icons.remove_red_eye_rounded,
              color: Colors.white,
              size: 21,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget phoneIcon(){
  return Container(
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
              Icons.phone,
              color: Colors.white,
              size: 21,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget deleteIcon(){
  return Container(
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
              Icons.delete,
              color: Colors.white,
              size: 21,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget backIcon(){
  return Container(
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
              CupertinoIcons.arrow_left,
              color: Colors.white,
              size: 21,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget forwordIcon(){
  return Container(
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
              CupertinoIcons.arrow_right,
              color: Colors.white,
              size: 21,
            ),
          ),
        ],
      ),
    ),
  );
}
Widget editIcon(){
  return Container(
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
              CupertinoIcons.eyedropper,
              color: Colors.white,
              size: 21,
            ),
          ),
        ],
      ),
    ),
  );
}


Widget nameIcon(){
  return Container(
    width: 45,
    height: 45,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        //color: Color(0xffc32c37),
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 1)),
    child: Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Center(
              child:
              Text("AS",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)
          ),
        ],
      ),
    ),
  );
}

Widget delete(){
  return Container(
    width: 45,
    height: 45,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        //color: Color(0xffc32c37),
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 1)),
    child: Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Center(
            child:
            Icon(Icons.delete,color: Colors.white,),
          ),
        ],
      ),
    ),
  );
}
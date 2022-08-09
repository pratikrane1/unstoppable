import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/add_product.dart';

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

Widget imageBox(){
  return Container(
    width: 55,
    height: 55,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        //color: Color(0xffc32c37),
       // color: Colors.white,
        border: Border.all(color: Colors.black, width: 1)),
    child: Container(
      width: 35,
      height: 35,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Center(
              child:
              // Image.asset(
              //   'assets/images/Product1.jpg',
              //   height: 30,
              //   width: 30,
              // ),
            Image.network('https://picsum.photos/250?image=9'),
          ),
        ],
      ),
    ),
  );
}


Widget addIcon(BuildContext context){
  return InkWell(
    onTap: (){
      AddProduct(context);
    },
    child: Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          //color: Color(0xffc32c37),
          color: Colors.indigo,
          border: Border.all(color: Colors.black, width: 1)),
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Center(
                child:Icon(Icons.add,color: Colors.white,)
            ),
          ],
        ),
      ),
    ),
  );
}

Widget checkedIcon(){
  return Container(
    width: 15,
    height: 15,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        //color: Color(0xffc32c37),
        color: Colors.green,
        border: Border.all(color: Colors.black, width: 1)),
    child: Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Center(
              child:Icon(CupertinoIcons.check_mark,color: Colors.white,)
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

Widget updateTextButton(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 60,
      height: 45,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          //color: Color(0xffc32c37),
          color: Colors.blue,
          border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(12),),

      child: Container(
        width: 60,
        height: 30,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Center(
              child:
              Text("Update",style: (TextStyle(color: Colors.white,fontSize: 15)),)
            ),
          ],
        ),
      ),
    ),
  );
}

Widget submitTextButton(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 60,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        //color: Color(0xffc32c37),
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(12),),

      child: Container(
        width: 60,
        height: 30,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Center(
                child:
                Text("Submit",style: (TextStyle(color: Colors.white,fontSize: 15)),)
            ),
          ],
        ),
      ),
    ),
  );
}


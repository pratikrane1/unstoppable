import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unstoppable/Screens/login/sign_in.dart';

import '../config/image.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 5;

  @override
  void initState() {
    startTime();
    super.initState();
  }

  startTime() async {
    return Timer(await Duration(seconds: splashDuration), () {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => SignInPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.splash),
              // fit: BoxFit.cover,
            ),
          ),
          // child: Center(
          //   child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         Image.asset("images/logo.png", width: 300, height: 300),
          //         SizedBox(
          //           width: 10,
          //           height: 10,
          //           child: CircularProgressIndicator(
          //             strokeWidth: 1,
          //             color: Colors.red,
          //           ),
          //         ),
          //       ]),
          // ),
        ),
      ),
    );
  }
}

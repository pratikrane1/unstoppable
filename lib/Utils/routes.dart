import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unstoppable/Screens/login/sign_in.dart';



class Routes {

  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String roleType='/roleType';
  static const String mainNavi='/maninNavi';
  static const String otp = "/otp"; //added on 6/02/2021
  static const String verifyPhone = "/verifyPhone";
  static const String otpRegUser = "/otpREgUser"; //added on 9/02/2021
  static const String forgotPassword = "/forgotPassword";
  static const String editProfile = "/editProfile";
  static const String profAddress = "/profaddress";
  static const String cart = "/cart";
  static const String terms='/terms';
  static const String privacy='/privacy';
  static const String faq='/faq';


  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signIn:
        return MaterialPageRoute(
          builder: (context) {
            // return SignIn(from: settings.arguments);
            return SignInPage();
          },
          fullscreenDialog: false,
        );



      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Not Found"),
              ),
              body: Center(
                child: Text('No path for ${settings.name}'),
              ),
            );
          },
        );
    }
  }

  ///Singleton factory
  static final Routes _instance = Routes._internal();

  factory Routes() {
    return _instance;
  }

  Routes._internal();
}

import 'package:flutter/material.dart';
import 'package:unstoppable/Screens/login/sign_in.dart';
import 'package:unstoppable/Screens/splash_screen.dart';
import 'Screens/bottom_navbar.dart';
// import 'package:unstoppable/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unstoppable',
      theme: ThemeData(
        fontFamily: 'SofiaPro',
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


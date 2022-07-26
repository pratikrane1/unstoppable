import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unstoppable/Screens/dashboard.dart';
import 'package:unstoppable/Screens/login/sign_up.dart';
import 'package:unstoppable/constant/font_size.dart';
import 'package:unstoppable/constant/theme_colors.dart';

import '../bottom_navbar.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? _gender = "";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
               SizedBox(
                  height: 200,
                  width: 300,
                  child: Center(
                    child: Image.asset('assets/images/Logo.png'),
                    // Text(
                    //   "Unstoppable",
                    //   style: TextStyle(fontSize: FontSize.xxLarge),
                    // ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 325,
                  // height: 270,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Card(
                    color: ThemeColors.cardColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Welcome User!",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "User Id",
                                textAlign: TextAlign.start,
                              )),
                          Container(
                            height: 40,
                            child: TextFormField(

                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                // labelText: 'Email Address',
                                hintText: 'Enter your email here',
                              ),
                            ),
                          ),
                          // Container(
                          //   width: 260,
                          //   // height: 60,
                          //   child:
                          // ),
                          const SizedBox(
                            height: 15,
                          ),

                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Password",
                                textAlign: TextAlign.start,
                              )),
                          // const SizedBox(height: 30,),
                          Container(
                            height: 40,
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                // labelText: 'Email Address',
                                hintText: 'Enter your password here',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children:  [
                        // Icon(CupertinoIcons.circle),
                        Radio(
                            value: "remember",
                            groupValue: _gender,
                            onChanged: (value){
                              setState(() {
                                _gender = value.toString();
                              });
                            }),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        Text("Remember me"),
                      ],
                    ),
                    InkWell(
                        onTap: () {},
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                              color: ThemeColors.drawerTextColor,
                              fontSize: FontSize.medium),
                        ))
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: ThemeColors.drawerTextColor,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavigation()));
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New User?",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                    },
                    child: Text(
                      "Register Here",
                      style: TextStyle(
                          color: ThemeColors.drawerTextColor,
                          fontSize: FontSize.medium,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

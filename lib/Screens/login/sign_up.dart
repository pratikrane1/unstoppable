import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unstoppable/Screens/login/sign_in.dart';
import 'package:unstoppable/constant/font_size.dart';
import 'package:unstoppable/constant/theme_colors.dart';

import '../bottom_navbar.dart';
import '../dashboard.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{

  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

  List<DropdownMenuItem<ListItem>>? _dropdownMenuItems;
  ListItem? _selectedItem;

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  void initState(){
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems![0].value!;

  }

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
                  height:150,
                  width: 300,
                  child: Image.asset('assets/images/Logo.png'),

        ),
              const SizedBox(height: 10,),
              Center(
                child: Container(
                  width: 325,
                  // height: 270,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child:
                  Card(
                    color: ThemeColors.cardColor,
                    shape:  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    elevation: 35,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Align(alignment: Alignment.bottomLeft,
                            child: Text("Welcome User!",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight:FontWeight.bold
                              ),),
                          ),
                          const SizedBox(height: 15,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 55,
                            child:
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                  BorderSide(color: ThemeColors.drawerTextColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                  BorderSide(color: ThemeColors.drawerTextColor),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: ThemeColors.drawerTextColor)),
                              ),
                              hint: const Text('Owner',),
                              items: <String>['Owner', 'B', 'C', 'D'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                          const SizedBox(height: 15,),

                          const Align(alignment: Alignment.topLeft,
                              child: Text("Name", textAlign: TextAlign.start,)),
                          Container(
                            height: 40,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                // labelText: 'Email Address',
                                hintText: 'Enter your name',

                              ),
                            ),
                          ),

                          const SizedBox(height: 15,),

                          const Align(alignment: Alignment.topLeft,
                              child: Text("Email", textAlign: TextAlign.start,)),
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

                          const SizedBox(height: 15,),

                          const Align(alignment: Alignment.topLeft,
                              child: Text("Phone Number", textAlign: TextAlign.start,)),
                          Container(
                            height: 40,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                // labelText: 'Email Address',
                                hintText: 'Enter your phone number',

                              ),
                            ),
                          ),

                          const SizedBox(height: 15,),

                          const Align(alignment: Alignment.topLeft,
                              child: Text("Password", textAlign: TextAlign.start,)),
                          // const SizedBox(height: 30,),
                          Container(
                            height: 40,
                            child: TextFormField(
                              obscureText: true,
                              // obscuringCharacter: "*",
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                // labelText: 'Email Address',
                                hintText: 'Enter your password here',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),

                          const Align(alignment: Alignment.topLeft,
                              child: Text("Confirm Password", textAlign: TextAlign.start,)),
                          // const SizedBox(height: 30,),
                          Container(
                            height: 40,
                            child: TextFormField(
                              obscureText: true,
                              // obscuringCharacter: "*",
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                // labelText: 'Email Address',
                                hintText: 'Enter your password here',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                            'Submit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      // ElevatedButton.icon(
                      //   style: ElevatedButton.styleFrom(
                      //     primary: ThemeColors.baseThemeColor,
                      //   ),
                      //   icon: Icon(
                      //     Icons.update,
                      //     size: 26,
                      //   ),
                      //   label: Text(
                      //     'Update',
                      //     style: TextStyle(
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.w400,
                      //     ),
                      //   ),
                      //   onPressed: () {
                      //     // profile.updateUserPassword(context: context);
                      //   },
                      // ),
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Already User?",style: TextStyle(fontWeight: FontWeight.normal),),
                  SizedBox(width: 8,),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInPage()));
                    },
                    child: Text("Login", style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: FontSize.medium,fontWeight: FontWeight.bold),),),


                ],
              ),


            ],
          ),
        ),
      ),
    );
  }

}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
import 'package:flutter/material.dart';
import '../config/image.dart';
import '../constant/theme_colors.dart';
import '../widgets/drawer.dart';
import 'bottom_navbar.dart';
// import '/Controllers/profile_controller.dart';
// import '/services/validators.dart';
// import '/utils/theme_colors.dart';
// import '/widgets/loader.dart';
// import 'package:get/get.dart';

class EditPasswordPage extends StatefulWidget {
  @override
  State<EditPasswordPage> createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  // Validators validators = Validators();
  //
  // final profileController = ProfileController();
  var mainHeight, mainWidth;

  @override
  void initState() {
    // profileController.onInit();
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;
    return
        // GetBuilder<ProfileController>(
        // init: ProfileController(),
        // builder: (profile) =>
        Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DrawerWidget(context)));
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Change Password'),
      ),
      body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.bg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.orange,
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  height: mainHeight / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeColors.baseThemeColor.withOpacity(.01),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Current Password'),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            // controller: profile.passwordCurrentController,
                            obscureText: false,
                            //initialValue: widget.userdata['name'],
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 18,
                              height: 0.8,
                            ),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: ThemeColors.scaffoldBgColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: ThemeColors.scaffoldBgColor),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: ThemeColors.scaffoldBgColor)),
                              hintText: "",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('New Password'),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            // controller: profile.passwordController,
                            obscureText: true,
                            //initialValue: widget.userdata['name'],
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 18,
                              height: 0.8,
                            ),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: ThemeColors.scaffoldBgColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: ThemeColors.scaffoldBgColor),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: ThemeColors.scaffoldBgColor)),
                              hintText: "",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Confirm password'),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            // controller: profile.passwordConfirmController,
                            obscureText: true,
                            //initialValue: widget.userdata['name'],
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 18,
                              height: 0.8,
                            ),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: ThemeColors.scaffoldBgColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: ThemeColors.scaffoldBgColor),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: ThemeColors.scaffoldBgColor)),
                              hintText: "",
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: ThemeColors.baseThemeColor,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

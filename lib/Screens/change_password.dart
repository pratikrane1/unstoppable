import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unstoppable/Blocs/settings/settings_bloc.dart';
import 'package:unstoppable/Blocs/settings/settings_event.dart';
import 'package:unstoppable/Blocs/settings/settings_state.dart';
import '../Utils/connectivity_check.dart';
import '../config/image.dart';
import '../constant/theme_colors.dart';
import '../widgets/app_dialogs.dart';
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
  final _textCurrentPasswordController = TextEditingController();
  final _textNewPasswordController = TextEditingController();
  final _textConfirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isconnectedToInternet = false;
  var mainHeight, mainWidth;
  SettingsBloc? settingsBloc;

  @override
  void initState() {
    settingsBloc = BlocProvider.of<SettingsBloc>(context);

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
                MaterialPageRoute(builder: (context) => DrawerWidget()));
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
            SizedBox(
                height: 150,
                width: 200,
                child: Center(
                  child: Image.asset('assets/images/Logo.png'),
                  // Text(
                  //   "Unstoppable",
                  //   style: TextStyle(fontSize: FontSize.xxLarge),
                  // ),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
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
                        controller: _textCurrentPasswordController,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter current password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            if (_formKey.currentState!.validate()) {}
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('New Password'),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _textNewPasswordController,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter new password';
                          } else if (_textCurrentPasswordController.text ==
                              value.toString()) {
                            return 'Current password should not be same as new password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            if (_formKey.currentState!.validate()) {}
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Confirm password'),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _textConfirmPasswordController,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter confirm password';
                          } else if (_textNewPasswordController.text != value) {
                            return 'Confirm password did not match with new password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            if (_formKey.currentState!.validate()) {}
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<SettingsBloc, SettingsState>(
                        builder: (context, changePass) {
                          return BlocListener<SettingsBloc, SettingsState>(
                            listener: (context, state) {
                              if (state is ChangePassSuccess) {
                                Fluttertoast.showToast(
                                    msg: state.message.toString());
                                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>
                                DrawerWidget()));
                              }
                              if (state is ChangePassFail) {
                                Fluttertoast.showToast(
                                    msg: state.message.toString());
                              }
                            },
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: ThemeColors.baseThemeColor,
                                    ),
                                    onPressed: () async {
                                      isconnectedToInternet =
                                          await ConnectivityCheck
                                              .checkInternetConnectivity();
                                      if (isconnectedToInternet == true) {
                                        if (_formKey.currentState!.validate()) {
                                          settingsBloc!.add(OnChangePassword(
                                              currentPwd:
                                                  _textCurrentPasswordController
                                                      .text,
                                              newPwd: _textNewPasswordController
                                                  .text));
                                        }
                                      } else {
                                        CustomDialogs.showDialogCustom(
                                            "Internet",
                                            "Please check your Internet Connection!",
                                            context);
                                      }
                                    },
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
                          );
                        },
                      )
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

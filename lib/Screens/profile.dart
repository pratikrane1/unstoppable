import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import '/Controllers/profile_controller.dart';
// import '/services/validators.dart';
// import '/utils/theme_colors.dart';
// import '/widgets/loader.dart';
// import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../config/image.dart';
import '../constant/font_size.dart';
import '../constant/size_config.dart';
import '../constant/theme_colors.dart';
import 'bottom_navbar.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  // Validators validators = Validators();
  // final profileController = ProfileController();
  var mainHeight, mainWidth;
  File? _image;

  @override
  void initState() {
    // profileController.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        _image = File(image!.path);
      });
    }

    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    return
        // GetBuilder<ProfileController>(
        // init: ProfileController(),
        // builder: (profile) =>
        Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomNavigation()));
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.bg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 20.0, bottom: 10),
            child: Container(

              // decoration: new BoxDecoration(
              //   borderRadius: new BorderRadius.circular(16.0),
              //   color: Colors.white,
              // ),
              child: Column(
                children: [
                  _ProfileAvtar(),
                  _Form(context),
                  SizedBox(
                    height: 20,
                  ),
                  _Buttons(context),
                ],
              ),
            ),
          ),
        ),
      ),

      // ),
    );
  }
}

Widget _ProfileAvtar() {
  return CircleAvatar(
    radius: 70,
    backgroundColor: Colors.orange,
    child: Text(
      "A",
      style: TextStyle(fontSize: 40),
    ),
  );
}

Widget _Form(BuildContext context) {
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          height: 300,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ThemeColors.baseThemeColor.withOpacity(.01),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FullName(),
                    SizedBox(height: 10,),
                    _BussCate(),
                    SizedBox(height: 10,),
                    _SubCate(),
                    SizedBox(height: 10,),
                    _SubSubCate(),
                    SizedBox(height: 10,),
                    _BussOwner(context),
                    SizedBox(height: 10,),
                    _YearOfEstablishment(),
                    SizedBox(height: 10,),
                    _EmployeesGstAnnualPin(context),
                    SizedBox(height: 10,),
                    _BussinessAddress(),
                    SizedBox(height: 10,),
                    _EmailNumber(context),
                  ],
                ),
              ),
            )
          ])));
}

Widget _FullName(){
  return Column(
    children: [
      Align(
          alignment: Alignment.topLeft, child: Text('Full Name')),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: false,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 18,
          height: 0.8,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 5.0),
          hintStyle: TextStyle(fontSize: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
                width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
                width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          border: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                  width: 0.8,
                  color: ThemeColors.textFieldBgColor)),
          hintText: "",
        ),
        validator: (value) {
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}
Widget _BussCate(){
  return Column(
    children: [
      Align(
          alignment: Alignment.topLeft,
          child: Text('Bussiness Category')),
      SizedBox(
        height: 5,
      ),
      DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintStyle: TextStyle(fontSize: FontSize.medium),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide:
            BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide:
            BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
          hintText: "Agriculture & Farming",
        ),
        // value: selectedValue,
        items: ['A', 'B', 'C']
            .map(
              (String item) => DropdownMenuItem<String>(
            child: Text(item),
            value: item,
          ),
        )
            .toList(),
        onChanged: (String? value) {
          // setState(() {
          //   selectedValue = value;
          // });
        },
      ),
      // TextFormField(
      //   obscureText: false,
      //   textAlign: TextAlign.start,
      //   keyboardType: TextInputType.text,
      //   style: TextStyle(
      //     fontSize: 18,
      //     height: 0.8,
      //   ),
      //   decoration: const InputDecoration(
      //     contentPadding: EdgeInsets.symmetric(
      //         vertical: 10.0, horizontal: 5.0),
      //     hintStyle: TextStyle(fontSize: 15),
      //     enabledBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
      //       borderSide: BorderSide(
      //           width: 0.8, color: ThemeColors.scaffoldBgColor),
      //     ),
      //     focusedBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
      //       borderSide: BorderSide(
      //           width: 0.8, color: ThemeColors.scaffoldBgColor),
      //     ),
      //     border: OutlineInputBorder(
      //         borderRadius:
      //         BorderRadius.all(Radius.circular(30.0)),
      //         borderSide: BorderSide(
      //             width: 0.8,
      //             color: ThemeColors.scaffoldBgColor)),
      //     hintText: "",
      //   ),
      //   validator: (value) {
      //     // profile.name = value!.trim();
      //   },
      //   onChanged: (value) {
      //     // profile.name = value;
      //   },
      // ),
    ],
  );
}
Widget _SubCate(){
  return Column(
    children: [
      Align(
        child: Text('Sub Category'),
        alignment: Alignment.topLeft,
      ),
      SizedBox(
        height: 5,
      ),
      DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintStyle: TextStyle(fontSize: FontSize.medium),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide:
            BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide:
            BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
          hintText: "Charity & Non Profit Organizations",
        ),
        // value: selectedValue,
        items: ['A', 'B', 'C']
            .map(
              (String item) => DropdownMenuItem<String>(
            child: Text(item),
            value: item,
          ),
        )
            .toList(),
        onChanged: (String? value) {
          // setState(() {
          //   selectedValue = value;
          // });
        },
      ),
      // TextFormField(
      //   obscureText: false,
      //   textAlign: TextAlign.start,
      //   keyboardType: TextInputType.text,
      //   style: TextStyle(
      //     fontSize: 18,
      //     height: 0.8,
      //   ),
      //   decoration: const InputDecoration(
      //     contentPadding: EdgeInsets.symmetric(
      //         vertical: 10.0, horizontal: 5.0),
      //     hintStyle: TextStyle(fontSize: 15),
      //     enabledBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
      //       borderSide: BorderSide(
      //           width: 0.8, color: ThemeColors.scaffoldBgColor),
      //     ),
      //     focusedBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
      //       borderSide: BorderSide(
      //           width: 0.8, color: ThemeColors.scaffoldBgColor),
      //     ),
      //     border: OutlineInputBorder(
      //         borderRadius:
      //         BorderRadius.all(Radius.circular(30.0)),
      //         borderSide: BorderSide(
      //             width: 0.8,
      //             color: ThemeColors.scaffoldBgColor)),
      //     hintText: "",
      //   ),
      //   validator: (value) {
      //     // profile.name = value!.trim();
      //   },
      //   onChanged: (value) {
      //     // profile.name = value;
      //   },
      // ),
    ],
  );
}
Widget _SubSubCate(){
  return Column(
    children: [
      Align(
        child: Text('Sub Sub Category'),
        alignment: Alignment.topLeft,
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: false,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 18,
          height: 0.8,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 5.0),
          hintStyle: TextStyle(fontSize: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
                width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
                width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          border: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                  width: 0.8,
                  color: ThemeColors.textFieldBgColor)),
          hintText: "",
        ),
        validator: (value) {
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}
Widget _YearOfEstablishment(){
  return Column(
    children: [
      Align(
        child: Text('Year of Establishment'),
        alignment: Alignment.topLeft,
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: false,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 18,
          height: 0.8,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 5.0),
          hintStyle: TextStyle(fontSize: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
                width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
                width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          border: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                  width: 0.8,
                  color: ThemeColors.textFieldBgColor)),
          hintText: "",
        ),
        validator: (value) {
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}
Widget _BussinessAddress(){
  return Column(
    children: [
      Align(
        child: Text('Business Address'),
        alignment: Alignment.topLeft,
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: false,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 18,
          height: 0.8,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 5.0),
          hintStyle: TextStyle(fontSize: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
                width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
                width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          border: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                  width: 0.8,
                  color: ThemeColors.textFieldBgColor)),
          hintText: "",
        ),
        validator: (value) {
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}


Widget _EmployeesGst(BuildContext context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Number of employees'),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          // controller: profile.addressController,
          obscureText: false,
          //initialValue: widget.userdata['name'],
          textAlign: TextAlign.start,
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontSize: 18,
            height: 0.8,
          ),
          decoration: const InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            hintStyle: TextStyle(fontSize: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide:
                BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
            hintText: "",
          ),
          validator: (value) {
            // profile.address = value!.trim();
          },
          onChanged: (value) {
            // profile.address = value;
          },
        ),
      ),
      SizedBox(height: 10,),
      Text('Gst number'),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          // controller: profile.addressController,
          obscureText: false,
          //initialValue: widget.userdata['name'],
          textAlign: TextAlign.start,
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontSize: 18,
            height: 0.8,
          ),
          decoration: const InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            hintStyle: TextStyle(fontSize: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide:
                BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
            hintText: "",
          ),
          validator: (value) {
            // profile.address = value!.trim();
          },
          onChanged: (value) {
            // profile.address = value;
          },
        ),
      ),

    ],
  );
}
Widget _AnnualPin(BuildContext context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Annual Turnover'),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          // controller: profile.addressController,
          obscureText: false,
          //initialValue: widget.userdata['name'],
          textAlign: TextAlign.start,
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontSize: 18,
            height: 0.8,
          ),
          decoration: const InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            hintStyle: TextStyle(fontSize: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide:
                BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
            hintText: "",
          ),
          validator: (value) {
            // profile.address = value!.trim();
          },
          onChanged: (value) {
            // profile.address = value;
          },
        ),
      ),
      SizedBox(height: 10,),
      Text('Pin Code'),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          // controller: profile.addressController,
          obscureText: false,
          //initialValue: widget.userdata['name'],
          textAlign: TextAlign.start,
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontSize: 18,
            height: 0.8,
          ),
          decoration: const InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            hintStyle: TextStyle(fontSize: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide:
                BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
            hintText: "",
          ),
          validator: (value) {
            // profile.address = value!.trim();
          },
          onChanged: (value) {
            // profile.address = value;
          },
        ),
      ),

    ],
  );
}

Widget _EmployeesGstAnnualPin(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _EmployeesGst(context),
      _AnnualPin(context),
    ],
  );
}

Widget _Bussiness(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Bussiness Name'),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          // controller: profile.addressController,
          obscureText: false,
          //initialValue: widget.userdata['name'],
          textAlign: TextAlign.start,
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontSize: 18,
            height: 0.8,
          ),
          decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            hintStyle: TextStyle(fontSize: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
                  BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
                  BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide:
                    BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
            hintText: "",
          ),
          validator: (value) {
            // profile.address = value!.trim();
          },
          onChanged: (value) {
            // profile.address = value;
          },
        ),
      ),

    ],
  );
}

Widget _Owner(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('OwnerShip Type'),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          // controller: profile.addressController,
          obscureText: false,
          //initialValue: widget.userdata['name'],
          textAlign: TextAlign.start,
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontSize: 18,
            height: 0.8,
          ),
          decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            hintStyle: TextStyle(fontSize: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
                  BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
                  BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide:
                    BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
            hintText: "",
          ),
          validator: (value) {
            // profile.address = value!.trim();
          },
          onChanged: (value) {
            // profile.address = value;
          },
        ),
      ),
    ],
  );
}

Widget _BussOwner(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _Bussiness(context),
      _Owner(context),
    ],
  );
}


Widget _EmailNumber(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _Email(context),
      _MobileNumber(context),
    ],
  );
}

Widget _MobileNumber(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Mobile Number'),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(

          // controller: profile.addressController,
          obscureText: false,
          //initialValue: widget.userdata['name'],
          textAlign: TextAlign.start,
          keyboardType: TextInputType.phone,
          style: TextStyle(
            fontSize: 18,
            height: 0.8,
          ),
          decoration: const InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            hintStyle: TextStyle(fontSize: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide:
                BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
            hintText: "",
          ),
          validator: (value) {
            // profile.address = value!.trim();
          },
          onChanged: (value) {
            // profile.address = value;
          },
        ),
      ),

    ],
  );
}
Widget _Email(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Email'),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          // controller: profile.addressController,
          obscureText: false,
          //initialValue: widget.userdata['name'],
          textAlign: TextAlign.start,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            fontSize: 18,
            height: 0.8,
          ),
          decoration: const InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            hintStyle: TextStyle(fontSize: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide:
              BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide:
                BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
            hintText: "",
          ),
          validator: (value) {
            // profile.address = value!.trim();
          },
          onChanged: (value) {
            // profile.address = value;
          },
        ),
      ),

    ],
  );
}


Widget _UploadButton(BuildContext context) {
  return InkWell(
    onTap: () {},
    child: DottedBorder(
      color: ThemeColors.textFieldHintColor,
      strokeWidth: 1,
      dashPattern: [10, 6],
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Icon(CupertinoIcons.arrow_down_doc), Text("Upload Logo")],
        ),
      ),
    ),
  );
}

Widget _UpdateButton(BuildContext context) {
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ThemeColors.drawerTextColor,
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
  );
}

Widget _Buttons(BuildContext context) {
  return Column(
    children: [
      _UploadButton(context),
      SizedBox(
        height: 30,
      ),
      _UpdateButton(context),
    ],
  );
}

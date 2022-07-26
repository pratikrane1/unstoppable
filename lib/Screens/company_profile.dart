import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant/theme_colors.dart';
import 'bottom_navbar.dart';

class CompanyProfileEditPage extends StatefulWidget {
  @override
  State<CompanyProfileEditPage> createState() => _CompanyProfileEditPageState();
}

class _CompanyProfileEditPageState extends State<CompanyProfileEditPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Company Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 20.0, bottom: 10),
          child: Container(
            child: Column(
              children: [
                _Form(context),
                SizedBox(height: 10,),
                _SaveButton(context),
              ],
            ),
          ),
        ),
      ),

      // ),
    );
  }
}

Widget _Form(BuildContext context) {
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          height: 600,
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
                    SizedBox(
                      height: 10,
                    ),
                    _ManagingDirector(),
                    SizedBox(
                      height: 10,
                    ),
                    _CeoCmoCfo(),
                    SizedBox(
                      height: 10,
                    ),
                    _CompanyName(),
                    SizedBox(
                      height: 10,
                    ),
                    _DesignationName(context),
                    SizedBox(
                      height: 10,
                    ),
                    _BusinessAddress(),
                    SizedBox(
                      height: 10,
                    ),
                    _CountryState(context),
                    SizedBox(
                      height: 10,
                    ),
                    _Gstin(),
                    SizedBox(
                      height: 10,
                    ),
                    _CompanyWebsite(),
                    SizedBox(
                      height: 10,
                    ),
                    _MobileNumber(),
                    SizedBox(
                      height: 10,
                    ),
                    _AlternateNumber(),
                    SizedBox(
                      height: 10,
                    ),
                    _PrimaryEmail(),
                    SizedBox(
                      height: 10,
                    ),
                    _AlternateEmail(),
                    SizedBox(
                      height: 10,
                    ),
                    _LandlineNumber(),
                    SizedBox(
                      height: 10,
                    ),
                    _YearOfEstablishment(),
                    SizedBox(
                      height: 10,
                    ),
                    _BussNumOwnAnnual(context),
                    SizedBox(
                      height: 10,
                    ),
                    _PanNo(),
                    SizedBox(
                      height: 10,
                    ),
                    _TanNo(),
                    SizedBox(
                      height: 10,
                    ),
                    _CinNo(),
                    SizedBox(
                      height: 10,
                    ),
                    _DFGT(),
                  ],
                ),
              ),
            )
          ])));
}

Widget _FullName() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('Name')),
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}

Widget _ManagingDirector() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('Managing Director')),
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}

Widget _CeoCmoCfo() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('CEO/CMO/CFO')),
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}

Widget _CompanyName() {
  return Column(
    children: [
      Align(
          alignment: Alignment.topLeft,
          child: Text('Company Name (as per Reg. documents)')),
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}

Widget _OperatorDesignation(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Operator Designation'),
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

Widget _OperatorName(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Operator Name'),
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

Widget _DesignationName(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _OperatorDesignation(context),
      _OperatorName(context),
    ],
  );
}

Widget _BusinessAddress() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('Business Address')),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: false,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        maxLines: 4,
        style: TextStyle(
          fontSize: 18,
          height: 0.8,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          hintStyle: TextStyle(fontSize: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide:
                BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide:
                BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide:
                  BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
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

Widget _CountryCity(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Country'),
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
      SizedBox(
        height: 10,
      ),
      Text('City'),
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

Widget _StateZip(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('State'),
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
      SizedBox(
        height: 10,
      ),
      Text('Zip Code'),
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

Widget _CountryState(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _CountryCity(context),
      _StateZip(context),
    ],
  );
}

Widget _Gstin() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('GSTIN')),
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}

Widget _CompanyWebsite() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('Company Website')),
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}

Widget _MobileNumber() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('Mobile Number')),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: false,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.phone,
        style: TextStyle(
          fontSize: 18,
          height: 0.8,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}

Widget _AlternateNumber() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('Alternate Number')),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: false,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.phone,
        style: TextStyle(
          fontSize: 18,
          height: 0.8,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}

Widget _PrimaryEmail() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('Primary Email')),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: false,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 18,
          height: 0.8,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}

Widget _AlternateEmail() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('Alternate Email')),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: false,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 18,
          height: 0.8,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}

Widget _LandlineNumber() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('Landline Number')),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: false,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.phone,
        style: TextStyle(
          fontSize: 18,
          height: 0.8,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}

Widget _YearOfEstablishment() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('Year of Establishment')),
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}

Widget _BussinessNumber(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Business Type'),
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
      SizedBox(
        height: 10,
      ),
      Text('Number of Employees'),
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

Widget _OwnershipAnnual(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Ownership Type'),
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
      SizedBox(
        height: 10,
      ),
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
    ],
  );
}

Widget _BussNumOwnAnnual(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _BussinessNumber(context),
      _OwnershipAnnual(context),
    ],
  );
}

Widget _PanNo() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('Pan No')),
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}
Widget _TanNo() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('Tan No')),
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}
Widget _CinNo() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('CIN No')),
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}
Widget _DFGT() {
  return Column(
    children: [
      Align(alignment: Alignment.topLeft, child: Text('DFGT/IE code')),
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
          // profile.name = value!.trim();
        },
        onChanged: (value) {
          // profile.name = value;
        },
      ),
    ],
  );
}

Widget _SaveButton(BuildContext context) {
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
            'Save',
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

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unstoppable/constant/font_size.dart';
import 'package:unstoppable/constant/theme_colors.dart';

class AddProductScreen extends StatefulWidget {
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: AddProductScreen(),
      ),
    );
  }
}

class City {
  int? cityId;
  String? cityName;
  City({this.cityId, this.cityName});
}

class CountryState {
  int? stateId;
  String? stateName;
  List<City>? cities;
  CountryState({this.stateId, this.stateName, this.cities});
}

Future AddProduct(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
          topLeft:  Radius.circular(35.0),
          topRight:  Radius.circular(35.0))),
      context: context,
      builder: (BuildContext context) {
        return Wrap(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.80,
            // decoration:  BoxDecoration(
            //     // color: forDialog ? Color(0xFF737373) : Colors.white,
            //     borderRadius:  BorderRadius.only(
            //         topLeft:  Radius.circular(35.0),
            //         topRight:  Radius.circular(35.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Heading(context),
                  _ListView(context),
                  SizedBox(
                    height: 10,
                  ),
                  _Buttons(context)
                ],
              ),
            ),
          )
        ]);
      });
}

Widget _ListView(BuildContext context){
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,

    child: Container(
      height: 400,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _CategoryName(),
                SizedBox(
                  height: 10,
                ),
                _SubCategory(),
                SizedBox(
                  height: 10,
                ),
                _SubSubCat(),
                SizedBox(
                  height: 10,
                ),
                _productNameText(),
                SizedBox(
                  height: 10,
                ),
                _ProductPrice(context),
                SizedBox(
                  height: 10,
                ),
                _OwnerNumber(),
                SizedBox(
                  height: 10,
                ),
                _PinCode(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget Heading(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(11.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Add Products",
          style: TextStyle(
              fontSize: FontSize.xxLarge, fontWeight: FontWeight.bold),
        ),
        InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.clear,color: ThemeColors.drawerTextColor,))
      ],
    ),
  );
}

Widget _CategoryName() {
  String? selectedValue = '';

  return Column(
    children: [
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
          hintText: "Category Name",
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
    ],
  );
}

Widget _SubCategory() {
  return Column(
    children: [
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
          hintText: "Sub Category",
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
    ],
  );
}

Widget _SubSubCat() {
  return Column(
    children: [
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
          hintText: "Sub Sub Category",
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
    ],
  );
}

Widget _productNameText() {
  return Column(
    children: [

      TextFormField(
        obscureText: false,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 18,
          height: 0.8,
        ),
        decoration: const InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
          hintText: "Product Name",
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

Widget _PinCode() {
  return Column(
    children: [

      TextFormField(
        obscureText: false,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 18,
          height: 0.8,
        ),
        decoration: const InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
          hintText: "Pin Code",
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

Widget _ProductName(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

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
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
            hintText: "Product Name",
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

Widget _Price(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
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
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
            hintText: "Price",
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

Widget _ProductPrice(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _ProductName(context),
      _Price(context),
    ],
  );
}

Widget _OwnerNumber() {
  return Column(
    children: [
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
          hintText: "Owner Number",
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
          children: [
            Icon(CupertinoIcons.arrow_down_doc,color: ThemeColors.textFieldHintColor,),
            Text("Browse & Upload", style: TextStyle(fontSize: FontSize.medium,color: ThemeColors.textFieldHintColor),)
          ],
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

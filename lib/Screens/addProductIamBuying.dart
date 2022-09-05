
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unstoppable/Blocs/addProductForm/addProductForm_event.dart';
import 'package:unstoppable/Blocs/myTools/bloc.dart';
import 'package:unstoppable/Blocs/products/product_bloc.dart';
import 'package:unstoppable/Blocs/products/product_state.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/subCategory_model.dart';
import 'package:unstoppable/NetworkFunction/fetchSubCategory.dart';
import 'package:unstoppable/Screens/image_file.dart';
import 'package:unstoppable/Screens/product_I_am_buying.dart';
import 'package:unstoppable/Screens/Products/unstoppableProducts.dart';
import 'package:unstoppable/constant/font_size.dart';
import 'package:unstoppable/constant/theme_colors.dart';
import 'package:image_picker/image_picker.dart';
import '../Blocs/addProductForm/addProductForm_bloc.dart';
import '../Blocs/addProductForm/addProductForm_state.dart';
import '../Blocs/products/product_event.dart';
import '../Models/category_model.dart';
import '../Models/productIamBuying_model.dart';
import '../Models/subSubCategory_model.dart';
import '../NetworkFunction/fetchCategory.dart';
import '../NetworkFunction/fetchSubSubCategory.dart';
import '../config/image.dart';
import 'image_upload.dart';

class AddProductIamBuyingScreen extends StatefulWidget {


  @override
  State<AddProductIamBuyingScreen> createState() => _AddProductIamBuyingScreenState();
}

class _AddProductIamBuyingScreenState extends State<AddProductIamBuyingScreen> {
  MytoolsBloc? addProductBuyingFormBloc;
  List<CategoryModel> addProductFormCategoryList = [];
  CategoryModel? categoryModelselected;
  SubSubCategoryModel? subsubcategoryModelselected;
  SubCategoryModel? subcategoryModelselected;
  String? _selectedLocation;
  String? selectedValue;
  final _textProductNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool flagLoading=false;




  void initState() {
    // TODO: implement initState
    super.initState();
    addProductBuyingFormBloc = BlocProvider.of<MytoolsBloc>(context);

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textProductNameController.clear();

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top:5.0,right: 8,left: 8,bottom: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Place new order",
                  style: TextStyle(
                      fontSize: FontSize.xxLarge,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.clear,
                      color: ThemeColors.drawerTextColor,
                    ))
              ],
            ),
          ),
          Container(
              child: Form(
                  key: _formKey,
                  child:
                  SingleChildScrollView(
                    child: Column(
                        children: <Widget>[
                          //for category
                          Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
                              //to hide underline
                              child: FutureBuilder<List<CategoryModel>>(
                                  future: fetchCategory(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<CategoryModel>> snapshot) {
                                    if (!snapshot.hasData) return Container();

                                    return DropdownButtonHideUnderline(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            // color: Theme.of(context).dividerColor,
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(20.0),
                                              border: Border.all(
                                                  color: ThemeColors.textFieldBgColor)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.0, top: 0.0, right: 5.0, bottom: 0.0),
                                            child:
                                            //updated on 15/06/2021 to change background colour of dropdownbutton
                                            new Theme(
                                                data: Theme.of(context)
                                                    .copyWith(canvasColor: Colors.white),
                                                child: DropdownButton(
                                                    items: snapshot.data!
                                                        .map((category) =>
                                                        DropdownMenuItem<CategoryModel>(
                                                          value: category,
                                                          child: Text(
                                                            category.catName.toString(),
                                                            style: TextStyle(
                                                                color: Colors.black),
                                                          ),
                                                        ))
                                                        .toList(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w600),
                                                    isExpanded: true,
                                                    hint: Text('Select Category',
                                                        style: TextStyle(
                                                            color: Color(0xFF3F4141))),
                                                    value: categoryModelselected == null
                                                        ? categoryModelselected
                                                        : snapshot.data!
                                                        .where((i) =>
                                                    i.catName ==
                                                        categoryModelselected!
                                                            .catName)
                                                        .first as CategoryModel,
                                                    onChanged: (CategoryModel? category) {
                                                      subcategoryModelselected=null;
                                                      subsubcategoryModelselected=null;
                                                      setState(() {
                                                        categoryModelselected = category;
                                                      });
                                                    })),
                                          ),
                                        ));
                                  })),
                          //for subcategory
                          Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
                              //to hide underline
                              child: FutureBuilder<List<SubCategoryModel>>(
                                  future: fetchSubCategory(categoryModelselected!=null?categoryModelselected!.catId.toString():""),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<SubCategoryModel>> snapshot) {
                                    if (!snapshot.hasData) return Container();

                                    return DropdownButtonHideUnderline(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            // color: Theme.of(context).dividerColor,
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(20.0),
                                              border: Border.all(
                                                  color: ThemeColors.textFieldBgColor)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.0, top: 0.0, right: 5.0, bottom: 0.0),
                                            child:
                                            //updated on 15/06/2021 to change background colour of dropdownbutton
                                            Theme(
                                                data: Theme.of(context)
                                                    .copyWith(canvasColor: Colors.white),
                                                child: DropdownButton(
                                                    items: snapshot.data!
                                                        .map((subcategory) =>
                                                        DropdownMenuItem<SubCategoryModel>(
                                                          value: subcategory,
                                                          child: Text(
                                                            subcategory.subCatName.toString(),
                                                            style: TextStyle(
                                                                color: Colors.black),
                                                          ),
                                                        ))
                                                        .toList(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w600),
                                                    isExpanded: true,
                                                    hint: Text('Select Sub Category',
                                                        style: TextStyle(
                                                            color: Color(0xFF3F4141))),
                                                    value: subcategoryModelselected == null
                                                        ? subcategoryModelselected
                                                        : snapshot.data!
                                                        .where((i) =>
                                                    i.subCatName ==
                                                        subcategoryModelselected!
                                                            .subCatName)
                                                        .first as SubCategoryModel,
                                                    onChanged: (SubCategoryModel? subCategory) {
                                                      subsubcategoryModelselected=null;
                                                      setState(() {
                                                        subcategoryModelselected = subCategory;
                                                      });
                                                    })),
                                          ),
                                        ));
                                  })),

                          //for subsubcategory
                          Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
                              //to hide underline
                              child: FutureBuilder<List<SubSubCategoryModel>>(
                                  future: fetchSubSubCategory(subcategoryModelselected!=null?subcategoryModelselected!.subcatId.toString():""),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<SubSubCategoryModel>> snapshot) {
                                    if (!snapshot.hasData) return Container();

                                    return DropdownButtonHideUnderline(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            // color: Theme.of(context).dividerColor,
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(20.0),
                                              border: Border.all(
                                                  color: ThemeColors.textFieldBgColor)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.0, top: 0.0, right: 5.0, bottom: 0.0),
                                            child:
                                            //updated on 15/06/2021 to change background colour of dropdownbutton
                                            Theme(
                                                data: Theme.of(context)
                                                    .copyWith(canvasColor: Colors.white),
                                                child: DropdownButton(
                                                    items: snapshot.data!
                                                        .map((subsubcategory) =>
                                                        DropdownMenuItem<SubSubCategoryModel>(
                                                          value: subsubcategory,
                                                          child: Text(
                                                            subsubcategory.ssCatName.toString(),
                                                            style: TextStyle(
                                                                color: Colors.black),
                                                          ),
                                                        ))
                                                        .toList(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w600),
                                                    isExpanded: true,
                                                    hint: Text('Select Sub sub Category',
                                                        style: TextStyle(
                                                            color: Color(0xFF3F4141))),
                                                    value: subsubcategoryModelselected == null
                                                        ? subsubcategoryModelselected
                                                        : snapshot.data!
                                                        .where((i) =>
                                                    i.ssCatName ==
                                                        subsubcategoryModelselected!
                                                            .ssCatName)
                                                        .first as SubSubCategoryModel,
                                                    onChanged: (SubSubCategoryModel? subsubCategory) {

                                                      setState(() {
                                                        subsubcategoryModelselected = subsubCategory;
                                                      });
                                                    })),
                                          ),
                                        ));
                                  })),

                          // for product name
                          Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
                            child: SizedBox(
                             // width: MediaQuery.of(context).size.width * 0.4,
                              width: MediaQuery.of(context).size.width,
                              child: TextFormField(
                                obscureText: false,
                                controller: _textProductNameController,
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
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    borderSide:
                                    BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    borderSide:
                                    BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      borderSide:
                                      BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
                                  hintText: "Product Name",
                                ),
                                validator: (value){
                                  if(value==null || value.isEmpty){
                                    return 'Please enter Product Name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    if ( _formKey.currentState!.validate()) {}
                                  });
                                },
                              ),
                            ),
                          ),

                          BlocBuilder<MytoolsBloc,MytoolsState>(builder: (context,addProdBuy){
                            return BlocListener<MytoolsBloc,MytoolsState>(listener: (context,state){
                              if(state is AddProductBuyingSuccess){
                                Fluttertoast.showToast(msg: "Place order successfully");
                                flagLoading=true;
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProductIamBuying()));
                              }
                              if(state is ProductIamBuyingLoading){
                                flagLoading=true;

                              }
                              if(state is AddProductBuyingLoadFail){
                                flagLoading=false;

                                Fluttertoast.showToast(msg: state.message.toString());
                              }

                              },
                                child:
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
                                  child: Center(
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
                                            if(categoryModelselected==null){
                                              Fluttertoast.showToast(msg: "Please select category");
                                            }else if(subcategoryModelselected==null){
                                              Fluttertoast.showToast(msg: "Please select sub category");
                                            }else if(subsubcategoryModelselected==null){
                                              Fluttertoast.showToast(msg: "Please select sub sub category");
                                            }else if(_formKey.currentState!.validate())
                                            {

                                                addProductBuyingFormBloc!.add(AddProductBuying(
                                                    catId: categoryModelselected!.catId.toString(),
                                                    subCatId: subcategoryModelselected!.subcatId.toString(),
                                                    sscatId: subsubcategoryModelselected!.sscatId.toString(),
                                                    prodName: _textProductNameController.text,
                                                    ));
                                              }

                                          },
                                          child: Text(
                                            'Place order',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            );
                          })

                        ]),
                  ))),


        ],
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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0))),
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

Widget _ListView(BuildContext context) {
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
                _CategoryName(context),
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
//

////

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
            child: Icon(
              Icons.clear,
              color: ThemeColors.drawerTextColor,
            ))
      ],
    ),
  );
}

Widget _CategoryName(BuildContext context) {
  String? selectedValue = '';

  // other way if we already load the options data we just create the dropdown menu
  // we just populate the dropdown menu options with _categoryList value

  return Column(
    children: [
      DropdownButtonFormField<String>(
        isExpanded: true,
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
        value: selectedValue,
        items: ['A', 'B', 'C']
            .map(
              (String item) => DropdownMenuItem<String>(
            child: Text(item),
            value: item,
          ),
        )
            .toList(),
        onChanged: (value) {
          selectedValue = value;
          // addProductFormCategoryList();
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
          fontSize: 14,
          // height: 0.8,
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
            fontSize: 14,
            // height: 0.8,
          ),
          decoration: const InputDecoration(
            // contentPadding:
            //     EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            hintStyle: TextStyle(fontSize: 145),
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
                borderSide: BorderSide(
                    width: 0.8, color: ThemeColors.textFieldBgColor)),
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
            fontSize: 14,
            // height: 0.8,
          ),
          decoration: const InputDecoration(
            // contentPadding:
            //     EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            hintStyle: TextStyle(fontSize: 14),
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
                borderSide: BorderSide(
                    width: 0.8, color: ThemeColors.textFieldBgColor)),
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
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
            Icon(
              CupertinoIcons.arrow_down_doc,
              color: ThemeColors.textFieldHintColor,
            ),
            Text(
              "Browse & Upload",
              style: TextStyle(
                  fontSize: FontSize.medium,
                  color: ThemeColors.textFieldHintColor),
            )
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

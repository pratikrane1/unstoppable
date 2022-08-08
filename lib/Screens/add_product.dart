
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:unstoppable/Models/subCategory_model.dart';
import 'package:unstoppable/NetworkFunction/fetchSubCategory.dart';
import 'package:unstoppable/Screens/image_file.dart';
import 'package:unstoppable/constant/font_size.dart';
import 'package:unstoppable/constant/theme_colors.dart';
import 'package:image_picker/image_picker.dart';
import '../Blocs/addProductForm/addProductForm_bloc.dart';
import '../Blocs/addProductForm/addProductForm_state.dart';
import '../Models/category_model.dart';
import '../Models/subSubCategory_model.dart';
import '../NetworkFunction/fetchCategory.dart';
import '../NetworkFunction/fetchSubSubCategory.dart';
import '../config/image.dart';
import 'image_upload.dart';

class AddProductScreen extends StatefulWidget {
  int? status;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  AddProductFormBloc? addProductFormCategoryListBloc;
  List<CategoryModel> addProductFormCategoryList = [];
  CategoryModel? categoryModelselected;
  SubSubCategoryModel? subsubcategoryModelselected;
  SubCategoryModel? subcategoryModelselected;
  String? _selectedLocation;
  String? selectedValue;
  final _textProductNameController = TextEditingController();

  final _textPriceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _image;
  ImageFile? imageFile;
  final picker = ImagePicker();

//For Display uploaded image
  Widget _buildAvatar() {
    if (_image!=null) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
            ThemeColors.textFieldBgColor,  // red as border color
          ),
          color:
          Colors.white,

        ),

        child:
        ClipRRect(
          child: Image.file(
            _image!,
            fit: BoxFit.fill,
          ),

          // borderRadius: BorderRadius.circular(20),

        ),

      );
    }
    //updated on 30/11/2020
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 120,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:
            ThemeColors.textFieldBgColor,  // red as border color
          ),
          color:
          Colors.white,

        ),
        child:
        Container(
          child: Image.asset(Images.splash,
              fit: BoxFit.fill,
              height: 120,
              width: MediaQuery.of(context).size.width,),
        ),



    );
  }

  //method to open gallery
    _openGallery(BuildContext context) async {

      final image = await picker.getImage(source: ImageSource.gallery,imageQuality: 25);
      imageFile=new ImageFile();
      if (image != null) {

        _cropImage(image);

      }
    }

    // For crop image

  Future<Null> _cropImage(PickedFile imageCropped) async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageCropped.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          // CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio4x3,
        ]
            : [
          // CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio4x3,
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Theme.of(context).primaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {

      setState(() {
        // mImageFile.image = croppedFile;
        // print(mImageFile.image.path);
        // state = AppState.cropped;
        _image = croppedFile;
        imageFile!.imagePath=_image!.path;
      });
      // Navigator.pop(context);
    }
  }


  void initState() {
    // TODO: implement initState
    super.initState();
    // addProductFormCategoryListBloc = BlocProvider.of<AddProductFormBloc>(context);
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
                  "Add Products",
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
                                hint: Text('Select Sub Category',
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

      // for product name and price
      Padding(
        padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //For productName
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
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
                  // if(value==null || value.isEmpty){
                  //   return 'Please enter Product Name';
                  // }
                  // return null;
                },
                onChanged: (value) {
                  setState(() {
                    if ( _formKey.currentState!.validate()) {}
                  });
                },
              ),
            ),

            //For Price
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextFormField(
                controller: _textPriceController,
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
                      borderSide: BorderSide(
                          width: 0.8, color: ThemeColors.textFieldBgColor)),
                  hintText: "Price",
                ),
                validator: (value){
                  // if(value==null || value.isEmpty){
                  //   return 'Please enter Price';
                  // }
                  // return null;
                },
                onChanged: (value) {
                  setState(() {
                    if ( _formKey.currentState!.validate()) {}
                  });
                },
              ),
            ),
          ],
        ),
      ),

      // for Owner Number
      Padding(
        padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
        child: Container(
          child: TextFormField(
            obscureText: false,
            textAlign: TextAlign.start,
            keyboardType: TextInputType.phone,
            maxLines: 3,
            style: TextStyle(
              fontSize: 18,
              height: 0.8,
            ),
            decoration: const InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
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
            validator: (value){
              // Pattern pattern =
              //     r'(^(?:[+0]9)?[0-9]{10,12}$)';
              // RegExp regex =
              // new RegExp(pattern.toString());
              //
              // if(value==null || value.isEmpty){
              //   return 'Please enter Mobile Number';
              // }else if(!regex.hasMatch(value)){
              //   return 'Please enter valid Mobile Number';
              // }
              // return null;
            },
            onChanged: (text) {
              setState(() {
                if ( _formKey.currentState!.validate()) {}
              });
            },
          ),
        ),
      ),

      // For Pincode
      Padding(
        padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
        child: Container(
          child: TextFormField(
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
              hintText: "Pin Code",
            ),
            validator: (value){
              // Pattern pattern =
              //     r'(^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$)';
              // RegExp regex =
              // new RegExp(pattern.toString());
              //
              // if(value==null || value.isEmpty){
              //   return 'Please enter Pincode';
              // }else if(!regex.hasMatch(value)){
              //   return 'Please enter valid Pincode';
              // }
              // return null;
            },
            onChanged: (text) {
              setState(() {
                if ( _formKey.currentState!.validate()) {}
              });
            },
          ),
        ),
      ),

      // For Upload image
        Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
          child: InkWell(
                          onTap: () {
                            _openGallery(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MyImagePicker()));
                          },
                          child: DottedBorder(
                            color: ThemeColors.textFieldHintColor,
                            strokeWidth: 1,
                            dashPattern: [10, 6],
                            child: Container(
                              height: _image==null?120:150,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: _image==null?
                              Column(
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
                              ):
                              _buildAvatar()

                            ),
                          ),
                        ),
        ),
       // For Display image
       //  _buildAvatar(),

        // For Update button
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
        ),
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

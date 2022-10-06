
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
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/subCategory_model.dart';
import 'package:unstoppable/NetworkFunction/fetchSubCategory.dart';
import 'package:unstoppable/Screens/image_file.dart';
import 'package:unstoppable/Screens/Products/unstoppableProducts.dart';
import 'package:unstoppable/constant/font_size.dart';
import 'package:unstoppable/constant/theme_colors.dart';
import 'package:image_picker/image_picker.dart';
import '../../Blocs/addProductForm/addProductForm_bloc.dart';
import '../../Blocs/addProductForm/addProductForm_state.dart';
import '../../Config/image.dart';
import '../../Models/category_model.dart';
import '../../Models/subSubCategory_model.dart';
import '../../NetworkFunction/fetchCategory.dart';
import '../../NetworkFunction/fetchSubSubCategory.dart';


class AddProductScreen extends StatefulWidget {
  int? status;
  ProductDetail productDetail;
  AddProductScreen({Key? key,required this.productDetail}):super(key:key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  AddProductFormBloc? addProductFormBloc;
  List<CategoryModel> addProductFormCategoryList = [];
  CategoryModel? categoryModelselected;
  SubSubCategoryModel? subsubcategoryModelselected;
  SubCategoryModel? subcategoryModelselected;
  String? _selectedLocation;
  String? selectedValue;
  final _textProductNameController = TextEditingController();
  final _textDescriController = TextEditingController();
  final _textPriceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _image;
  ImageFile? imageFile;
  final picker = ImagePicker();
  bool flagLoading=false;
  String flagImage="";


  Widget _buildAvatar() {
    if (_image!=null&&imageFile!=null) {
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
    else{
      return CachedNetworkImage(
        imageUrl: imageFile!.imagePath.toString(),
        imageBuilder: (context, imageProvider) {
          return Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle
              ,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: Theme
                .of(context)
                .hoverColor,
            highlightColor: Theme
                .of(context)
                .highlightColor,
            enabled: true,
            child: Container(
              width: 110,
              height: 110,
              // decoration: BoxDecoration(
              //   shape: BoxShape.rectangle,

              //   color: Colors.white,
              // ),
            ),
          );
        },
        errorWidget: (context, url, error) {
          // return
          //   Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //
          //     Icon(
          //       CupertinoIcons.arrow_down_doc,
          //       color: ThemeColors.textFieldHintColor,
          //     ),
          //     Text(
          //       "Browse & Upload",
          //       style: TextStyle(
          //           fontSize: FontSize.medium,
          //           color: ThemeColors.textFieldHintColor),
          //     )
          //   ],
          // );
          return Shimmer.fromColors(
            baseColor: Theme
                .of(context)
                .hoverColor,
            highlightColor: Theme
                .of(context)
                .highlightColor,
            enabled: true,
            child: Container(
              width: 110,
              height: 110,
              // decoration: BoxDecoration(
              //   shape: BoxShape.rectangle,
              //   color: Colors.white,
              // ),
            child: Icon(Icons.error),

            ),
          );
        },
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
    imageFile=new ImageFile();
    addProductFormBloc = BlocProvider.of<AddProductFormBloc>(context);

    //for update product
    if(widget.productDetail.productId!=null){

      getSubCategoryByCategoryData();
      getSubSubCategoryBySubCatData();
      setData();
    }
  }

  void getSubCategoryByCategoryData()
  {
    CategoryModel categoryModel=CategoryModel();
    categoryModel.catId=widget.productDetail.catId;
    categoryModel.catName=widget.productDetail.categoryName;
    categoryModelselected=categoryModel;

  }

  void getSubSubCategoryBySubCatData()
  {
    SubCategoryModel subCategoryModel=SubCategoryModel();
    subCategoryModel.subcatId=widget.productDetail.subCatId;
    subCategoryModel.subCatName=widget.productDetail.subCategoryName;
    subcategoryModelselected=subCategoryModel;

    SubSubCategoryModel subsubCategoryModel=SubSubCategoryModel();
    subsubCategoryModel.ssCatName=widget.productDetail.ssCategoryName;
    subsubcategoryModelselected=subsubCategoryModel;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textProductNameController.clear();
    _textPriceController.clear();
    _textDescriController.clear();
  }
  void setData(){
    setState((){
      // //category model
      // CategoryModel categoryModel=CategoryModel();
      // categoryModel.catName=widget.productDetail.categoryName;
      // categoryModelselected=categoryModel;



      _textProductNameController.text=widget.productDetail.productName.toString();
      _textPriceController.text=widget.productDetail.price.toString();
      _textDescriController.text=widget.productDetail.description.toString();
      if(widget.productDetail.productImg!=""){
        flagImage="1";//from edit
        imageFile!.imagePath=widget.productDetail.productImg;
      }

    });
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
                                                      subcategoryModelselected=null;
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

                                //For Price
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    controller: _textPriceController,
                                    obscureText: false,
                                    //initialValue: widget.userdata['name'],
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.number,
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
                                      if(value==null || value.isEmpty){
                                        return 'Please enter Price';
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
                              ],
                            ),
                          ),

                          // for description
                          Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Container(
                                height: 100,
                                child: TextFormField(
                                  controller: _textDescriController,
                                  obscureText: false,
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.text,
                                  maxLines: 10,
                                  style: TextStyle(
                                    fontSize: 14,
                                    // height: 0.8,
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
                                    hintText: "Description",
                                  ),
                                  validator: (value){

                                    if(value==null || value.isEmpty){
                                      return 'Please enter description';
                                    }
                                    return null;
                                  },
                                  onChanged: (text) {
                                    setState(() {
                                      if ( _formKey.currentState!.validate()) {}
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),

                          // For Pincode
                          // Padding(
                          //   padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
                          //   child: Container(
                          //     child: TextFormField(
                          //       obscureText: false,
                          //       textAlign: TextAlign.start,
                          //       keyboardType: TextInputType.text,
                          //       style: TextStyle(
                          //         fontSize: 18,
                          //         height: 0.8,
                          //       ),
                          //       decoration: const InputDecoration(
                          //         contentPadding:
                          //         EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          //         hintStyle: TextStyle(fontSize: 15),
                          //         enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          //           borderSide:
                          //           BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
                          //         ),
                          //         focusedBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          //           borderSide:
                          //           BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
                          //         ),
                          //         border: OutlineInputBorder(
                          //             borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          //             borderSide:
                          //             BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
                          //         hintText: "Pin Code",
                          //       ),
                          //       validator: (value){
                          //         Pattern pattern =
                          //             r'(^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$)';
                          //         RegExp regex =
                          //         new RegExp(pattern.toString());
                          //
                          //         if(value==null || value.isEmpty){
                          //           return 'Please enter Pincode';
                          //         }else if(!regex.hasMatch(value)){
                          //           return 'Please enter valid Pincode';
                          //         }
                          //         return null;
                          //       },
                          //       onChanged: (text) {
                          //         setState(() {
                          //           if ( _formKey.currentState!.validate()) {}
                          //         });
                          //       },
                          //     ),
                          //   ),
                          // ),

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
                                    height: _image==null?100:110,
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    child: imageFile!.imagePath==null?
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
                          BlocBuilder<AddProductFormBloc,AddProductFormState>(builder: (context,addProd){
                            return BlocListener<AddProductFormBloc,AddProductFormState>(listener: (context,state){
                              if(state is AddProductSuccess){
                                Fluttertoast.showToast(msg: state.message.toString());
                                flagLoading=false;
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UnstoppableProducts()));
                              }
                              if(state is AddProductLoading){
                                flagLoading=true;

                              }
                              if(state is AddProductFail){
                                flagLoading=false;

                                Fluttertoast.showToast(msg: state.message.toString());
                              }
                              if(state is UpdateProductSuccess){
                                flagLoading=false;

                                Fluttertoast.showToast(msg: state.message.toString());
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UnstoppableProducts()));

                              }
                              if(state is UpdateProductLoading){
                                flagLoading=true;
                              }
                              if(state is UpdateProductFail){
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
                                            //if(_image==null)
                                           if(_image==null&&imageFile==null){
                                              Fluttertoast.showToast(msg: "Please select image");
                                            } else if(categoryModelselected==null){
                                              Fluttertoast.showToast(msg: "Please select category");
                                            }else if(subcategoryModelselected==null){
                                              Fluttertoast.showToast(msg: "Please select sub category");
                                            }else if(subsubcategoryModelselected==null){
                                              Fluttertoast.showToast(msg: "Please select sub sub category");
                                            }else if(_formKey.currentState!.validate())
                                            {
                                              if(widget.productDetail.productId != null)
                                              { //add api
                                                addProductFormBloc!.add(UpdateProduct(
                                                  catid: categoryModelselected!.catId.toString(),
                                                  subcatid: subcategoryModelselected!.subcatId.toString(),
                                                  sscatid: subsubcategoryModelselected!.sscatId.toString(),
                                                  prodname: _textProductNameController.text,
                                                  description: _textDescriController.text,
                                                  image: imageFile!,
                                                  price: _textPriceController.text,
                                                  imgFlag:flagImage,
                                                  productid: widget.productDetail.productId.toString(),));

                                              }
                                              else{
                                                addProductFormBloc!.add(AddProductForm(
                                                    catId: categoryModelselected!.catId.toString(),
                                                    subCatId: subcategoryModelselected!.subcatId.toString(),
                                                    sscatId: subsubcategoryModelselected!.sscatId.toString(),
                                                    prodName: _textProductNameController.text,
                                                    desc: _textDescriController.text,
                                                    image: imageFile!,
                                                    price: _textPriceController.text));
                                              }
                                              // addProductFormBloc!.add(AddProductForm(
                                              //     catId: categoryModelselected!.catId.toString(),
                                              //     subCatId: subcategoryModelselected!.subcatId.toString(),
                                              //     sscatId: subsubcategoryModelselected!.sscatId.toString(),
                                              //     prodName: _textProductNameController.text,
                                              //     desc: _textDescriController.text,
                                              //     image: imageFile!,
                                              //     price: _textPriceController.text)
                                              // );
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

// //// Add Product and Update Not Work 2nd code
//
// import 'dart:io';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:unstoppable/Blocs/addProductForm/addProductForm_event.dart';
// import 'package:unstoppable/Blocs/products/product_bloc.dart';
// import 'package:unstoppable/Blocs/products/product_state.dart';
// import 'package:unstoppable/Models/product_detail_model.dart';
// import 'package:unstoppable/Models/subCategory_model.dart';
// import 'package:unstoppable/NetworkFunction/fetchSubCategory.dart';
// import 'package:unstoppable/Screens/image_file.dart';
// import 'package:unstoppable/Screens/unstoppableProducts.dart';
// import 'package:unstoppable/constant/font_size.dart';
// import 'package:unstoppable/constant/theme_colors.dart';
// import 'package:image_picker/image_picker.dart';
// import '../Blocs/addProductForm/addProductForm_bloc.dart';
// import '../Blocs/addProductForm/addProductForm_state.dart';
// import '../Blocs/products/product_event.dart';
// import '../Models/category_model.dart';
// import '../Models/subSubCategory_model.dart';
// import '../NetworkFunction/fetchCategory.dart';
// import '../NetworkFunction/fetchSubSubCategory.dart';
// import '../config/image.dart';
// import 'image_upload.dart';
//
// class AddProductScreen extends StatefulWidget {
//   int? status;
//   ProductDetail productDetail;
//   AddProductScreen({Key? key,required this.productDetail}):super(key:key);
//
//   @override
//   State<AddProductScreen> createState() => _AddProductScreenState();
// }
//
// class _AddProductScreenState extends State<AddProductScreen> {
//   AddProductFormBloc? addProductFormBloc;
//   List<CategoryModel> addProductFormCategoryList = [];
//   CategoryModel? categoryModelselected;
//   SubSubCategoryModel? subsubcategoryModelselected;
//   SubCategoryModel? subcategoryModelselected;
//   String? _selectedLocation;
//   String? selectedValue;
//   final _textProductNameController = TextEditingController();
//   final _textDescriController = TextEditingController();
//   final _textPriceController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   File? _image;
//   ImageFile? imageFile;
//   final picker = ImagePicker();
//   bool flagLoading=false;
//   String flagImage="";
//
// //For Display uploaded image
//   Widget _buildAvatar() {
//     if (_image!=null&&imageFile!=null) {
//       return Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         margin: EdgeInsets.all(5.0),
//         decoration: BoxDecoration(
//           // borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color:
//             ThemeColors.textFieldBgColor,  // red as border color
//           ),
//           color:
//           Colors.white,
//
//         ),
//
//         child:
//         ClipRRect(
//           child: Image.file(
//             _image!,
//             fit: BoxFit.fill,
//           ),
//
//           // borderRadius: BorderRadius.circular(20),
//
//         ),
//
//       );
//     }
//     else{
//       return CachedNetworkImage(
//         imageUrl: imageFile!.imagePath.toString(),
//         imageBuilder: (context, imageProvider) {
//           return Container(
//             width: 110,
//             height: 110,
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle
//               ,
//               image: DecorationImage(
//                 image: imageProvider,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           );
//         },
//         placeholder: (context, url) {
//           return Shimmer.fromColors(
//             baseColor: Theme
//                 .of(context)
//                 .hoverColor,
//             highlightColor: Theme
//                 .of(context)
//                 .highlightColor,
//             enabled: true,
//             child: Container(
//               width: 110,
//               height: 110,
//               // decoration: BoxDecoration(
//               //   shape: BoxShape.rectangle,
//
//               //   color: Colors.white,
//               // ),
//             ),
//           );
//         },
//         errorWidget: (context, url, error) {
//           return Shimmer.fromColors(
//             baseColor: Theme
//                 .of(context)
//                 .hoverColor,
//             highlightColor: Theme
//                 .of(context)
//                 .highlightColor,
//             enabled: true,
//             child: Container(
//               width: 110,
//               height: 110,
//               // decoration: BoxDecoration(
//               //   shape: BoxShape.rectangle,
//               //   color: Colors.white,
//               // ),
//               child: Icon(Icons.error),
//             ),
//           );
//         },
//       );
//
//     }
//     //updated on 30/11/2020
//     return Container(
//         width: MediaQuery.of(context).size.width,
//         height: 120,
//         margin: EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color:
//             ThemeColors.textFieldBgColor,  // red as border color
//           ),
//           color:
//           Colors.white,
//
//         ),
//         child:
//         Container(
//           child: Image.asset(Images.splash,
//               fit: BoxFit.fill,
//               height: 120,
//               width: MediaQuery.of(context).size.width,),
//         ),
//
//
//
//     );
//   }
//
//   //method to open gallery
//     _openGallery(BuildContext context) async {
//
//       final image = await picker.getImage(source: ImageSource.gallery,imageQuality: 25);
//       imageFile=new ImageFile();
//       if (image != null) {
//
//         _cropImage(image);
//
//       }
//     }
//
//     // For crop image
//
//   Future<Null> _cropImage(PickedFile imageCropped) async {
//     File? croppedFile = await ImageCropper.cropImage(
//         sourcePath: imageCropped.path,
//         aspectRatioPresets: Platform.isAndroid
//             ? [
//           // CropAspectRatioPreset.square,
//           CropAspectRatioPreset.ratio4x3,
//         ]
//             : [
//           // CropAspectRatioPreset.square,
//           CropAspectRatioPreset.ratio4x3,
//         ],
//         androidUiSettings: AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Theme.of(context).primaryColor,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.square,
//             lockAspectRatio: false),
//         iosUiSettings: IOSUiSettings(
//           title: 'Cropper',
//         ));
//     if (croppedFile != null) {
//
//       setState(() {
//         // mImageFile.image = croppedFile;
//         // print(mImageFile.image.path);
//         // state = AppState.cropped;
//         _image = croppedFile;
//         imageFile!.image = croppedFile;
//         imageFile!.imagePath=_image!.path;
//        flagImage="0";
//         // when cropped
//         //flagImage="1";
//       });
//       // Navigator.pop(context);
//     }
//   }
//
//
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     imageFile=new ImageFile();
//
//     addProductFormBloc = BlocProvider.of<AddProductFormBloc>(context);
//
//     //for update product
//     if(widget.productDetail.productId!=null){
//       getSubCategoryByCategoryData();
//       getSubSubCategoryBySubCatData();
//       setData();
//     }
//   }
//
//   void getSubCategoryByCategoryData()
//   {
//     CategoryModel categoryModel=CategoryModel();
//     categoryModel.catId=widget.productDetail.catId;
//     categoryModel.catName=widget.productDetail.categoryName;
//     categoryModelselected=categoryModel;
//
//   }
//
//   void getSubSubCategoryBySubCatData()
//   {
//     SubCategoryModel subCategoryModel=SubCategoryModel();
//     subCategoryModel.subcatId=widget.productDetail.subCatId;
//     subCategoryModel.subCatName=widget.productDetail.subCategoryName;
//     subcategoryModelselected=subCategoryModel;
//
//     SubSubCategoryModel subsubCategoryModel=SubSubCategoryModel();
//     subsubCategoryModel.ssCatName=widget.productDetail.ssCategoryName;
//     subsubcategoryModelselected=subsubCategoryModel;
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _textProductNameController.clear();
//     _textPriceController.clear();
//     _textDescriController.clear();
//   }
//   void setData(){
//     setState((){
//       // //category model
//       // CategoryModel categoryModel=CategoryModel();
//       // categoryModel.catName=widget.productDetail.categoryName;
//       // categoryModelselected=categoryModel;
//
//
//       _textProductNameController.text=widget.productDetail.productName.toString();
//       _textPriceController.text=widget.productDetail.price.toString();
//       _textDescriController.text=widget.productDetail.description.toString();
//       if(widget.productDetail.productImg!=""){
//         flagImage="1";//from edit
//         imageFile!.imagePath=widget.productDetail.productImg;
//       }
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       margin: EdgeInsets.only(top:5.0,right: 8,left: 8,bottom: 5),
//       child: Column(
//         children: [
//           // Padding(
//           //   padding: const EdgeInsets.all(5.0),
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //     children: [
//           //       Text(
//           //         "Add Products",
//           //         style: TextStyle(
//           //             fontSize: FontSize.xxLarge,
//           //             fontWeight: FontWeight.bold),
//           //       ),
//           //       InkWell(
//           //           onTap: () {
//           //             Navigator.of(context).pop();
//           //           },
//           //           child: Icon(
//           //             Icons.clear,
//           //             color: ThemeColors.drawerTextColor,
//           //           ))
//           //     ],
//           //   ),
//           // ),
//     Container(
//     child: Form(
//     key: _formKey,
//     child:
//     SingleChildScrollView(
//       child: Column(
//       children: <Widget>[
//       //for category
//       Padding(
//           padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
//           //to hide underline
//           child: FutureBuilder<List<CategoryModel>>(
//               future: fetchCategory(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<List<CategoryModel>> snapshot) {
//                 if (!snapshot.hasData) return Container();
//
//                 return DropdownButtonHideUnderline(
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         // color: Theme.of(context).dividerColor,
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.0),
//                           border: Border.all(
//                               color: ThemeColors.textFieldBgColor)),
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                             left: 15.0, top: 0.0, right: 5.0, bottom: 0.0),
//                         child:
//                         //updated on 15/06/2021 to change background colour of dropdownbutton
//                         new Theme(
//                             data: Theme.of(context)
//                                 .copyWith(canvasColor: Colors.white),
//                             child: DropdownButton(
//                                 items: snapshot.data!
//                                     .map((category) =>
//                                     DropdownMenuItem<CategoryModel>(
//                                       value: category,
//                                       child: Text(
//                                         category.catName.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black),
//                                       ),
//                                     ))
//                                     .toList(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w600),
//                                 isExpanded: true,
//                                 hint: Text('Select Category',
//                                     style: TextStyle(
//                                         color: Color(0xFF3F4141))),
//                                 value: categoryModelselected == null
//                                     ? categoryModelselected
//                                     : snapshot.data!
//                                     .where((i) =>
//                                 i.catName ==
//                                     categoryModelselected!
//                                         .catName)
//                                     .first as CategoryModel,
//                                 onChanged: (CategoryModel? category) {
//                                   subcategoryModelselected=null;
//                                   subsubcategoryModelselected=null;
//                                   setState(() {
//                                     categoryModelselected = category;
//                                   });
//                                 })),
//                       ),
//                     ));
//               })),
//       //for subcategory
//       Padding(
//           padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
//           //to hide underline
//           child: FutureBuilder<List<SubCategoryModel>>(
//               future: fetchSubCategory(categoryModelselected!=null?categoryModelselected!.catId.toString():""),
//               builder: (BuildContext context,
//                   AsyncSnapshot<List<SubCategoryModel>> snapshot) {
//                 if (!snapshot.hasData) return Container();
//
//                 return DropdownButtonHideUnderline(
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         // color: Theme.of(context).dividerColor,
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.0),
//                           border: Border.all(
//                               color: ThemeColors.textFieldBgColor)),
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                             left: 15.0, top: 0.0, right: 5.0, bottom: 0.0),
//                         child:
//                         //updated on 15/06/2021 to change background colour of dropdownbutton
//                         Theme(
//                             data: Theme.of(context)
//                                 .copyWith(canvasColor: Colors.white),
//                             child: DropdownButton(
//                                 items: snapshot.data!
//                                     .map((subcategory) =>
//                                     DropdownMenuItem<SubCategoryModel>(
//                                       value: subcategory,
//                                       child: Text(
//                                         subcategory.subCatName.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black),
//                                       ),
//                                     ))
//                                     .toList(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w600),
//                                 isExpanded: true,
//                                 hint: Text('Select Sub Category',
//                                     style: TextStyle(
//                                         color: Color(0xFF3F4141))),
//                                 value: subcategoryModelselected == null
//                                     ? subcategoryModelselected
//                                     : snapshot.data!
//                                     .where((i) =>
//                                 i.subCatName ==
//                                     subcategoryModelselected!
//                                         .subCatName)
//                                     .first as SubCategoryModel,
//                                 onChanged: (SubCategoryModel? subCategory) {
//                                   subsubcategoryModelselected=null;
//                                   setState(() {
//                                     subcategoryModelselected = subCategory;
//                                   });
//                                 })),
//                       ),
//                     ));
//               })),
//
//       //for subsubcategory
//       Padding(
//           padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
//           //to hide underline
//           child: FutureBuilder<List<SubSubCategoryModel>>(
//               future: fetchSubSubCategory(subcategoryModelselected!=null?subcategoryModelselected!.subcatId.toString():""),
//               builder: (BuildContext context,
//                   AsyncSnapshot<List<SubSubCategoryModel>> snapshot) {
//                 if (!snapshot.hasData) return Container();
//
//                 return DropdownButtonHideUnderline(
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         // color: Theme.of(context).dividerColor,
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.0),
//                           border: Border.all(
//                               color: ThemeColors.textFieldBgColor)),
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                             left: 15.0, top: 0.0, right: 5.0, bottom: 0.0),
//                         child:
//                         //updated on 15/06/2021 to change background colour of dropdownbutton
//                         Theme(
//                             data: Theme.of(context)
//                                 .copyWith(canvasColor: Colors.white),
//                             child: DropdownButton(
//                                 items: snapshot.data!
//                                     .map((subsubcategory) =>
//                                     DropdownMenuItem<SubSubCategoryModel>(
//                                       value: subsubcategory,
//                                       child: Text(
//                                         subsubcategory.ssCatName.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black),
//                                       ),
//                                     ))
//                                     .toList(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w600),
//                                 isExpanded: true,
//                                 hint: Text('Select Sub sub Category',
//                                     style: TextStyle(
//                                         color: Color(0xFF3F4141))),
//                                 value: subsubcategoryModelselected == null
//                                     ? subsubcategoryModelselected
//                                     : snapshot.data!
//                                     .where((i) =>
//                                 i.ssCatName ==
//                                     subsubcategoryModelselected!
//                                         .ssCatName)
//                                     .first as SubSubCategoryModel,
//                                 onChanged: (SubSubCategoryModel? subsubCategory) {
//
//                                   setState(() {
//                                     subsubcategoryModelselected = subsubCategory;
//                                   });
//                                 })),
//                       ),
//                     ));
//               })),
//
//       // for product name and price
//       Padding(
//         padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             //For productName
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.4,
//               child: TextFormField(
//                 obscureText: false,
//                 controller: _textProductNameController,
//                 textAlign: TextAlign.start,
//                 keyboardType: TextInputType.text,
//                 style: TextStyle(
//                   fontSize: 18,
//                   height: 0.8,
//                 ),
//                 decoration: const InputDecoration(
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                   hintStyle: TextStyle(fontSize: 15),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     borderSide:
//                     BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     borderSide:
//                     BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
//                   ),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       borderSide:
//                       BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
//                   hintText: "Product Name",
//                 ),
//                 validator: (value){
//                   if(value==null || value.isEmpty){
//                     return 'Please enter Product Name';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     if ( _formKey.currentState!.validate()) {}
//                   });
//                 },
//               ),
//             ),
//
//             //For Price
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.4,
//               child: TextFormField(
//                 controller: _textPriceController,
//                 obscureText: false,
//                 //initialValue: widget.userdata['name'],
//                 textAlign: TextAlign.start,
//                 keyboardType: TextInputType.number,
//                 style: TextStyle(
//                   fontSize: 18,
//                   height: 0.8,
//                 ),
//                 decoration: const InputDecoration(
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                   hintStyle: TextStyle(fontSize: 15),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     borderSide:
//                     BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     borderSide:
//                     BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
//                   ),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       borderSide: BorderSide(
//                           width: 0.8, color: ThemeColors.textFieldBgColor)),
//                   hintText: "Price",
//                 ),
//                 validator: (value){
//                   if(value==null || value.isEmpty){
//                     return 'Please enter Price';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     if ( _formKey.currentState!.validate()) {}
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//
//       // for description
//       Padding(
//         padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Container(
//             height: 100,
//             child: TextFormField(
//               controller: _textDescriController,
//               obscureText: false,
//               textAlign: TextAlign.start,
//               keyboardType: TextInputType.text,
//               maxLines: 10,
//               style: TextStyle(
//                 fontSize: 14,
//                 // height: 0.8,
//               ),
//               decoration: const InputDecoration(
//                 contentPadding:
//                 EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
//                 hintStyle: TextStyle(fontSize: 15),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                   borderSide:
//                   BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                   borderSide:
//                   BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
//                 ),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide:
//                     BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
//                 hintText: "Description",
//               ),
//               validator: (value){
//
//                 if(value==null || value.isEmpty){
//                   return 'Please enter description';
//                 }
//                 return null;
//               },
//               onChanged: (text) {
//                 setState(() {
//                   if ( _formKey.currentState!.validate()) {}
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//
//       // For Pincode
//       // Padding(
//       //   padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
//       //   child: Container(
//       //     child: TextFormField(
//       //       obscureText: false,
//       //       textAlign: TextAlign.start,
//       //       keyboardType: TextInputType.text,
//       //       style: TextStyle(
//       //         fontSize: 18,
//       //         height: 0.8,
//       //       ),
//       //       decoration: const InputDecoration(
//       //         contentPadding:
//       //         EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//       //         hintStyle: TextStyle(fontSize: 15),
//       //         enabledBorder: OutlineInputBorder(
//       //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//       //           borderSide:
//       //           BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
//       //         ),
//       //         focusedBorder: OutlineInputBorder(
//       //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//       //           borderSide:
//       //           BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
//       //         ),
//       //         border: OutlineInputBorder(
//       //             borderRadius: BorderRadius.all(Radius.circular(20.0)),
//       //             borderSide:
//       //             BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
//       //         hintText: "Pin Code",
//       //       ),
//       //       validator: (value){
//       //         Pattern pattern =
//       //             r'(^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$)';
//       //         RegExp regex =
//       //         new RegExp(pattern.toString());
//       //
//       //         if(value==null || value.isEmpty){
//       //           return 'Please enter Pincode';
//       //         }else if(!regex.hasMatch(value)){
//       //           return 'Please enter valid Pincode';
//       //         }
//       //         return null;
//       //       },
//       //       onChanged: (text) {
//       //         setState(() {
//       //           if ( _formKey.currentState!.validate()) {}
//       //         });
//       //       },
//       //     ),
//       //   ),
//       // ),
//
//       // For Upload image
//         Padding(
//           padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
//           child: InkWell(
//                           onTap: () {
//                             _openGallery(context);
//                             // Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //         builder: (context) => MyImagePicker()));
//                           },
//                           child: DottedBorder(
//                             color: ThemeColors.textFieldHintColor,
//                             strokeWidth: 1,
//                             dashPattern: [10, 6],
//                             child: Container(
//                               height: _image==null?100:110,
//                               width: MediaQuery.of(context).size.width * 0.9,
//                               child: imageFile!.image!=null
//                                   ?
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//
//                                   Icon(
//                                     CupertinoIcons.arrow_down_doc,
//                                     color: ThemeColors.textFieldHintColor,
//                                   ),
//                                   Text(
//                                     "Browse & Upload",
//                                     style: TextStyle(
//                                         fontSize: FontSize.medium,
//                                         color: ThemeColors.textFieldHintColor),
//                                   )
//                                 ],
//                               ):
//                               _buildAvatar()
//
//                             ),
//                           ),
//                         ),
//         ),
//        // For Display image
//        //  _buildAvatar(),
//
//         // For Update button
//         SizedBox(height: 10,),
//         BlocBuilder<AddProductFormBloc,AddProductFormState>(builder: (context,addProd){
//           return BlocListener<AddProductFormBloc,AddProductFormState>(listener: (context,state){
//             if(state is AddProductSuccess){
//               Fluttertoast.showToast(msg: state.message.toString());
//               flagLoading=false;
//               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UnstoppableProducts()));
//             }
//             if(state is AddProductLoading){
//               flagLoading=true;
//
//             }
//             if(state is AddProductFail){
//               flagLoading=false;
//
//               Fluttertoast.showToast(msg: state.message.toString());
//             }
//
//             if(state is UpdateProductSuccess){
//
//               flagLoading=false;
//               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UnstoppableProducts()));
//             }
//             if(state is UpdateProductFail){
//               flagLoading=false;
//
//               Fluttertoast.showToast(msg: "");
//             }
//           },
//           child:
//           Padding(
//             padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
//             child: Center(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(0),
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: 40,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: ThemeColors.drawerTextColor,
//                     ),
//                     onPressed: () {
//                       if(imageFile!.imagePath==null){
//                         Fluttertoast.showToast(msg: "Please select image");
//                       } else if(categoryModelselected==null){
//                         Fluttertoast.showToast(msg: "Please select category");
//                       }else if(subcategoryModelselected==null){
//                         Fluttertoast.showToast(msg: "Please select sub category");
//                       }else if(subsubcategoryModelselected==null){
//                         Fluttertoast.showToast(msg: "Please select sub sub category");
//                       }else if(_formKey.currentState!.validate())
//                       {
//                         if(widget.productDetail==null)
//                         { //add api
//                           addProductFormBloc!.add(AddProductForm(
//                               catId: categoryModelselected!.catId.toString(),
//                               subCatId: subcategoryModelselected!.subcatId.toString(),
//                               sscatId: subsubcategoryModelselected!.sscatId.toString(),
//                               prodName: _textProductNameController.text,
//                               desc: _textDescriController.text,
//                               image: imageFile!,
//                               price: _textPriceController.text));
//                         }
//                         else{
//                               addProductFormBloc!.add(UpdateProduct(
//                               catid: categoryModelselected!.catId.toString(),
//                                   subcatid: subcategoryModelselected!.subcatId.toString(),
//                                   sscatid: subsubcategoryModelselected!.sscatId.toString(),
//                                   prodname: _textProductNameController.text,
//                                   description: _textDescriController.text,
//                                   image: imageFile!,
//                                   price: _textPriceController.text,
//                                 imgFlag:flagImage,
//                                 productid: widget.productDetail.productId.toString(),));
//                               }
//                         }
//                       },
//                     child: Text(
//                       'Update',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//           );
//         }),
//
//         SizedBox(height: 80,),
//
//                     ]),
//     ))),
//
//
//         ],
//       ),
//     );
//   }
// }
//
// class City {
//   int? cityId;
//   String? cityName;
//
//   City({this.cityId, this.cityName});
// }
//
// class CountryState {
//   int? stateId;
//   String? stateName;
//   List<City>? cities;
//
//   CountryState({this.stateId, this.stateName, this.cities});
// }
//
//
// Widget Heading(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.all(11.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           "Add Products",
//           style: TextStyle(
//               fontSize: FontSize.xxLarge, fontWeight: FontWeight.bold),
//         ),
//         InkWell(
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//             child: Icon(
//               Icons.clear,
//               color: ThemeColors.drawerTextColor,
//             ))
//       ],
//     ),
//   );
// }
//
//
//
//
//
//
//

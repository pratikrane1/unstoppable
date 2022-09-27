
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
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/subCategory_model.dart';
import 'package:unstoppable/NetworkFunction/fetchSubCategory.dart';
import 'package:unstoppable/Screens/image_file.dart';
import 'package:unstoppable/Screens/Products/unstoppableProducts.dart';
import 'package:unstoppable/Screens/My%20Unstoppable%20Orders/unstoppable_orders.dart';
import 'package:unstoppable/constant/font_size.dart';
import 'package:unstoppable/constant/theme_colors.dart';
import 'package:image_picker/image_picker.dart';
import '../Blocs/addProductForm/addProductForm_bloc.dart';
import '../Blocs/addProductForm/addProductForm_state.dart';
import '../Models/category_model.dart';
import '../Models/subSubCategory_model.dart';
import '../Models/untoppable_order_model.dart';
import '../NetworkFunction/fetchCategory.dart';
import '../NetworkFunction/fetchSubSubCategory.dart';
import '../Utils/application.dart';
import '../config/image.dart';
import 'image_upload.dart';

class UpdateOrderScreen extends StatefulWidget {
  int? status;
  UnstoppableOrderModel unstoppableOrderModel;
  UpdateOrderScreen({Key? key,required this.unstoppableOrderModel}):super(key:key);

  @override
  State<UpdateOrderScreen> createState() => _UpdateOrderScreenState();
}

class _UpdateOrderScreenState extends State<UpdateOrderScreen> {
  AddProductFormBloc? addProductFormBloc;
  MytoolsBloc? mytoolsBloc;
  List<CategoryModel> addProductFormCategoryList = [];
  CategoryModel? categoryModelselected;
  SubSubCategoryModel? subsubcategoryModelselected;
  SubCategoryModel? subcategoryModelselected;
  String? _selectedLocation;
  String? selectedValue;
  final _textProductNameController = TextEditingController();
  final _textDescriController = TextEditingController();
  final _textPriceController = TextEditingController();
  final _textQantityController = TextEditingController();
  final _textAmountController = TextEditingController();
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
          return Column(
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
          );
          // return Shimmer.fromColors(
          //   baseColor: Theme
          //       .of(context)
          //       .hoverColor,
          //   highlightColor: Theme
          //       .of(context)
          //       .highlightColor,
          //   enabled: true,
          //   child: Container(
          //     width: 110,
          //     height: 110,
          //     // decoration: BoxDecoration(
          //     //   shape: BoxShape.rectangle,
          //     //   color: Colors.white,
          //     // ),
          //   child: Icon(Icons.error),
          //
          //   ),
          // );
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
   
    mytoolsBloc = BlocProvider.of<MytoolsBloc>(context);
    //mytoolsBloc!.add(OnLoadingUnstoppableOrderList(userid: Application.vendorLogin!.userId.toString(),));
    //for update product
    if(widget.unstoppableOrderModel!=null){
      setData();
    }
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textAmountController.clear();
    _textQantityController.clear();
  }
  void setData(){
    setState((){
      _textAmountController.text=widget.unstoppableOrderModel.amount.toString();
      _textQantityController.text=widget.unstoppableOrderModel.amount.toString();
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
                  "Update Orders",
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





                          // for amount name and quantity
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
                                    controller: _textAmountController,
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
                                    controller: _textQantityController,
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
                                      hintText: "Qantity",
                                    ),
                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return 'Please enter Qantity';
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


                          // For Update button
                          BlocBuilder<MytoolsBloc,MytoolsState>(builder: (context,updateorder){
                            return BlocListener<MytoolsBloc,MytoolsState>(listener: (context,state){



                              if(state is UpdateOrderDataSuccess){
                                flagLoading=false;

                                Fluttertoast.showToast(msg: "Amount and Qantity Updated Successfully");
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UnstoppableOrders()));

                              }
                              if(state is UpdateOrderDataLoading){
                                flagLoading=true;
                              }
                              if(state is UpdateOrderDataFail){
                                flagLoading=false;

                                Fluttertoast.showToast(msg: "Amount and Qantity Updated Fail");
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
                                            if(_formKey.currentState!.validate()){
                                              Fluttertoast.showToast(msg: "Save Successfully");
                                              mytoolsBloc!.add(UpdateOrderData(
                                                  leadid: widget.unstoppableOrderModel!.leadId.toString(),
                                                  qty: _textQantityController.text,
                                                  amount: _textAmountController.text

                                              ));
                                            }else {
                                              Fluttertoast.showToast(msg: "Please fill the data");
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


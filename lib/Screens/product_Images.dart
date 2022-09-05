import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unstoppable/Blocs/addProductForm/addProductForm_state.dart';
import 'package:unstoppable/Models/productImage_model.dart';
import '../Blocs/addProductForm/addProductForm_bloc.dart';
import '../Blocs/addProductForm/addProductForm_event.dart';
import '../Utils/application.dart';
import '../config/image.dart';
import '../constant/font_size.dart';
import '../constant/theme_colors.dart';
import '../widgets/seeIcon.dart';
import 'image_file.dart';
import 'dart:io';

class ProductImages  extends StatefulWidget{
  var productId;
  ProductImages({Key? key, this.productId}) : super(key: key);
  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  AddProductFormBloc? _addProductFormBloc;
  List<ProductImageModel> productimageList=[];
  File? _image;
  ImageFile? imageFile;
  final picker = ImagePicker();
  int offset=0;
  bool flagNoDatAvailable=false;

  void initState() {
    // TODO: implement initState
    super.initState();
    productimageList=[];
    _addProductFormBloc = BlocProvider.of<AddProductFormBloc>(context);
    _addProductFormBloc!.add(OnLoadingProductImageList(
        productid: widget.productId.toString(),
    offset:offset.toString()));

  }

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
        _addProductFormBloc!.add(
            UploadProductImage(
                productId: widget.productId,
                prodimg: imageFile!));
      });
      // Navigator.pop(context);
    }
  }

  // For shimmer widget box
  Widget buildProductImageList(List<ProductImageModel> productImageList) {
    if (productImageList.length<=0) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        // padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Theme.of(context).hoverColor,
            highlightColor: Theme.of(context).highlightColor,
            enabled: true,
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child:
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  // leading: nameIcon(),
                  leading: CachedNetworkImage(
                    filterQuality: FilterQuality.medium,
                    // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                    imageUrl:
                    "https://picsum.photos/250?image=9",
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        baseColor: Theme
                            .of(context)
                            .hoverColor,
                        highlightColor:
                        Theme
                            .of(context)
                            .highlightColor,
                        enabled: true,
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    },
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Shimmer.fromColors(
                        baseColor: Theme
                            .of(context)
                            .hoverColor,
                        highlightColor:
                        Theme
                            .of(context)
                            .highlightColor,
                        enabled: true,
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.error),
                        ),
                      );
                    },
                  ),
                  title: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Loading...",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            //color: Theme.of(context).accentColor
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(
                                ".......",

                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black87,
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(width: 20,)
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),


                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
              ),

            ),
          );

        },
        itemCount: List.generate(8, (index) => index).length,
      );
    }

    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only( top: 10, bottom: 15),
      itemBuilder: (context, index) {
        // return productImageCard(context,productImageList[index]);
        return InkWell(

          onTap: (){

          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:  BoxDecoration(
                borderRadius:  BorderRadius.circular(10.0),
                border: Border.all(width: 2, color: Colors.blue),
                // color: Colors.black12,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    // leading: nameIcon(),
                    leading: CachedNetworkImage(
                      filterQuality: FilterQuality.medium,
                      // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                      // imageUrl:
                      // "https://picsum.photos/250?image=9",
                      imageUrl: productImageList[index].productImage == null
                          ? "https://picsum.photos/250?image=9"
                          : productImageList[index].productImage.toString(),
                      placeholder: (context, url) {
                        return Shimmer.fromColors(
                          baseColor: Theme
                              .of(context)
                              .hoverColor,
                          highlightColor:
                          Theme
                              .of(context)
                              .highlightColor,
                          enabled: true,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      },
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Shimmer.fromColors(
                          baseColor: Theme
                              .of(context)
                              .hoverColor,
                          highlightColor:
                          Theme
                              .of(context)
                              .highlightColor,
                          enabled: true,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.error),
                          ),
                        );
                      },
                    ),
                    //dense: true,
                    trailing:InkWell(
                      onTap: (){
                        if(productImageList.length-1!=index){
                          productImageList.removeAt(index);
                          _addProductFormBloc!.add(RemoveProductImage(imgId: productImageList[index].imgId.toString()));

                        }else{
                          _addProductFormBloc!.add(RemoveProductImage(imgId: productImageList[index].imgId.toString()));

                        }
                      },
                      child:Container(
                        width: 40,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:  BorderRadius.circular(5.0),
                          //color: Color(0xffc32c37),
                          color: Colors.indigo,
                          // border: Border.all(color: Colors.black, width: 1)
                        ),
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 21,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )

                ),
              ),
            ),
          ),
        );
      },
      itemCount: productImageList.length,
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45.10,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.deepOrange[500],
        leading:InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child:
        Icon(CupertinoIcons.chevron_left,color: Colors.white,size: 18,)),
        //leading: Center(child: Text("<",style: TextStyle(color: Colors.white,fontSize: 30),)),
        title: Text("Images",style: TextStyle(fontSize: 15),),

      ),
      body:BlocBuilder<AddProductFormBloc,AddProductFormState>(builder:(context,state) {
      if (state is ProductImageListSuccess) {
        flagNoDatAvailable=false;

        productimageList = state.productImageList!;

      }
      if(state is ProductImageLoading){
        flagNoDatAvailable=false;

        productimageList=[];
      }

      if(state is ProductImageListLoadFail){
        flagNoDatAvailable=true;
      }

      if (state is UploadProductImageSuccess) {
        flagNoDatAvailable=false;
        Fluttertoast.showToast(msg: "Image Uploaded successfully");
        productimageList=[];
        _addProductFormBloc!.add(OnLoadingProductImageList(
            productid: widget.productId.toString(),
            offset:offset.toString()));

      }
      if(state is RemoveProductImageSuccess){
        flagNoDatAvailable=false;

        productimageList=[];

        _addProductFormBloc!.add(OnLoadingProductImageList(
            productid: widget.productId.toString(),
            offset:offset.toString()));
      }
      return SafeArea(
        child: Container(
          decoration: new BoxDecoration(
            //borderRadius: new BorderRadius.circular(16.0),
            color: Colors.black12,
          ),
          child:
          Padding(
            padding: const EdgeInsets.only(left:15.0,right: 15.0,top: 20.0,bottom: 10),
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(16.0),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  //Searchbar(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //for Productimage ListView
                      flagNoDatAvailable==true?
                      Container(
                        margin: EdgeInsets.only(top:250.0),
                        child: Center(child: Text("No Images Available",style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),),),
                      )
                          :
                      Expanded(child:Container(
                          margin: EdgeInsets.only(bottom: 70.0),
                          height: MediaQuery.of(context).size.height,
                          child:buildProductImageList(productimageList)))

                    ],),

                  // SizedBox(height: 5,),
                  //info(),
                  //for product ListView


                  Positioned(
                      bottom: 10.0,
                      right: 10.0,
                      left: 10.0,
                      child: // For Upload image
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
                                height:50,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child:
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
                                )

                            ),
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),
          )

        ),
      );
      })

    );
  }
}

// For Product imageList widget

// Widget productImageCard(BuildContext context,ProductImageModel productImageData){
//   return InkWell(
//
//     onTap: (){
//
//     },
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration:  BoxDecoration(
//           borderRadius:  BorderRadius.circular(10.0),
//           border: Border.all(width: 2, color: Colors.blue),
//           // color: Colors.black12,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListTile(
//             contentPadding: EdgeInsets.zero,
//             //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//             // leading: nameIcon(),
//             leading: CachedNetworkImage(
//               filterQuality: FilterQuality.medium,
//               // imageUrl: Api.PHOTO_URL + widget.users.avatar,
//               // imageUrl:
//               // "https://picsum.photos/250?image=9",
//               imageUrl: productImageData.productImage == null
//                   ? "https://picsum.photos/250?image=9"
//                   : productImageData.productImage.toString(),
//               placeholder: (context, url) {
//                 return Shimmer.fromColors(
//                   baseColor: Theme
//                       .of(context)
//                       .hoverColor,
//                   highlightColor:
//                   Theme
//                       .of(context)
//                       .highlightColor,
//                   enabled: true,
//                   child: Container(
//                     height: 80,
//                     width: 80,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 );
//               },
//               imageBuilder: (context, imageProvider) {
//                 return Container(
//                   height: 80,
//                   width: 80,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                     ),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 );
//               },
//               errorWidget: (context, url, error) {
//                 return Shimmer.fromColors(
//                   baseColor: Theme
//                       .of(context)
//                       .hoverColor,
//                   highlightColor:
//                   Theme
//                       .of(context)
//                       .highlightColor,
//                   enabled: true,
//                   child: Container(
//                     height: 80,
//                     width: 80,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Icon(Icons.error),
//                   ),
//                 );
//               },
//             ),
//             //dense: true,
//             trailing:InkWell(
//               onTap: (){
//
//                 addP!.add(RemoveProductImage(imgId: productImageData.imgId.toString()));
//               },
//               child:Container(
//                 width: 40,
//                 height: 25,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.rectangle,
//                   borderRadius:  BorderRadius.circular(5.0),
//                   //color: Color(0xffc32c37),
//                   color: Colors.indigo,
//                   // border: Border.all(color: Colors.black, width: 1)
//                 ),
//                 child: Container(
//                   width: 30,
//                   height: 30,
//                   alignment: Alignment.center,
//                   child: Stack(
//                     children: [
//                       Center(
//                         child: Icon(
//                           Icons.delete,
//                           color: Colors.white,
//                           size: 21,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//
//           ),
//         ),
//       ),
//           ),
//         );
//
//
//
// }


// Widget displayImage(){
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black),
//             borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListTile(
//           leading: Container(
//             width: 55,
//             height: 55,
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 //color: Color(0xffc32c37),
//                 // color: Colors.white,
//                 border: Border.all(color: Colors.black, width: 1)),
//             child: Container(
//               width: 35,
//               height: 35,
//               alignment: Alignment.center,
//               child: Stack(
//                 children: [
//                   Center(
//                     child:
//                     // Image.asset(
//                     //   'assets/images/Product1.jpg',
//                     //   height: 30,
//                     //   width: 30,
//                     // ),
//                     Image.network('https://picsum.photos/250?image=9'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           trailing: Container(
//             width: 40,
//             height: 25,
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius:  BorderRadius.circular(5.0),
//               //color: Color(0xffc32c37),
//               color: Colors.indigo,
//               // border: Border.all(color: Colors.black, width: 1)
//             ),
//             child: Container(
//               width: 30,
//               height: 30,
//               alignment: Alignment.center,
//               child: Stack(
//                 children: [
//                   Center(
//                     child: Icon(
//                       Icons.delete,
//                       color: Colors.white,
//                       size: 21,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Widget ImagesList()
// {
//   return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Container(
//           height: 365,
//           child:ListView(
//             children: [
//               displayImage(),
//               displayImage(),
//               displayImage(),
//               displayImage(),
//               displayImage(),
//               displayImage(),
//       ]
//           )
//       )
//   );
// }

// Widget SelectImages ()
// {
//    return Padding(
//      padding: const EdgeInsets.all(10.0),
//      child: DottedBorder(
//       borderType: BorderType.RRect,
//       radius: Radius.circular(12),
//       padding: EdgeInsets.all(6),
//       child: ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(12)),
//         child: Center(
//           child: Container(
//             height: 60,
//             width: 120,
//             child: Column(
//               children: [
//                 Icon(CupertinoIcons.arrow_up_doc_fill),
//                 SizedBox(height: 5,),
//                 Center(child: Text("Browse & Upload")),
//               ],
//             ),
//           ),
//         ),
//       ),
//   ),
//    );
// }


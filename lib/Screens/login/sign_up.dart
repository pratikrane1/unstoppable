import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unstoppable/Blocs/login/login_bloc.dart';
import 'package:unstoppable/Blocs/login/login_event.dart';
import 'package:unstoppable/Blocs/login/login_state.dart';
import 'package:unstoppable/Screens/login/sign_in.dart';
import 'package:unstoppable/Utils/connectivity_check.dart';
import 'package:unstoppable/constant/font_size.dart';
import 'package:unstoppable/constant/theme_colors.dart';

import '../../Models/category_model.dart';
import '../../Models/subCategory_model.dart';
import '../../Models/subSubCategory_model.dart';
import '../../NetworkFunction/fetchCategory.dart';
import '../../NetworkFunction/fetchSubCategory.dart';
import '../../NetworkFunction/fetchSubSubCategory.dart';
import '../../widgets/app_dialogs.dart';
import '../bottom_navbar.dart';
import '../dashboard.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  LoginBloc? _userLoginBloc;
  bool isconnectedToInternet = false;


  ListItem? supplierValue;
 // List<String> supplierList = ["Manufacturers", "Wholesaler", "Retailer", "Service Provide", "Freelancer"];

 List<ListItem> supplierList = [
   ListItem(3, "Manufacturers"),
   ListItem(4, "Wholesaler"),
   ListItem(5, "Retailer"),
   ListItem(6, "Service Provide"),
   ListItem(7, "Freelancer"),
 ];
 final _formKey = GlobalKey<FormState>();
 final _nameController = TextEditingController();
 final _businessController = TextEditingController();
 final _ownershipController = TextEditingController();
 final _establishmentController = TextEditingController();
 final _totalEmpController = TextEditingController();
 final _annualTurnController = TextEditingController();
 final _panController = TextEditingController();
 final _BusinessAddressController = TextEditingController();
 final _pinController = TextEditingController();
 final _mobNoController = TextEditingController();
 final _emailController = TextEditingController();
 final _gSTNController = TextEditingController();
 CategoryModel? categoryModelselected;
 SubSubCategoryModel? subsubcategoryModelselected;
 SubCategoryModel? subcategoryModelselected;
 final picker = ImagePicker();
  String _value = "3";

//For Display uploaded image
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
//       width: MediaQuery.of(context).size.width,
//       height: 120,
//       margin: EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color:
//           ThemeColors.textFieldBgColor,  // red as border color
//         ),
//         color:
//         Colors.white,
//
//       ),
//       child:
//       Container(
//         child: Image.asset(Images.splash,
//           fit: BoxFit.fill,
//           height: 120,
//           width: MediaQuery.of(context).size.width,),
//       ),
//
//
//
//     );
//   }


 //method to open gallery
 // _openGallery(BuildContext context) async {
 //
 //   final image = await picker.getImage(source: ImageSource.gallery,imageQuality: 25);
 //   imageFile=new ImageFile();
 //   if (image != null) {
 //
 //     _cropImage(image);
 //
 //   }
 // }

  void initState(){
    super.initState();
    _userLoginBloc = BlocProvider.of<LoginBloc>(context);


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.clear();
    _businessController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<LoginBloc,LoginState>(builder: (context,login){
          return BlocListener<LoginBloc,LoginState>(listener: (context,state){
            if(state is VendorRegistrationSuccess)
            {
              // Fluttertoast.showToast(msg: "Registered Successfully");
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInPage()));

            }
          },
            child: Form(
              key: _formKey,
              child: Container(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height:150,
                      width: 300,
                      child: Image.asset('assets/images/Logo.png'),

                    ),
                    const SizedBox(height: 10,),
                    Center(
                      child: Container(
                        width: 325,
                        // height: 270,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child:
                        Card(
                          color: ThemeColors.cardColor,
                          shape:  const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          elevation: 35,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                const Align(alignment: Alignment.bottomLeft,
                                  child: Text("Register Here",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight:FontWeight.bold
                                    ),),
                                ),
                                const SizedBox(height: 15,),

                                // Supplier DropDown
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 55,
                                  child:
                                  DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color:Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color:Colors.black),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(width: 0.8, color:Colors.black)),
                                      hintText: "Register As",
                                    ),
                                    value: _value,
                                    items: [
                                      DropdownMenuItem(
                                        value: "3",
                                        child:
                                        Text(
                                          "Manufacturers",
                                          // style: TextStyle(
                                          //     fontSize: 18.0, fontWeight: FontWeight.w600),

                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: "4",
                                        child:
                                        Text(
                                          "Wholesaler",
                                          // style: TextStyle(
                                          //     fontSize: 18.0, fontWeight: FontWeight.w600),

                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: "5",
                                        child:
                                        Text(
                                          "Service Provide ",
                                          // style: TextStyle(
                                          //     fontSize: 18.0, fontWeight: FontWeight.w600),

                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: "6",
                                        child:
                                        Text(
                                          "Freelancer",
                                          // style: TextStyle(
                                          //     fontSize: 18.0, fontWeight: FontWeight.w600),

                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: "7",
                                        child:
                                        Text(
                                          "Generation",
                                          // style: TextStyle(
                                          //     fontSize: 18.0, fontWeight: FontWeight.w600),

                                        ),
                                      )
                                    ],

                                    onChanged: (String? value) {
                                      setState(() {
                                        _value = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 5,),

                                //Full Name

                                const Align(alignment: Alignment.topLeft,
                                    child: Text("Full Name:", textAlign: TextAlign.start,)),
                                const SizedBox(height: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width ,
                                  child: TextFormField(
                                    controller: _nameController,
                                    obscureText: false,
                                    //initialValue: widget.userdata['name'],
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(width: 0.8, color: Colors.black)),
                                      hintText: "Full Name",
                                    ),
                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return 'Please enter Full Name';
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


                                const SizedBox(height: 15,),

                                //Category DropDown
                                const Align(alignment: Alignment.topLeft,
                                    child: Text("Bussiness Category:", textAlign: TextAlign.start,)),
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
                                                        color: ThemeColors.scaffoldBgColor)),
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
                                                            // subsubcategoryModelselected=null;
                                                            setState(() {
                                                              categoryModelselected = category;
                                                            });
                                                          })),
                                                ),
                                              ));
                                        })),

                                const SizedBox(height: 15,),

                                //Sub Category DropDown
                                const Align(alignment: Alignment.topLeft,
                                    child: Text("Sub Category:", textAlign: TextAlign.start,)),
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
                                                        color: ThemeColors.scaffoldBgColor)),
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

                                const SizedBox(height: 15,),

                                //Sub Sub Category DropDown
                                const Align(alignment: Alignment.topLeft,
                                    child: Text("Sub Sub Category:", textAlign: TextAlign.start,)),
                                // const SizedBox(height: 30,),
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
                                                        color: ThemeColors.scaffoldBgColor)),
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
                                const SizedBox(height: 15,),


                                //Business Name
                                const Align(alignment: Alignment.topLeft,
                                    child: Text("Business Name:", textAlign: TextAlign.start,)),
                                const SizedBox(height: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width ,
                                  child: TextFormField(
                                    controller: _businessController,
                                    obscureText: false,
                                    //initialValue: widget.userdata['name'],
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(width: 0.8, color: Colors.black)),
                                      hintText: "Business Name",
                                    ),
                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return 'Please enter Business Name';
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
                                const SizedBox(height: 15,),


                                //OwnerShip Type
                                const Align(alignment: Alignment.topLeft,
                                    child: Text("OwnershipType:", textAlign: TextAlign.start,)),
                                const SizedBox(height: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width ,
                                  child: TextFormField(
                                    controller: _ownershipController,
                                    obscureText: false,
                                    //initialValue: widget.userdata['name'],
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(width: 0.8, color: Colors.black)),
                                      hintText: "OwnershipType",
                                    ),
                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return 'Please enter OwnershipType';
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
                                const SizedBox(height: 15,),


                                //Year of establishment
                                const Align(alignment: Alignment.topLeft,
                                    child: Text("Year Of Establishment:", textAlign: TextAlign.start,)),
                                const SizedBox(height: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width ,
                                  child: TextFormField(
                                    controller: _establishmentController,
                                    obscureText: false,
                                    //initialValue: widget.userdata['name'],
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(width: 0.8, color: Colors.black)),
                                      hintText: "Year Of Establishment",
                                    ),
                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return 'Please enter Year Of Establishment';
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
                                const SizedBox(height: 15,),

                                //Total Number of employees :
                                const Align(alignment: Alignment.topLeft,
                                    child: Text("Total Number Of Employees:", textAlign: TextAlign.start,)),
                                const SizedBox(height: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width ,
                                  child: TextFormField(
                                    controller: _totalEmpController,
                                    obscureText: false,
                                    //initialValue: widget.userdata['name'],
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(width: 0.8, color: Colors.black)),
                                      hintText: "Total Number Of Employees ",
                                    ),
                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return 'Please enter Total Number Of Employees ';
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
                                const SizedBox(height: 15,),

                                //Annual Turnover:
                                const Align(alignment: Alignment.topLeft,
                                    child: Text("Annual Turnover:", textAlign: TextAlign.start,)),
                                const SizedBox(height: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width ,
                                  child: TextFormField(
                                    controller: _annualTurnController,
                                    obscureText: false,
                                    //initialValue: widget.userdata['name'],
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(width: 0.8, color: Colors.black)),
                                      hintText: "Annual Turnover",
                                    ),
                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return 'Please Enter Annual Turnover ';
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
                                const SizedBox(height: 15,),

                                //Annual Turnover:
                                const Align(alignment: Alignment.topLeft,
                                    child: Text("GST Number:", textAlign: TextAlign.start,)),
                                const SizedBox(height: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width ,
                                  child: TextFormField(
                                    controller: _gSTNController,
                                    obscureText: false,
                                    //initialValue: widget.userdata['name'],
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(width: 0.8, color: Colors.black)),
                                      hintText: "GST Number",
                                    ),
                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return 'Please Enter GST Number';
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
                                const SizedBox(height: 15,),

                                //Business Address:
                                const Align(alignment: Alignment.topLeft,
                                    child: Text("Business Address:", textAlign: TextAlign.start,)),
                                const SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:TextFormField(
                                    controller: _BusinessAddressController,
                                    // initialValue: companyData![0].businessAddress.toString(),
                                    obscureText: false,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    maxLines: 4,
                                    style: TextStyle(
                                      fontSize: 18,
                                      height: 1.5,
                                    ),
                                    decoration:  InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                      hintStyle: TextStyle(fontSize: 15),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        borderSide:
                                        BorderSide(width: 1.2, color: ThemeColors.scaffoldBgColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: ThemeColors.scaffoldBgColor),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          borderSide:
                                          BorderSide(width: 1.2, color: ThemeColors.scaffoldBgColor)),
                                      hintText: "Business Address",
                                    ),
                                    validator: (value) {
                                      if(value==null || value.isEmpty){
                                        return 'Please enter Business Address';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        if ( _formKey.currentState!.validate()) {}
                                      });
                                    },
                                  ),
                                  // Container(
                                  //   height: 100,
                                  //   decoration: BoxDecoration(
                                  //     border: Border.all(color: Colors.black),
                                  //     borderRadius: BorderRadius.circular(12),
                                  //   ),
                                  //
                                  // ),
                                ),
                                const SizedBox(height: 15,),

                                //Pin Code:
                                const Align(alignment: Alignment.topLeft,
                                    child: Text("Pin Code:", textAlign: TextAlign.start,)),
                                const SizedBox(height: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width ,
                                  child: TextFormField(
                                    controller: _pinController,
                                    obscureText: false,
                                    //initialValue: widget.userdata['name'],
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(width: 0.8, color: Colors.black)),
                                      hintText: "Pin Code",
                                    ),
                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return 'Please Enter Pin Code';
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
                                const SizedBox(height: 15,),

                                //Mobile No:
                                const Align(alignment: Alignment.topLeft,
                                    child: Text("Mobile No:", textAlign: TextAlign.start,)),
                                const SizedBox(height: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width ,
                                  child: TextFormField(
                                    controller: _mobNoController,
                                    obscureText: false,
                                    //initialValue: widget.userdata['name'],
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(width: 0.8, color: Colors.black)),
                                      hintText: "Mobile No",
                                    ),
                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return 'Please Enter Mobile No';
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
                                const SizedBox(height: 15,),

                                //Email:
                                const Align(alignment: Alignment.topLeft,
                                    child: Text("Email:", textAlign: TextAlign.start,)),
                                const SizedBox(height: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width ,
                                  child: TextFormField(
                                    controller: _emailController,
                                    obscureText: false,
                                    //initialValue: widget.userdata['name'],
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide:
                                        BorderSide(width: 0.8, color: Colors.black),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide:
                                          BorderSide(width: 0.8, color: Colors.black)),
                                      hintText: "Email",
                                    ),
                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return 'Please Enter Email';
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
                                const SizedBox(height: 15,),

                                //Company Logo:
                                //     const Align(alignment: Alignment.topLeft,
                                //         child: Text("Company Logo:", textAlign: TextAlign.start,)),
                                //     const SizedBox(height: 5,),
                                //     Padding(
                                //   padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
                                //   child: InkWell(
                                //     onTap: () {
                                //       _openGallery(context);
                                //       // Navigator.push(
                                //       //     context,
                                //       //     MaterialPageRoute(
                                //       //         builder: (context) => MyImagePicker()));
                                //     },
                                //     child: DottedBorder(
                                //       color: ThemeColors.textFieldHintColor,
                                //       strokeWidth: 1,
                                //       dashPattern: [10, 6],
                                //       child: Container(
                                //           height: _image==null?100:110,
                                //           width: MediaQuery.of(context).size.width * 0.9,
                                //           child: imageFile!.image!=null
                                //               ?
                                //           Column(
                                //             mainAxisAlignment: MainAxisAlignment.center,
                                //             crossAxisAlignment: CrossAxisAlignment.center,
                                //             children: [
                                //
                                //               Icon(
                                //                 CupertinoIcons.arrow_down_doc,
                                //                 color: ThemeColors.textFieldHintColor,
                                //               ),
                                //               Text(
                                //                 "Browse & Upload",
                                //                 style: TextStyle(
                                //                     fontSize: FontSize.medium,
                                //                     color: ThemeColors.textFieldHintColor),
                                //               )
                                //             ],
                                //           ):
                                //           _buildAvatar()
                                //
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                //     const SizedBox(height: 15,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),


                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: ThemeColors.drawerTextColor,
                                ),
                                onPressed: () async{
                                  isconnectedToInternet = await ConnectivityCheck
                                      .checkInternetConnectivity();
                                  if (isconnectedToInternet == true) {
                                    if (_formKey.currentState!.validate()) {
                                      Fluttertoast.showToast(msg: "Registered Successfully");

                                      _userLoginBloc!.add(OnRegistration(
                                          userType: _value,
                                          fullName: _nameController.text,
                                        businessName: _businessController.text,
                                        catId: categoryModelselected!.catId.toString(),
                                        subId: subcategoryModelselected!.subcatId.toString(),
                                        subSubId: subsubcategoryModelselected!.sscatId.toString(),
                                        ownershipType: _ownershipController.text,
                                        estYear: _establishmentController.text,
                                        totalEmp: _totalEmpController.text,
                                        annualTurnover: _annualTurnController.text,
                                        gSTIN: _gSTNController.text,
                                        address: _BusinessAddressController.text,
                                        pinCode: _pinController.text,
                                        mobile: _mobNoController.text,
                                        email: _emailController.text,
                                        comLogo: "",
                                        referby: ""

                                      ));
                                    }
                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavigation()));

                                  } else {
                                    CustomDialogs.showDialogCustom(
                                        "Internet",
                                        "Please check your Internet Connection!",
                                        context);
                                  }

                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            // ElevatedButton.icon(
                            //   style: ElevatedButton.styleFrom(
                            //     primary: ThemeColors.baseThemeColor,
                            //   ),
                            //   icon: Icon(
                            //     Icons.update,
                            //     size: 26,
                            //   ),
                            //   label: Text(
                            //     'Update',
                            //     style: TextStyle(
                            //       fontSize: 18,
                            //       fontWeight: FontWeight.w400,
                            //     ),
                            //   ),
                            //   onPressed: () {
                            //     // profile.updateUserPassword(context: context);
                            //   },
                            // ),
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Already User?",style: TextStyle(fontWeight: FontWeight.normal),),
                        SizedBox(width: 8,),
                        InkWell(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInPage()));
                          },
                          child: Text("Login", style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: FontSize.medium,fontWeight: FontWeight.bold),),),


                      ],
                    ),


                  ],
                ),
              ),
            ),
          );
        })

      ),
    );
  }

}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
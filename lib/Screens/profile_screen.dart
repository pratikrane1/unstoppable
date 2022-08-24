import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unstoppable/Blocs/companyProfile/comapny_profile_state.dart';
import 'package:unstoppable/Blocs/companyProfile/company_profile_event.dart';
import 'package:unstoppable/Models/company_profile_model.dart';
import 'package:unstoppable/Models/user_profile_model.dart';
import 'package:unstoppable/widgets/drawer.dart';
import '../Api/api.dart';
import '../Blocs/User Profile/user_profile_bloc.dart';
import '../Blocs/companyProfile/company_profile_block.dart';
import '../Models/category_model.dart';
import '../Models/subCategory_model.dart';
import '../Models/subSubCategory_model.dart';
import '../NetworkFunction/fetchCategory.dart';
import '../NetworkFunction/fetchSubCategory.dart';
import '../NetworkFunction/fetchSubSubCategory.dart';
import '../Utils/application.dart';
import '../constant/theme_colors.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  // UserProfileModel? profileData;
  ProfileScreen({Key? key}):super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
  final _referBy = TextEditingController();
  CategoryModel? categoryModelselected;
  SubSubCategoryModel? subsubcategoryModelselected;
  SubCategoryModel? subcategoryModelselected;


  CompanyProfileBloc? _userProfileBloc;
  List<UserProfileModel>? userProfileData;
  var userData;


   Future<dynamic> getUserProfile() async {
    var data;

    final response = await http.post(
      Uri.parse(Api.USER_PROFILE),
      body: {"user_id":Application.vendorLogin!.userId.toString()},
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body)["data"];
      // print(responseJson);
      data = responseJson;
      print("DATA $data");
      // print("DATA ${userData}");
      // final Iterable refactorProduct = data ?? [];
      // final userProfileData = refactorProduct.map((item) {
      //   return UserProfileModel.fromJson(item);
      // }).toList();
      // // print("Data $userProfileData");
      // return UserProfileRepo.fromJson(responseJson);
    }
  return data;

  }


  @override
  void initState() {
    super.initState();
    _userProfileBloc = BlocProvider.of<CompanyProfileBloc>(context);
    _userProfileBloc!.add(OnLoadingUserProfile(userid: Application.vendorLogin!.userId.toString()));
    // _companyProbileBloc!.add(OnLoadingCompanyProfileList(userid: "874"));
    // final _nameController = TextEditingController(text: companyData![0].name.toString());
    // if(widget.companyData!=null){
    //   setData();
    // }
    getUserProfile();
    userData;


  }

  // void setData(){
  //   setState((){
  //
  //     _nameController.text = widget.profileData!.name.toString();
  //     _businessController.text = widget.profileData!.businessTyp.toString();
  //     _ownershipController.text = widget.profileData!.ownershipTyp.toString();
  //     _establishmentController.text = widget.profileData!.estYear.toString();
  //     _totalEmpController.text = widget.profileData!.totEmployee.toString();
  //     _annualTurnController.text = widget.profileData!.annualTurnover.toString();
  //     _BusinessAddressController.text = widget.profileData!.address.toString();
  //     _pinController.text = widget.profileData!.pinCode.toString();
  //     _mobNoController.text = widget.profileData!.mobileNo.toString();
  //     _emailController.text = widget.profileData!.email.toString();
  //     _gSTNController.text = widget.profileData!.gstNo.toString();
  //     _referBy.text = widget.profileData!.referBy.toString();
  //     // categoryModelselected = widget.profileData!.catName.toString();
  //
  //   });
  //   // if(companydataList.length>0){
  //   //
  //   //
  //   //
  //   // }else{
  //   //   _nameController.text = "";
  //   //   _managingDirector.text = "";
  //   //   _ceo.text = "";
  //   //   _companyName.text = "";
  //   //   _operatorDesignation.text = "";
  //   //   _operatorName.text = "";
  //   //   _businessAddress.text = "";
  //   //   _country.text = "";
  //   //   _state.text = "";
  //   //   _city.text = "";
  //   //   _zipCode.text = "";
  //   //   _gstin.text = "";
  //   //   _companyWebsite.text = "";
  //   //   _mobileNumber.text = "";
  //   //   _alternateNumber.text = "";
  //   //   _primaryEmail.text = "";
  //   //   _alternateEmail.text = "";
  //   //   _landlineNumber.text = "";
  //   //   _yearOfEstablishment.text = "";
  //   //   _businessType.text = "";
  //   //   _OwnershipType.text = "";
  //   //   _numberOfEmployees.text = "";
  //   //   _annualTurnover.text = "";
  //   //   _panNo.text = "";
  //   //   _tanNo.text = "";
  //   //   _cinNo.text = "";
  //   //   _dfgt.text = "";
  //   //
  //   // }
  //
  //
  // }


  void dispose(){
    _nameController.clear();
    _businessController.clear();
    _ownershipController.clear();
    _establishmentController.clear();
    _totalEmpController.clear();
    _annualTurnController.clear();
    _BusinessAddressController.clear();
    _pinController.clear();
    _mobNoController.clear();
    _emailController.clear();
    _gSTNController.clear();
    _referBy.clear();
    _referBy.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text('My Profile'),
        ),
        body:
        BlocBuilder<CompanyProfileBloc, CompanyProfileState>(builder: (context, state) {
          if (state is UserProfileSuccess) {
            // companyData = state.companyProfileData;
            // setData(companyData!);
            // setData();
          }

          if(state is UserProfileLoadFail){
            // companyData=[];
            // setData(companyData!);
            // setData();
          }

          return
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20.0, bottom: 10),
                child: Container(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child:
                          Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child:
                              // widget.profileData!=null
                              //     ?
                              ListView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: ThemeColors.baseThemeColor.withOpacity(.01),
                                        ),
                                        child:Form(
                                          key: _formKey,
                                          child: Container(
                                            child: Column(
                                              // crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Center(
                                                  child: Container(
                                                    width: 325,
                                                    // height: 270,
                                                    decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                                    ),
                                                    child:
                                                    Padding(
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: Column(
                                                        children: [

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


                                                          //GST Number:

                                                          Align(alignment: Alignment.topLeft,
                                                              child:
                                                              // (_value == "5" || _value == "7")
                                                              //     ?
                                                              // Text("PAN Number:", textAlign: TextAlign.start,)
                                                                  // :
                                                              Text("GST Number:", textAlign: TextAlign.start,)
                                                          ),
                                                          const SizedBox(height: 5,),
                                                          SizedBox(
                                                            width: MediaQuery.of(context).size.width ,
                                                            child:
                                                            // (_value == "5" || _value == "7")
                                                            //     ?
                                                            // TextFormField(
                                                            //   controller: _gSTNController,
                                                            //   obscureText: false,
                                                            //   //initialValue: widget.userdata['name'],
                                                            //   textAlign: TextAlign.start,
                                                            //   keyboardType: TextInputType.text,
                                                            //   style: TextStyle(
                                                            //       color: Colors.black,
                                                            //       fontWeight: FontWeight.w600),
                                                            //   decoration: const InputDecoration(
                                                            //     contentPadding:
                                                            //     EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                                            //     hintStyle: TextStyle(fontSize: 12),
                                                            //     enabledBorder: OutlineInputBorder(
                                                            //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                                            //       borderSide:
                                                            //       BorderSide(width: 0.8, color: Colors.black),
                                                            //     ),
                                                            //     focusedBorder: OutlineInputBorder(
                                                            //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                                            //       borderSide:
                                                            //       BorderSide(width: 0.8, color: Colors.black),
                                                            //     ),
                                                            //     border: OutlineInputBorder(
                                                            //         borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                                            //         borderSide:
                                                            //         BorderSide(width: 0.8, color: Colors.black)),
                                                            //     hintText: "PAN Number",
                                                            //   ),
                                                            //   validator: (value){
                                                            //     if(value==null || value.isEmpty){
                                                            //       return 'Please Enter PAN Number';
                                                            //     }
                                                            //     return null;
                                                            //   },
                                                            //   onChanged: (value) {
                                                            //     setState(() {
                                                            //       if ( _formKey.currentState!.validate()) {}
                                                            //     });
                                                            //   },
                                                            // )
                                                            //     :
                                                            TextFormField(
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

                                                          //Refer by:
                                                          const Align(alignment: Alignment.topLeft,
                                                              child: Text("Refer by(optional):", textAlign: TextAlign.start,)),
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
                                                                hintText: "Refer by",
                                                              ),
                                                              // validator: (value){
                                                              //   if(value==null || value.isEmpty){
                                                              //     return 'Please Enter Refer by';
                                                              //   }
                                                              //   return null;
                                                              // },
                                                              onChanged: (value) {
                                                                setState(() {
                                                                  if ( _formKey.currentState!.validate()) {}
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                          const SizedBox(height: 15,),

                                                          // // Company Logo:
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

                                                 ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ])
                                  // :Center(child:CircularProgressIndicator())

                          )

                      ),
                      SizedBox(height: 10,),
                      Center(
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
                                // if(_formKey.currentState!.validate()){
                                //   Fluttertoast.showToast(msg: "Save Successfully");
                                //   _companyProbileBloc!.add(UpdateCompanyProfile(
                                //       userid: widget.companyData!.userId.toString(),
                                //       name: _nameController.text,
                                //       managingdirector: _managingDirector.text,
                                //       ceo: _ceo.text,
                                //       companyname: _companyName.text,
                                //       operatordesignation: _operatorDesignation.text,
                                //       operatorname: _operatorName.text,
                                //       businessaddress: _businessAddress.text,
                                //       country: _country.text,
                                //       state: _state.text,
                                //       city: _city.text,
                                //       zipcode: _zipCode.text,
                                //       gstin: _gstin.text,
                                //       website: _companyWebsite.text,
                                //       mobileno: _mobileNumber.text,
                                //       altmobile: _alternateNumber.text,
                                //       email: _primaryEmail.text,
                                //       altemail: _alternateEmail.text,
                                //       landline: _landlineNumber.text,
                                //       estyear: _yearOfEstablishment.text,
                                //       businesstype: _businessType.text,
                                //       ownershiptype: _OwnershipType.text,
                                //       totemp: _numberOfEmployees.text,
                                //       anualturnover: _annualTurnover.text,
                                //       panno: _panNo.text,
                                //       tanno: _tanNo.text,
                                //       cinno: _cinNo.text,
                                //       dfgt: _dfgt.text
                                //
                                //   ));
                                // }else {
                                //   Fluttertoast.showToast(msg: "Please fill the data");
                                // }
                              },
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
                      )
                    ],
                  ),
                ),
              ),
            );
        }
        )


      // ),
    );
  }
}

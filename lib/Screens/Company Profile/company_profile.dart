import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unstoppable/Blocs/companyProfile/comapny_profile_state.dart';
import 'package:unstoppable/Blocs/companyProfile/company_profile_event.dart';
import 'package:unstoppable/Models/company_profile_model.dart';
import 'package:unstoppable/widgets/drawer.dart';
import '../../Blocs/companyProfile/company_profile_block.dart';
import '../../Utils/application.dart';
import '../../constant/theme_colors.dart';
import '../bottom_navbar.dart';

class CompanyProfileEditPage extends StatefulWidget {
  CompanyProfileModel? companyData;
  CompanyProfileEditPage({Key? key,required this.companyData}):super(key: key);
  @override
  State<CompanyProfileEditPage> createState() => _CompanyProfileEditPageState();
}

class _CompanyProfileEditPageState extends State<CompanyProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _managingDirector = TextEditingController();
  final _ceo = TextEditingController();
  final _companyName = TextEditingController();
  final _operatorDesignation = TextEditingController();
  final _operatorName = TextEditingController();
  final _businessAddress = TextEditingController();
  final _country = TextEditingController();
  final _state = TextEditingController();
  final _city = TextEditingController();
  final _zipCode = TextEditingController();
  final _gstin = TextEditingController();
  final _companyWebsite = TextEditingController();
  final _mobileNumber = TextEditingController();
  final _alternateNumber = TextEditingController();
  final _primaryEmail = TextEditingController();
  final _alternateEmail = TextEditingController();
  final _landlineNumber = TextEditingController();
  final _yearOfEstablishment = TextEditingController();
  final _businessType = TextEditingController();
  final _OwnershipType = TextEditingController();
  final _numberOfEmployees = TextEditingController();
  final _annualTurnover = TextEditingController();
  final _panNo = TextEditingController();
  final _tanNo = TextEditingController();
  final _cinNo = TextEditingController();
  final _dfgt = TextEditingController();

  final _focusFirstName = FocusNode();


  CompanyProfileBloc? _companyProbileBloc;
  List<CompanyProfileModel>? companyData;


  @override
  void initState() {
    super.initState();
    _companyProbileBloc = BlocProvider.of<CompanyProfileBloc>(context);
    _companyProbileBloc!.add(OnLoadingCompanyProfileList(userid: Application.vendorLogin!.userId.toString()));
    // _companyProbileBloc!.add(OnLoadingCompanyProfileList(userid: "874"));
    // final _nameController = TextEditingController(text: companyData![0].name.toString());
    if(widget.companyData!=null){
      setData();
    }

  }

  // void setData(List<CompanyProfileModel> companydataList){
  //   if(companydataList.length>0){
  //     _nameController.text = companyData![0].name.toString();
  //     _managingDirector.text = companyData![0].managingDirector.toString();
  //     _ceo.text = companyData![0].ceo.toString();
  //     _companyName.text = companyData![0].companyName.toString();
  //     _operatorDesignation.text = companyData![0].operatorDesignation.toString();
  //     _operatorName.text = companyData![0].operatorName.toString();
  //     _businessAddress.text = companyData![0].businessAddress.toString();
  //     _country.text = companyData![0].country.toString();
  //     _state.text = companyData![0].state.toString();
  //     _city.text = companyData![0].city.toString();
  //     _zipCode.text = companyData![0].zipCode.toString();
  //     _gstin.text = companyData![0].gstin.toString();
  //     _companyWebsite.text = companyData![0].website.toString();
  //     _mobileNumber.text = companyData![0].mobileNo.toString();
  //     _alternateNumber.text = companyData![0].altMobileNo.toString();
  //     _primaryEmail.text = companyData![0].email.toString();
  //     _alternateEmail.text = companyData![0].altEmail.toString();
  //     _landlineNumber.text = companyData![0].landlineNo.toString();
  //     _yearOfEstablishment.text = companyData![0].estYear.toString();
  //     _businessType.text = companyData![0].businessTyp.toString();
  //     _OwnershipType.text = companyData![0].ownershipTyp.toString();
  //     _numberOfEmployees.text = companyData![0].totEmployee.toString();
  //     _annualTurnover.text = companyData![0].annualTurnover.toString();
  //     _panNo.text = companyData![0].panNo.toString();
  //     _tanNo.text = companyData![0].tanNo.toString();
  //     _cinNo.text = companyData![0].cinNo.toString();
  //     _dfgt.text = companyData![0].dfgt.toString();
  //
  //
  //   }else{
  //     _nameController.text = "";
  //     _managingDirector.text = "";
  //     _ceo.text = "";
  //     _companyName.text = "";
  //     _operatorDesignation.text = "";
  //     _operatorName.text = "";
  //     _businessAddress.text = "";
  //     _country.text = "";
  //     _state.text = "";
  //     _city.text = "";
  //     _zipCode.text = "";
  //     _gstin.text = "";
  //     _companyWebsite.text = "";
  //     _mobileNumber.text = "";
  //     _alternateNumber.text = "";
  //     _primaryEmail.text = "";
  //     _alternateEmail.text = "";
  //     _landlineNumber.text = "";
  //     _yearOfEstablishment.text = "";
  //     _businessType.text = "";
  //     _OwnershipType.text = "";
  //     _numberOfEmployees.text = "";
  //     _annualTurnover.text = "";
  //     _panNo.text = "";
  //     _tanNo.text = "";
  //     _cinNo.text = "";
  //     _dfgt.text = "";
  //
  //   }
  //
  //
  // }
  void setData(){
    setState((){

      _nameController.text = widget.companyData!.name.toString();
      _managingDirector.text = widget.companyData!.managingDirector.toString();
      _ceo.text = widget.companyData!.ceo.toString();
      _companyName.text = widget.companyData!.companyName.toString();
      _operatorDesignation.text = widget.companyData!.operatorDesignation.toString();
      _operatorName.text = widget.companyData!.operatorName.toString();
      _businessAddress.text = widget.companyData!.businessAddress.toString();
      _country.text = widget.companyData!.country.toString();
      _state.text = widget.companyData!.state.toString();
      _city.text = widget.companyData!.city.toString();
      _zipCode.text = widget.companyData!.zipCode.toString();
      _gstin.text = widget.companyData!.gstin.toString();
      _companyWebsite.text = widget.companyData!.website.toString();
      _mobileNumber.text = widget.companyData!.mobileNo.toString();
      _alternateNumber.text = widget.companyData!.altMobileNo.toString();
      _primaryEmail.text = widget.companyData!.email.toString();
      _alternateEmail.text = widget.companyData!.altEmail.toString();
      _landlineNumber.text = widget.companyData!.landlineNo.toString();
      _yearOfEstablishment.text = widget.companyData!.estYear.toString();
      _businessType.text = widget.companyData!.businessTyp.toString();
      _OwnershipType.text = widget.companyData!.ownershipTyp.toString();
      _numberOfEmployees.text = widget.companyData!.totEmployee.toString();
      _annualTurnover.text = widget.companyData!.annualTurnover.toString();
      _panNo.text = widget.companyData!.panNo.toString();
      _tanNo.text = widget.companyData!.tanNo.toString();
      _cinNo.text = widget.companyData!.cinNo.toString();
      _dfgt.text = widget.companyData!.dfgt.toString();
    });
    // if(companydataList.length>0){
    //
    //
    //
    // }else{
    //   _nameController.text = "";
    //   _managingDirector.text = "";
    //   _ceo.text = "";
    //   _companyName.text = "";
    //   _operatorDesignation.text = "";
    //   _operatorName.text = "";
    //   _businessAddress.text = "";
    //   _country.text = "";
    //   _state.text = "";
    //   _city.text = "";
    //   _zipCode.text = "";
    //   _gstin.text = "";
    //   _companyWebsite.text = "";
    //   _mobileNumber.text = "";
    //   _alternateNumber.text = "";
    //   _primaryEmail.text = "";
    //   _alternateEmail.text = "";
    //   _landlineNumber.text = "";
    //   _yearOfEstablishment.text = "";
    //   _businessType.text = "";
    //   _OwnershipType.text = "";
    //   _numberOfEmployees.text = "";
    //   _annualTurnover.text = "";
    //   _panNo.text = "";
    //   _tanNo.text = "";
    //   _cinNo.text = "";
    //   _dfgt.text = "";
    //
    // }


  }

  void dispose(){
    _nameController.clear();
    _managingDirector.clear();
    _ceo.clear();
    _companyName.clear();
    _operatorDesignation.clear();
    _operatorName.clear();
    _businessAddress.clear();
    _country.clear();
    _state.clear();
    _city.clear();
    _zipCode.clear();
    _gstin.clear();
    _companyWebsite.clear();
    _mobileNumber.clear();
    _alternateNumber.clear();
    _primaryEmail.clear();
    _alternateEmail.clear();
    _landlineNumber.clear();
    _yearOfEstablishment.clear();
    _businessType.clear();
    _OwnershipType.clear();
    _numberOfEmployees.clear();
    _annualTurnover.clear();
    _panNo.clear();
    _tanNo.clear();
    _cinNo.clear();
    _dfgt.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => DrawerWidget()));
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: ThemeColors.baseThemeColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Company Profile'),
        ),
        body:
        BlocBuilder<CompanyProfileBloc, CompanyProfileState>(builder: (context, state) {
          if (state is CompanyProfileSuccess) {
            // companyData = state.companyProfileData;
            // setData(companyData!);
            // setData();
          }

          if(state is CompanyProfileListLoadFail){
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
                              child:widget.companyData!=null
                              ?
                              ListView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: ThemeColors.baseThemeColor.withOpacity(.01),
                                        ),
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              //Name
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text("Name")),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    // initialValue: companyData![0].name.toString(),
                                                    controller: _nameController,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.text,
                                                    focusNode: _focusFirstName,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      hintText: "name",
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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

                                                    ),
                                                    validator: (value) {
                                                      // profile.name = value!.trim();
                                                      // Pattern pattern =
                                                      //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                                      // RegExp regex =
                                                      // new RegExp(pattern.toString());
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter name';
                                                      }
                                                      // else if(!regex.hasMatch(value)){
                                                      //   return 'Please enter valid name';
                                                      // }
                                                      return null;
                                                    },
                                                    onChanged: (value) {

                                                      // profile.name = value;
                                                      setState(() {
                                                        // _nameController.text = value;
                                                        if ( _formKey.currentState!.validate()) {}

                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Managing Director
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('Managing Director')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    // initialValue: companyData![0].managingDirector.toString(),
                                                    controller: _managingDirector,
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.text,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "Managing Director",
                                                    ),
                                                    validator: (value) {
                                                      // Pattern pattern =
                                                      //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                                      // RegExp regex =
                                                      // new RegExp(pattern.toString());
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter Managing Director';
                                                      }
                                                      // else if(!regex.hasMatch(value)){
                                                      //   return 'Please enter valid email';
                                                      // }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      // _managingDirector.text = value;
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //CEO/CMO/CFO
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('CEO/CMO/CFO')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    // initialValue: companyData![0].ceo.toString(),
                                                    controller: _ceo,
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.text,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "ceo",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter ceo';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Company Name
                                              Column(
                                                children: [
                                                  Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Text('Company Name (as per Reg. documents)')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    // initialValue: companyData![0].companyName.toString(),
                                                    controller: _companyName,
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.text,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "Company Name",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter Company Name';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Operator Designation & Operator Name
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Operator Designation'),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        child: TextFormField(
                                                          controller: _operatorDesignation,
                                                          // initialValue: companyData![0].operatorDesignation.toString(),
                                                          // controller: profile.addressController,
                                                          obscureText: false,
                                                          //initialValue: widget.userdata['name'],
                                                          textAlign: TextAlign.start,
                                                          keyboardType: TextInputType.text,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            height: 1.5,
                                                          ),
                                                          decoration:  InputDecoration(
                                                            contentPadding:
                                                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                            hintText: "Operator Designation",
                                                          ),
                                                          validator: (value) {
                                                            if(value==null || value.isEmpty){
                                                              return 'Please enter Operator Designation';
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
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Operator Name'),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        child: TextFormField(
                                                          controller: _operatorName,
                                                          // initialValue: companyData![0].operatorName.toString(),
                                                          // controller: profile.addressController,
                                                          obscureText: false,
                                                          //initialValue: widget.userdata['name'],
                                                          textAlign: TextAlign.start,
                                                          keyboardType: TextInputType.text,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            height: 1.5,
                                                          ),
                                                          decoration:  InputDecoration(
                                                            contentPadding:
                                                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                            hintText: "Operator Name",
                                                          ),
                                                          validator: (value) {
                                                            if(value==null || value.isEmpty){
                                                              return 'Please enter Operator Name';
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
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Business Address
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('Business Address')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: _businessAddress,
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
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Country & State & City & Zip Code
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Country'),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        child: TextFormField(
                                                          controller: _country,
                                                          // initialValue: companyData![0].country.toString(),
                                                          // controller: profile.addressController,
                                                          obscureText: false,
                                                          //initialValue: widget.userdata['name'],
                                                          textAlign: TextAlign.start,
                                                          keyboardType: TextInputType.text,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            height: 1.5,
                                                          ),
                                                          decoration:  InputDecoration(
                                                            contentPadding:
                                                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                            hintText: "Country",
                                                          ),
                                                          validator: (value) {
                                                            if(value==null || value.isEmpty){
                                                              return 'Please enter Country';
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
                                                          controller: _city,
                                                          // initialValue: companyData![0].city.toString(),
                                                          // controller: profile.addressController,
                                                          obscureText: false,
                                                          //initialValue: widget.userdata['name'],
                                                          textAlign: TextAlign.start,
                                                          keyboardType: TextInputType.text,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            height: 1.5,
                                                          ),
                                                          decoration:  InputDecoration(
                                                            contentPadding:
                                                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                            hintText: "City",
                                                          ),
                                                          validator: (value) {
                                                            if(value==null || value.isEmpty){
                                                              return 'Please enter City';
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
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('State'),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        child: TextFormField(
                                                          controller: _state,
                                                          // initialValue: companyData![0].state.toString(),
                                                          // controller: profile.addressController,
                                                          obscureText: false,
                                                          //initialValue: widget.userdata['name'],
                                                          textAlign: TextAlign.start,
                                                          keyboardType: TextInputType.text,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            height: 1.5,
                                                          ),
                                                          decoration:  InputDecoration(
                                                            contentPadding:
                                                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                            hintText: "State",
                                                          ),
                                                          validator: (value) {
                                                            if(value==null || value.isEmpty){
                                                              return 'Please enter State';
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
                                                          controller: _zipCode,
                                                          // initialValue: companyData![0].ceo.toString(),
                                                          // controller: profile.addressController,
                                                          obscureText: false,
                                                          //initialValue: widget.userdata['name'],
                                                          textAlign: TextAlign.start,
                                                          keyboardType: TextInputType.text,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            height: 1.5,
                                                          ),
                                                          decoration:  InputDecoration(
                                                            contentPadding:
                                                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                            hintText: "Zip Code",
                                                          ),
                                                          validator: (value) {
                                                            if(value==null || value.isEmpty){
                                                              return 'Please enter Zip Code';
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
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //GSTIN
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('GSTIN')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: _gstin,
                                                    // initialValue: companyData![0].gstin.toString(),
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.text,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "GSTIN",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter GSTIN';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Company Website
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('Company Website')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: _companyWebsite,
                                                    // initialValue: companyData![0].website.toString(),
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.text,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "Company Website",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter Company Website';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Mobile Number
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('Mobile Number')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: _mobileNumber,
                                                    // initialValue: companyData![0].mobileNo.toString(),
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.phone,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "Mobile Number",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter Mobile Number';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Alternate Number
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('Alternate Number')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: _alternateNumber,
                                                    // initialValue: companyData![0].altMobileNo.toString(),
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.phone,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "Alternate Number",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter Alternate Number';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Primary Email
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('Primary Email')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: _primaryEmail,
                                                    // initialValue: companyData![0].email.toString(),
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.emailAddress,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "Primary Email",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter Primary Email';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Alternate Email
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('Alternate Email')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: _alternateEmail,
                                                    // initialValue: companyData![0].altEmail.toString(),
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.emailAddress,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "Alternate Email",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter Alternate Email';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Landline Number
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('Landline Number')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: _landlineNumber,
                                                    // initialValue: companyData![0].landlineNo.toString(),
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.phone,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "Landline Number",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter Landline Number';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Year of Establishment
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('Year of Establishment')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: _yearOfEstablishment,
                                                    // initialValue: companyData![0].estYear.toString(),
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.text,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "Year of establishment",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter Year of establishment';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Business Type & OwnerShip Type & Nm=umber of Employees & Annual Trnover
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Business Type'),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        child: TextFormField(
                                                          controller: _businessType,
                                                          // initialValue: companyData![0].businessTyp.toString(),
                                                          // controller: profile.addressController,
                                                          obscureText: false,
                                                          //initialValue: widget.userdata['name'],
                                                          textAlign: TextAlign.start,
                                                          keyboardType: TextInputType.text,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            height: 1.5,
                                                          ),
                                                          decoration:  InputDecoration(
                                                            contentPadding:
                                                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                            hintText: "Business Type",
                                                          ),
                                                          validator: (value) {
                                                            if(value==null || value.isEmpty){
                                                              return 'Please enter Business Type';
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
                                                          controller: _numberOfEmployees,
                                                          // initialValue: companyData![0].totEmployee.toString(),
                                                          // controller: profile.addressController,
                                                          obscureText: false,
                                                          //initialValue: widget.userdata['name'],
                                                          textAlign: TextAlign.start,
                                                          keyboardType: TextInputType.text,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            height: 1.5,
                                                          ),
                                                          decoration: InputDecoration(
                                                            contentPadding:
                                                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                            hintText: "Number of employee",
                                                          ),
                                                          validator: (value) {
                                                            if(value==null || value.isEmpty){
                                                              return 'Please enter Number of employee';
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
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Ownership Type'),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        child: TextFormField(
                                                          controller: _OwnershipType,
                                                          // initialValue: companyData![0].ownershipTyp.toString(),
                                                          // controller: profile.addressController,
                                                          obscureText: false,
                                                          //initialValue: widget.userdata['name'],
                                                          textAlign: TextAlign.start,
                                                          keyboardType: TextInputType.text,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            height: 1.5,
                                                          ),
                                                          decoration:  InputDecoration(
                                                            contentPadding:
                                                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                            hintText: "Ownership Type",
                                                          ),
                                                          validator: (value) {
                                                            if(value==null || value.isEmpty){
                                                              return 'Please enter Ownership Type';
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
                                                          controller: _annualTurnover,
                                                          // initialValue: companyData![0].annualTurnover.toString(),
                                                          // controller: profile.addressController,
                                                          obscureText: false,
                                                          //initialValue: widget.userdata['name'],
                                                          textAlign: TextAlign.start,
                                                          keyboardType: TextInputType.text,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            height: 1.5,
                                                          ),
                                                          decoration:  InputDecoration(
                                                            contentPadding:
                                                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                            hintText: "Annual Turnover",
                                                          ),
                                                          validator: (value) {
                                                            if(value==null || value.isEmpty){
                                                              return 'Please enter Annual Turnover';
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
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Pan No
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('Pan No')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: _panNo,
                                                    // initialValue: companyData![0].panNo.toString(),
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.text,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "Pan no",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter Pan no';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //Tan No
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('Tan No')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: _tanNo,
                                                    // initialValue: companyData![0].tanNo.toString(),
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.text,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "Tan no",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter Tan no';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //CIN No
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('CIN No')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: _cinNo,
                                                    // initialValue: companyData![0].cinNo.toString(),
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.text,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration:  InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "CIN no",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter CIN no';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //DFGT
                                              Column(
                                                children: [
                                                  Align(alignment: Alignment.topLeft, child: Text('DFGT/IE code')),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: _dfgt,
                                                    // initialValue: companyData![0].dfgt.toString(),
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    keyboardType: TextInputType.text,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                    ),
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                                      hintText: "DFGT/IE code",
                                                    ),
                                                    validator: (value) {
                                                      if(value==null || value.isEmpty){
                                                        return 'Please enter DFGT/IE code';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if ( _formKey.currentState!.validate()) {}
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ])
                                  :Center(child:CircularProgressIndicator())

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
                                if(_formKey.currentState!.validate()){
                                  Fluttertoast.showToast(msg: "Save Successfully");
                                  _companyProbileBloc!.add(UpdateCompanyProfile(
                                      userid: widget.companyData!.userId.toString(),
                                      name: _nameController.text,
                                      managingdirector: _managingDirector.text,
                                      ceo: _ceo.text,
                                      companyname: _companyName.text,
                                      operatordesignation: _operatorDesignation.text,
                                      operatorname: _operatorName.text,
                                      businessaddress: _businessAddress.text,
                                      country: _country.text,
                                      state: _state.text,
                                      city: _city.text,
                                      zipcode: _zipCode.text,
                                      gstin: _gstin.text,
                                      website: _companyWebsite.text,
                                      mobileno: _mobileNumber.text,
                                      altmobile: _alternateNumber.text,
                                      email: _primaryEmail.text,
                                      altemail: _alternateEmail.text,
                                      landline: _landlineNumber.text,
                                      estyear: _yearOfEstablishment.text,
                                      businesstype: _businessType.text,
                                      ownershiptype: _OwnershipType.text,
                                      totemp: _numberOfEmployees.text,
                                      anualturnover: _annualTurnover.text,
                                      panno: _panNo.text,
                                      tanno: _tanNo.text,
                                      cinno: _cinNo.text,
                                      dfgt: _dfgt.text

                                  ));
                                }else {
                                  Fluttertoast.showToast(msg: "Please fill the data");
                                }
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


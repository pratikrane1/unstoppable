import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unstoppable/Blocs/companyProfile/comapny_profile_state.dart';
import 'package:unstoppable/Blocs/companyProfile/company_profile_event.dart';
import 'package:unstoppable/Models/company_profile_model.dart';
import 'package:unstoppable/widgets/drawer.dart';
import '../Blocs/companyProfile/company_profile_block.dart';
import '../Utils/application.dart';
import '../constant/theme_colors.dart';
import '../widgets/app_text_input.dart';
import 'bottom_navbar.dart';

class CompanyProfileUpdate extends StatefulWidget {
  @override
  State<CompanyProfileUpdate> createState() => _CompanyProfileUpdateState();
}

class _CompanyProfileUpdateState extends State<CompanyProfileUpdate> {
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
  }

  void setData(List<CompanyProfileModel> companydataList){
    if(companydataList.length>0){
      _nameController.text = companyData![0].name.toString();
      _managingDirector.text = companyData![0].managingDirector.toString();
      _ceo.text = companyData![0].ceo.toString();
      _companyName.text = companyData![0].companyName.toString();
      _operatorDesignation.text = companyData![0].operatorDesignation.toString();
      _operatorName.text = companyData![0].operatorName.toString();
      _businessAddress.text = companyData![0].businessAddress.toString();
      _country.text = companyData![0].country.toString();
      _state.text = companyData![0].state.toString();
      _city.text = companyData![0].city.toString();
      _zipCode.text = companyData![0].zipCode.toString();
      _gstin.text = companyData![0].gstin.toString();
      _companyWebsite.text = companyData![0].website.toString();
      _mobileNumber.text = companyData![0].mobileNo.toString();
      _alternateNumber.text = companyData![0].altMobileNo.toString();
      _primaryEmail.text = companyData![0].email.toString();
      _alternateEmail.text = companyData![0].altEmail.toString();
      _landlineNumber.text = companyData![0].landlineNo.toString();
      _yearOfEstablishment.text = companyData![0].estYear.toString();
      _businessType.text = companyData![0].businessTyp.toString();
      _OwnershipType.text = companyData![0].ownershipTyp.toString();
      _numberOfEmployees.text = companyData![0].totEmployee.toString();
      _annualTurnover.text = companyData![0].annualTurnover.toString();
      _panNo.text = companyData![0].panNo.toString();
      _tanNo.text = companyData![0].tanNo.toString();
      _cinNo.text = companyData![0].cinNo.toString();
      _dfgt.text = companyData![0].dfgt.toString();


    }else{
      _nameController.text = "";
      _managingDirector.text = "";
      _ceo.text = "";
      _companyName.text = "";
      _operatorDesignation.text = "";
      _operatorName.text = "";
      _businessAddress.text = "";
      _country.text = "";
      _state.text = "";
      _city.text = "";
      _zipCode.text = "";
      _gstin.text = "";
      _companyWebsite.text = "";
      _mobileNumber.text = "";
      _alternateNumber.text = "";
      _primaryEmail.text = "";
      _alternateEmail.text = "";
      _landlineNumber.text = "";
      _yearOfEstablishment.text = "";
      _businessType.text = "";
      _OwnershipType.text = "";
      _numberOfEmployees.text = "";
      _annualTurnover.text = "";
      _panNo.text = "";
      _tanNo.text = "";
      _cinNo.text = "";
      _dfgt.text = "";

    }


  }

  void dispose(){
    _nameController.dispose();
    _managingDirector.dispose();
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
          title: Text('Company Profile'),
        ),
        body:BlocBuilder<CompanyProfileBloc, CompanyProfileState>(builder: (context, state) {
          if (state is CompanyProfileSuccess) {
            companyData = state.companyProfileData;
            setData(companyData!);
          }

          if(state is CompanyProfileListLoadFail){
            companyData=[];
            setData(companyData!);
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
                              child:companyData!=null
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
                                                  AppTextInput(
                                                    // hintText: Translate.of(context).translate('first_name'),
                                                    // errorText: Translate.of(context).translate(_validFirstName),
                                                    icon: Icon(Icons.clear),
                                                    controller: _nameController,
                                                    focusNode: _focusFirstName,
                                                    textInputAction: TextInputAction.next,
                                                    onChanged: (text) {
                                                      setState(() {
                                                        _nameController.text = text;
                                                        // _validFirstName = UtilValidator.validate(
                                                        //   data: _nameController.text,
                                                        // );
                                                      });
                                                    },
                                                    // onSubmitted: (text) {
                                                    //   UtilOther.fieldFocusChange(context, _focusName, _focusLastName);
                                                    // },
                                                    // onTapIcon: () async {
                                                    //   await Future.delayed(Duration(milliseconds: 100));
                                                    //   _textFirstNameController.clear();
                                                    // },
                                                  )


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
                                      userid: companyData![0].userId.toString(),
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


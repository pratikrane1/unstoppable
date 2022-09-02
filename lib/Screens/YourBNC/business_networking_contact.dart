
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unstoppable/Models/get_BNC_model.dart';
import 'package:unstoppable/Models/productName_model.dart';
import 'package:unstoppable/NetworkFunction/fetchProductName.dart';
import 'package:unstoppable/widgets/drawer.dart';

import '../../Blocs/businessOpportunity/businessOpportunity_bloc.dart';
import '../../Blocs/businessOpportunity/businessOpportunity_event.dart';
import '../../Blocs/businessOpportunity/businessOpportunity_state.dart';
import '../../Models/category_model.dart';
import '../../Models/subCategory_model.dart';
import '../../Models/subSubCategory_model.dart';
import '../../NetworkFunction/fetchCategory.dart';
import '../../NetworkFunction/fetchSubCategory.dart';
import '../../NetworkFunction/fetchSubSubCategory.dart';
import '../../Utils/application.dart';
import '../../constant/theme_colors.dart';
import '../bottom_navbar.dart';
import 'business_networking_lead.dart';

class BusinessNetworkingContact extends StatefulWidget{
  // String? rowId;
  GetBNCmodel LeadList;

  BusinessNetworkingContact({Key? key, required this.LeadList,}) : super(key: key);

  @override
  State<BusinessNetworkingContact> createState() => _BusinessNetworkingContactState();
}

class _BusinessNetworkingContactState extends State<BusinessNetworkingContact>{
  BusinessOpprtunityBloc? _businessOpprtunityBloc;
  List<GetBNCmodel> LeadList=[];
  GetBNCmodel? data;
  CategoryModel? categoryModelselected;
  SubSubCategoryModel? subsubcategoryModelselected;
  SubCategoryModel? subcategoryModelselected;
  ProductNameModel? productNameModelselected;
  String typeValue = "Seller";
  List<String> typeList = ["Seller","Buyer"];
  final type = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool flagLoading=false;

  void initState() {
    // TODO: implement initState
    super.initState();
    // _businessOpprtunityBloc = BlocProvider.of<BusinessOpprtunityBloc>(context);
    // _businessOpprtunityBloc!.add(OnLoadingBNC(
    //   userid: Application.vendorLogin!.userId.toString(), rowid: widget.rowId.toString(),
    // ));

    if(widget.LeadList!=null){
      setData();

    }
    // for update product
    // if(widget.rowId!=null){
    //   getSubCategoryByCategoryData();
    //   getSubSubCategoryBySubCatData();
    //
    // }
  }

  setData(){

      CategoryModel categoryModel = CategoryModel();
      categoryModel.catId =widget.LeadList.catId;
      categoryModel.catName = widget.LeadList.catName;
      categoryModelselected = categoryModel;


      SubCategoryModel subCategoryModel = SubCategoryModel();
      subCategoryModel.subcatId = widget.LeadList.subCatId;
      subCategoryModel.subCatName = widget.LeadList.subCatName;
      subcategoryModelselected = subCategoryModel;

      SubSubCategoryModel subsubCategoryModel = SubSubCategoryModel();
      subsubCategoryModel.sscatId=widget.LeadList.sscatId;
      subsubCategoryModel.ssCatName = widget.LeadList.ssCatName;
      subsubcategoryModelselected = subsubCategoryModel;

      ProductNameModel productNameModel = ProductNameModel();
      productNameModel.prodId = widget.LeadList.productId;
      productNameModel.prodName = widget.LeadList.prodName;
      productNameModelselected = productNameModel;

  }
  // void getSubCategoryByCategoryData()
  // {
  //   CategoryModel categoryModel=CategoryModel();
  //   categoryModel.catId=widget.bnCmodel.catId;
  //    categoryModel.catName=widget.bnCmodel.catName;
  //   categoryModelselected=categoryModel;
  //
  // }
  //
  // void getSubSubCategoryBySubCatData()
  // {
  //   SubCategoryModel subCategoryModel=SubCategoryModel();
  //   subCategoryModel.subcatId=widget.bnCmodel.subCatId;
  //  subCategoryModel.subCatName=widget.bnCmodel.subCatName;
  //   subcategoryModelselected=subCategoryModel;
  //
  //   SubSubCategoryModel subsubCategoryModel=SubSubCategoryModel();
  //   subsubCategoryModel.ssCatName=widget.bnCmodel.ssCatName;
  //   subsubcategoryModelselected=subsubCategoryModel;
  //
  //   ProductNameModel productNameModel=ProductNameModel();
  //   productNameModel.prodName=widget.bnCmodel.prodName;
  //   productNameModelselected=productNameModel;
  // }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pushReplacement(context,
        //         MaterialPageRoute(builder: (context) => DrawerWidget(context)));
        //   },
        //   child: Icon(Icons.arrow_back_ios),
        // ),
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Business Networking'),
      ),
      body:  Container(
        decoration: new BoxDecoration(
          //borderRadius: new BorderRadius.circular(16.0),
          color: Colors.black12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: ListView(
                        children: [
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

                          //for productName
                          Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
                              //to hide underline
                              child: FutureBuilder<List<ProductNameModel>>(
                                  future: fetchProductName(subsubcategoryModelselected!=null?subsubcategoryModelselected!.sscatId.toString():""),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<ProductNameModel>> snapshot) {
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
                                                        .map((productName) =>
                                                        DropdownMenuItem<ProductNameModel>(
                                                          value: productName,
                                                          child: Text(
                                                            productName.prodName.toString(),
                                                            style: TextStyle(
                                                                color: Colors.black),
                                                          ),
                                                        ))
                                                        .toList(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w600),
                                                    isExpanded: true,
                                                    hint: Text('Select Product Name',
                                                        style: TextStyle(
                                                            color: Color(0xFF3F4141))),
                                                    value: productNameModelselected == null
                                                        ? productNameModelselected
                                                        : snapshot.data!
                                                        .where((i) =>
                                                    i.prodName ==
                                                        productNameModelselected!
                                                            .prodName)
                                                        .first as ProductNameModel,
                                                    onChanged: (ProductNameModel? productName) {

                                                      setState(() {
                                                        productNameModelselected = productName;
                                                      });
                                                    })),
                                          ),
                                        ));
                                  })),

                          //For Type
                          Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
                            child: Container(
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                  hintStyle: TextStyle(fontSize: 12),
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
                                  hintText: "Type",
                                ),
                                value: typeValue,
                                items: typeList
                                    .map(
                                      (String item) => DropdownMenuItem<String>(
                                    child: Text(item),
                                    value: item,
                                  ),
                                )
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    typeValue = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ),
              ),
              SizedBox(height: 15,),
              // UpdateButton
              BlocBuilder<BusinessOpprtunityBloc,BusinessOpportunityState>(builder: (context,updateBNC){
                return BlocListener<BusinessOpprtunityBloc,BusinessOpportunityState>(listener: (context,state){
                  if(state is AddBNCSuccess){
                    Fluttertoast.showToast(msg: state.message.toString());
                    flagLoading=false;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BusinessNetworkingLead()));
                  }
                  if(state is GetBNCLoading){
                    flagLoading=true;

                  }
                  if(state is GetBNCLoadFail){
                    flagLoading=false;

                    Fluttertoast.showToast(msg: state.message.toString());
                  }

                  // if(state is UpdateProductSuccess){
                  //
                  //   flagLoading=false;
                  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UnstoppableProducts()));
                  // }
                  // if(state is UpdateProductFail){
                  //   flagLoading=false;
                  //
                  //   Fluttertoast.showToast(msg: "");
                  // }
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
                                //  if(categoryModelselected==null){
                                //   Fluttertoast.showToast(msg: "Please select category");
                                // }else if(subcategoryModelselected==null){
                                //   Fluttertoast.showToast(msg: "Please select sub category");
                                // }else if(subsubcategoryModelselected==null){
                                //   Fluttertoast.showToast(msg: "Please select sub sub category");
                                // }else if(productNameModelselected==null){
                                //    Fluttertoast.showToast(msg: "Please select Product Name");
                                //  }
                                //  else
                                //    if(_formKey.currentState!.validate())
                                // {
                                //   Fluttertoast.showToast(msg: "Save Successfully");
                                //   if(widget.bnCmodel.productId!=null)
                                //   { //add api
                                _businessOpprtunityBloc!.add(UpdateBNC(
                                  userid: Application.vendorLogin!.userId.toString(),
                                  catid: categoryModelselected!.catId.toString(),
                                  subcatid: subcategoryModelselected!.subcatId.toString(),
                                  sscatid: subsubcategoryModelselected!.sscatId.toString(),
                                  productid:productNameModelselected!.prodId.toString(),
                                  type: typeValue,
                                  rowid: "",
                                  id: "" ,


                                )
                                );
                                // }
                                // else{
                                //   Fluttertoast.showToast(msg: "Could not save  Data");
                                // }


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
                      ),
                    )
                );
              }),
            ],
          ),
        ),
      )
      // BlocBuilder<BusinessOpprtunityBloc, BusinessOpportunityState>(builder: (context, state) {
      //   if (state is GetBNCLoadSuccess) {
      //     LeadList = state.getBNCLeadList!;
      //     // data = LeadList[0];
      //     // companyData = state.companyProfileData;
      //     // setData(companyData!);
      //     setData(LeadList);
      //   }
      //
      //   // if(state is CompanyProfileListLoadFail){
      //   //   // companyData=[];
      //   //   // setData(companyData!);
      //   //   // setData();
      //   // }
      //
      //   return
      //     Container(
      //       decoration: new BoxDecoration(
      //         //borderRadius: new BorderRadius.circular(16.0),
      //         color: Colors.black12,
      //       ),
      //       child: Padding(
      //         padding: const EdgeInsets.all(15.0),
      //         child: Column(
      //           children: [
      //             SingleChildScrollView(
      //               scrollDirection: Axis.vertical,
      //               child: Container(
      //                 height: 350,
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(16),
      //                 ),
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Expanded(
      //                     child: ListView(
      //                       children: [
      //                         //for category
      //                         Padding(
      //                             padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
      //                             //to hide underline
      //                             child: FutureBuilder<List<CategoryModel>>(
      //                                 future: fetchCategory(),
      //                                 builder: (BuildContext context,
      //                                     AsyncSnapshot<List<CategoryModel>> snapshot) {
      //                                   if (!snapshot.hasData) return Container();
      //
      //                                   return DropdownButtonHideUnderline(
      //                                       child: Container(
      //                                         width: MediaQuery.of(context).size.width,
      //                                         decoration: BoxDecoration(
      //                                           // color: Theme.of(context).dividerColor,
      //                                             color: Colors.white,
      //                                             borderRadius: BorderRadius.circular(20.0),
      //                                             border: Border.all(
      //                                                 color: ThemeColors.textFieldBgColor)),
      //                                         child: Padding(
      //                                           padding: EdgeInsets.only(
      //                                               left: 15.0, top: 0.0, right: 5.0, bottom: 0.0),
      //                                           child:
      //                                           //updated on 15/06/2021 to change background colour of dropdownbutton
      //                                           new Theme(
      //                                               data: Theme.of(context)
      //                                                   .copyWith(canvasColor: Colors.white),
      //                                               child: DropdownButton(
      //                                                   items: snapshot.data!
      //                                                       .map((category) =>
      //                                                       DropdownMenuItem<CategoryModel>(
      //                                                         value: category,
      //                                                         child: Text(
      //                                                           category.catName.toString(),
      //                                                           style: TextStyle(
      //                                                               color: Colors.black),
      //                                                         ),
      //                                                       ))
      //                                                       .toList(),
      //                                                   style: TextStyle(
      //                                                       color: Colors.black,
      //                                                       fontWeight: FontWeight.w600),
      //                                                   isExpanded: true,
      //                                                   hint: Text('Select Category',
      //                                                       style: TextStyle(
      //                                                           color: Color(0xFF3F4141))),
      //                                                   value: categoryModelselected == null
      //                                                       ? categoryModelselected
      //                                                       : snapshot.data!
      //                                                       .where((i) =>
      //                                                   i.catName ==
      //                                                       categoryModelselected!
      //                                                           .catName)
      //                                                       .first as CategoryModel,
      //                                                   onChanged: (CategoryModel? category) {
      //                                                     subcategoryModelselected=null;
      //                                                     subsubcategoryModelselected=null;
      //                                                     setState(() {
      //                                                       categoryModelselected = category;
      //                                                     });
      //                                                   })),
      //                                         ),
      //                                       ));
      //                                 })),
      //                         //for subcategory
      //                         Padding(
      //                             padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
      //                             //to hide underline
      //                             child: FutureBuilder<List<SubCategoryModel>>(
      //                                 future: fetchSubCategory(categoryModelselected!=null?categoryModelselected!.catId.toString():""),
      //                                 builder: (BuildContext context,
      //                                     AsyncSnapshot<List<SubCategoryModel>> snapshot) {
      //                                   if (!snapshot.hasData) return Container();
      //
      //                                   return DropdownButtonHideUnderline(
      //                                       child: Container(
      //                                         width: MediaQuery.of(context).size.width,
      //                                         decoration: BoxDecoration(
      //                                           // color: Theme.of(context).dividerColor,
      //                                             color: Colors.white,
      //                                             borderRadius: BorderRadius.circular(20.0),
      //                                             border: Border.all(
      //                                                 color: ThemeColors.textFieldBgColor)),
      //                                         child: Padding(
      //                                           padding: EdgeInsets.only(
      //                                               left: 15.0, top: 0.0, right: 5.0, bottom: 0.0),
      //                                           child:
      //                                           //updated on 15/06/2021 to change background colour of dropdownbutton
      //                                           Theme(
      //                                               data: Theme.of(context)
      //                                                   .copyWith(canvasColor: Colors.white),
      //                                               child: DropdownButton(
      //                                                   items: snapshot.data!
      //                                                       .map((subcategory) =>
      //                                                       DropdownMenuItem<SubCategoryModel>(
      //                                                         value: subcategory,
      //                                                         child: Text(
      //                                                           subcategory.subCatName.toString(),
      //                                                           style: TextStyle(
      //                                                               color: Colors.black),
      //                                                         ),
      //                                                       ))
      //                                                       .toList(),
      //                                                   style: TextStyle(
      //                                                       color: Colors.black,
      //                                                       fontWeight: FontWeight.w600),
      //                                                   isExpanded: true,
      //                                                   hint: Text('Select Sub Category',
      //                                                       style: TextStyle(
      //                                                           color: Color(0xFF3F4141))),
      //                                                   value: subcategoryModelselected == null
      //                                                       ? subcategoryModelselected
      //                                                       : snapshot.data!
      //                                                       .where((i) =>
      //                                                   i.subCatName ==
      //                                                       subcategoryModelselected!
      //                                                           .subCatName)
      //                                                       .first as SubCategoryModel,
      //                                                   onChanged: (SubCategoryModel? subCategory) {
      //                                                     subsubcategoryModelselected=null;
      //                                                     setState(() {
      //                                                       subcategoryModelselected = subCategory;
      //                                                     });
      //                                                   })),
      //                                         ),
      //                                       ));
      //                                 })),
      //
      //                         //for subsubcategory
      //                         Padding(
      //                             padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
      //                             //to hide underline
      //                             child: FutureBuilder<List<SubSubCategoryModel>>(
      //                                 future: fetchSubSubCategory(subcategoryModelselected!=null?subcategoryModelselected!.subcatId.toString():""),
      //                                 builder: (BuildContext context,
      //                                     AsyncSnapshot<List<SubSubCategoryModel>> snapshot) {
      //                                   if (!snapshot.hasData) return Container();
      //
      //                                   return DropdownButtonHideUnderline(
      //                                       child: Container(
      //                                         width: MediaQuery.of(context).size.width,
      //                                         decoration: BoxDecoration(
      //                                           // color: Theme.of(context).dividerColor,
      //                                             color: Colors.white,
      //                                             borderRadius: BorderRadius.circular(20.0),
      //                                             border: Border.all(
      //                                                 color: ThemeColors.textFieldBgColor)),
      //                                         child: Padding(
      //                                           padding: EdgeInsets.only(
      //                                               left: 15.0, top: 0.0, right: 5.0, bottom: 0.0),
      //                                           child:
      //                                           //updated on 15/06/2021 to change background colour of dropdownbutton
      //                                           Theme(
      //                                               data: Theme.of(context)
      //                                                   .copyWith(canvasColor: Colors.white),
      //                                               child: DropdownButton(
      //                                                   items: snapshot.data!
      //                                                       .map((subsubcategory) =>
      //                                                       DropdownMenuItem<SubSubCategoryModel>(
      //                                                         value: subsubcategory,
      //                                                         child: Text(
      //                                                           subsubcategory.ssCatName.toString(),
      //                                                           style: TextStyle(
      //                                                               color: Colors.black),
      //                                                         ),
      //                                                       ))
      //                                                       .toList(),
      //                                                   style: TextStyle(
      //                                                       color: Colors.black,
      //                                                       fontWeight: FontWeight.w600),
      //                                                   isExpanded: true,
      //                                                   hint: Text('Select Sub sub Category',
      //                                                       style: TextStyle(
      //                                                           color: Color(0xFF3F4141))),
      //                                                   value: subsubcategoryModelselected == null
      //                                                       ? subsubcategoryModelselected
      //                                                       : snapshot.data!
      //                                                       .where((i) =>
      //                                                   i.ssCatName ==
      //                                                       subsubcategoryModelselected!
      //                                                           .ssCatName)
      //                                                       .first as SubSubCategoryModel,
      //                                                   onChanged: (SubSubCategoryModel? subsubCategory) {
      //
      //                                                     setState(() {
      //                                                       subsubcategoryModelselected = subsubCategory;
      //                                                     });
      //                                                   })),
      //                                         ),
      //                                       ));
      //                                 })),
      //
      //                         //for productName
      //                         Padding(
      //                             padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
      //                             //to hide underline
      //                             child: FutureBuilder<List<ProductNameModel>>(
      //                                 future: fetchProductName(subsubcategoryModelselected!=null?subsubcategoryModelselected!.sscatId.toString():""),
      //                                 builder: (BuildContext context,
      //                                     AsyncSnapshot<List<ProductNameModel>> snapshot) {
      //                                   if (!snapshot.hasData) return Container();
      //
      //                                   return DropdownButtonHideUnderline(
      //                                       child: Container(
      //                                         width: MediaQuery.of(context).size.width,
      //                                         decoration: BoxDecoration(
      //                                           // color: Theme.of(context).dividerColor,
      //                                             color: Colors.white,
      //                                             borderRadius: BorderRadius.circular(20.0),
      //                                             border: Border.all(
      //                                                 color: ThemeColors.textFieldBgColor)),
      //                                         child: Padding(
      //                                           padding: EdgeInsets.only(
      //                                               left: 15.0, top: 0.0, right: 5.0, bottom: 0.0),
      //                                           child:
      //                                           //updated on 15/06/2021 to change background colour of dropdownbutton
      //                                           Theme(
      //                                               data: Theme.of(context)
      //                                                   .copyWith(canvasColor: Colors.white),
      //                                               child: DropdownButton(
      //                                                   items: snapshot.data!
      //                                                       .map((productName) =>
      //                                                       DropdownMenuItem<ProductNameModel>(
      //                                                         value: productName,
      //                                                         child: Text(
      //                                                           productName.prodName.toString(),
      //                                                           style: TextStyle(
      //                                                               color: Colors.black),
      //                                                         ),
      //                                                       ))
      //                                                       .toList(),
      //                                                   style: TextStyle(
      //                                                       color: Colors.black,
      //                                                       fontWeight: FontWeight.w600),
      //                                                   isExpanded: true,
      //                                                   hint: Text('Select Product Name',
      //                                                       style: TextStyle(
      //                                                           color: Color(0xFF3F4141))),
      //                                                   value: productNameModelselected == null
      //                                                       ? productNameModelselected
      //                                                       : snapshot.data!
      //                                                       .where((i) =>
      //                                                   i.prodName ==
      //                                                       productNameModelselected!
      //                                                           .prodName)
      //                                                       .first as ProductNameModel,
      //                                                   onChanged: (ProductNameModel? productName) {
      //
      //                                                     setState(() {
      //                                                       productNameModelselected = productName;
      //                                                     });
      //                                                   })),
      //                                         ),
      //                                       ));
      //                                 })),
      //
      //                         //For Type
      //                         Padding(
      //                           padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
      //                           child: Container(
      //                             child: DropdownButtonFormField<String>(
      //                               decoration: const InputDecoration(
      //                                 contentPadding:
      //                                 EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      //                                 hintStyle: TextStyle(fontSize: 12),
      //                                 enabledBorder: OutlineInputBorder(
      //                                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
      //                                   borderSide:
      //                                   BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
      //                                 ),
      //                                 focusedBorder: OutlineInputBorder(
      //                                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
      //                                   borderSide:
      //                                   BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor),
      //                                 ),
      //                                 border: OutlineInputBorder(
      //                                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
      //                                     borderSide:
      //                                     BorderSide(width: 0.8, color: ThemeColors.textFieldBgColor)),
      //                                 hintText: "Type",
      //                               ),
      //                               value: typeValue,
      //                               items: typeList
      //                                   .map(
      //                                     (String item) => DropdownMenuItem<String>(
      //                                   child: Text(item),
      //                                   value: item,
      //                                 ),
      //                               )
      //                                   .toList(),
      //                               onChanged: (String? value) {
      //                                 setState(() {
      //                                   typeValue = value!;
      //                                 });
      //                               },
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //
      //               ),
      //             ),
      //             SizedBox(height: 15,),
      //             // UpdateButton
      //             BlocBuilder<BusinessOpprtunityBloc,BusinessOpportunityState>(builder: (context,updateBNC){
      //               return BlocListener<BusinessOpprtunityBloc,BusinessOpportunityState>(listener: (context,state){
      //                 if(state is AddBNCSuccess){
      //                   Fluttertoast.showToast(msg: state.message.toString());
      //                   flagLoading=false;
      //                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BusinessNetworkingLead()));
      //                 }
      //                 if(state is GetBNCLoading){
      //                   flagLoading=true;
      //
      //                 }
      //                 if(state is GetBNCLoadFail){
      //                   flagLoading=false;
      //
      //                   Fluttertoast.showToast(msg: state.message.toString());
      //                 }
      //
      //                 // if(state is UpdateProductSuccess){
      //                 //
      //                 //   flagLoading=false;
      //                 //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UnstoppableProducts()));
      //                 // }
      //                 // if(state is UpdateProductFail){
      //                 //   flagLoading=false;
      //                 //
      //                 //   Fluttertoast.showToast(msg: "");
      //                 // }
      //               },
      //                   child:
      //                   Padding(
      //                     padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
      //                     child: Center(
      //                       child: ClipRRect(
      //                         borderRadius: BorderRadius.circular(0),
      //                         child: SizedBox(
      //                           width: MediaQuery.of(context).size.width,
      //                           height: 40,
      //                           child: ElevatedButton(
      //                             style: ElevatedButton.styleFrom(
      //                               primary: ThemeColors.drawerTextColor,
      //                             ),
      //                             onPressed: () {
      //                               //  if(categoryModelselected==null){
      //                               //   Fluttertoast.showToast(msg: "Please select category");
      //                               // }else if(subcategoryModelselected==null){
      //                               //   Fluttertoast.showToast(msg: "Please select sub category");
      //                               // }else if(subsubcategoryModelselected==null){
      //                               //   Fluttertoast.showToast(msg: "Please select sub sub category");
      //                               // }else if(productNameModelselected==null){
      //                               //    Fluttertoast.showToast(msg: "Please select Product Name");
      //                               //  }
      //                               //  else
      //                               //    if(_formKey.currentState!.validate())
      //                               // {
      //                               //   Fluttertoast.showToast(msg: "Save Successfully");
      //                               //   if(widget.bnCmodel.productId!=null)
      //                               //   { //add api
      //                               _businessOpprtunityBloc!.add(UpdateBNC(
      //                                 userid: Application.vendorLogin!.userId.toString(),
      //                                 catid: categoryModelselected!.catId.toString(),
      //                                 subcatid: subcategoryModelselected!.subcatId.toString(),
      //                                 sscatid: subsubcategoryModelselected!.sscatId.toString(),
      //                                 productid:productNameModelselected!.prodId.toString(),
      //                                 type: typeValue,
      //                                 rowid: widget.rowId.toString(),
      //                                 id: "" ,
      //
      //
      //                               )
      //                               );
      //                               // }
      //                               // else{
      //                               //   Fluttertoast.showToast(msg: "Could not save  Data");
      //                               // }
      //
      //
      //                               // }
      //                             },
      //                             child: Text(
      //                               'Save',
      //                               style: TextStyle(
      //                                 fontSize: 18,
      //                                 fontWeight: FontWeight.w400,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   )
      //               );
      //             }),
      //           ],
      //         ),
      //       ),
      //     );
      // }
      // )

    );
  }

}

// Widget _UpdateButton(BuildContext context) {
//   return Center(
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(0),
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: 40,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: ThemeColors.drawerTextColor,
//           ),
//           onPressed: () {},
//           child: Text(
//             'Save',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
//
// Widget _List(BuildContext context){
//   return SingleChildScrollView(
//     scrollDirection: Axis.vertical,
//     child: Container(
//       height: 600,
//       decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(16),
//     ),
//       child: ListView(
//         children: [
//           _Category(context),
//           _SubCategory(context),
//           _SubSubCategory(context),
//           _ProductName(context),
//           _Type(context)
//         ],
//       ),
//
//     ),
//   );
// }
// Widget _Category(BuildContext context){
//   return Card(
//     elevation: 1,
//     margin: EdgeInsets.all(10),
//     color: Colors.white,
//     shadowColor: Colors.blueGrey,
//     shape:  OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
//     ),
//     child: Container(
//
//       child: ExpansionTile(
//
//         // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
//         title: Text('Category', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//                       width: 0.3,
//                     )
//                 )
//             ),
//             child: ListTile(
//               onTap: (){},
//               title: const Text('Not Intrested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//             ),
//           ),
//           ListTile(
//             onTap: (){
//               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));
//
//             },
//             title: const Text('Complete', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget _SubCategory(BuildContext context){
//   return Card(
//     elevation: 1,
//     margin: EdgeInsets.all(10),
//     color: Colors.white,
//     shadowColor: Colors.blueGrey,
//     shape:  OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
//     ),
//     child: Container(
//
//       child: ExpansionTile(
//
//         // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
//         title: Text('Sub Category', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//                       width: 0.3,
//                     )
//                 )
//             ),
//             child: ListTile(
//               onTap: (){},
//               title: const Text('Not Interested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//             ),
//           ),
//           ListTile(
//             onTap: (){
//               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));
//
//             },
//             title: const Text('Completed', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget _SubSubCategory(BuildContext context){
//   return Card(
//     elevation: 1,
//     margin: EdgeInsets.all(10),
//     color: Colors.white,
//     shadowColor: Colors.blueGrey,
//     shape:  OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
//     ),
//     child: Container(
//
//       child: ExpansionTile(
//
//         // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
//         title: Text('Sub Sub Category', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//                       width: 0.3,
//                     )
//                 )
//             ),
//             child: ListTile(
//               onTap: (){},
//               title: const Text('Not Interested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//             ),
//           ),
//           ListTile(
//             onTap: (){
//               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));
//
//             },
//             title: const Text('Completed', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget _ProductName(BuildContext context){
//   return Card(
//     elevation: 1,
//     margin: EdgeInsets.all(10),
//     color: Colors.white,
//     shadowColor: Colors.blueGrey,
//     shape:  OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
//     ),
//     child: Container(
//
//       child: ExpansionTile(
//
//         // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
//         title: Text('Product Name', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//                       width: 0.3,
//                     )
//                 )
//             ),
//             child: ListTile(
//               onTap: (){},
//               title: const Text('Not Interested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//             ),
//           ),
//           ListTile(
//             onTap: (){
//               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));
//
//             },
//             title: const Text('Completed', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget _Type(BuildContext context){
//   return Card(
//     elevation: 1,
//     margin: EdgeInsets.all(10),
//     color: Colors.white,
//     shadowColor: Colors.blueGrey,
//     shape:  OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: ThemeColors.drawerTextColor, width: 1)
//     ),
//     child: Container(
//
//       child: ExpansionTile(
//
//         // leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle, color: ThemeColors.drawerTextColor,),
//         title: Text('Type', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//                       width: 0.3,
//                     )
//                 )
//             ),
//             child: ListTile(
//               onTap: (){},
//               title: const Text('Not Interested', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//             ),
//           ),
//           ListTile(
//             onTap: (){
//               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessNetworking()));
//
//             },
//             title: const Text('Completed', style: TextStyle(color: ThemeColors.drawerTextColor, fontSize: 16),),
//           ),
//         ],
//       ),
//     ),
//   );
// }
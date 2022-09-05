
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

class BusinessNetworkingContactUpdated extends StatefulWidget{
  // GetBNCmodel LeadList;

  BusinessNetworkingContactUpdated({Key? key}) : super(key: key);

  @override
  State<BusinessNetworkingContactUpdated> createState() => _BusinessNetworkingContactUpdatedState();
}

class _BusinessNetworkingContactUpdatedState extends State<BusinessNetworkingContactUpdated>{
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



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _businessOpprtunityBloc = BlocProvider.of<BusinessOpprtunityBloc>(context);


    // if(widget.LeadList.id!=null){
    //   // setData();
    //   getSubCategoryByCategoryData();
    //   getProductCategoryBygetSubSubCategoryBySubCatData();
    //   setData();
    //
    // }

  }
  // void setData(){
  //   typeValue = widget.LeadList.type.toString();
  // }
  //
  //
  // void getSubCategoryByCategoryData() {
  //   CategoryModel categoryModel = CategoryModel();
  //   categoryModel.catId = widget.LeadList.catId;
  //   categoryModel.catName = widget.LeadList.catName;
  //   categoryModelselected = categoryModel;
  // }
  //
  // void getProductCategoryBygetSubSubCategoryBySubCatData() {
  //   SubCategoryModel subCategoryModel = SubCategoryModel();
  //   subCategoryModel.subcatId = widget.LeadList.subCatId;
  //   subCategoryModel.subCatName = widget.LeadList.subCatName;
  //   subcategoryModelselected = subCategoryModel;
  //
  //   SubSubCategoryModel subsubCategoryModel = SubSubCategoryModel();
  //   subsubCategoryModel.sscatId = widget.LeadList.sscatId;
  //   subsubCategoryModel.ssCatName = widget.LeadList.ssCatName;
  //   subsubcategoryModelselected = subsubCategoryModel;
  //
  //   ProductNameModel productNameModel = ProductNameModel();
  //   productNameModel.prodId = widget.LeadList.productId;
  //   productNameModel.prodName = widget.LeadList.prodName;
  //   productNameModelselected = productNameModel;
  // }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BusinessNetworkingLead()));
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: ThemeColors.baseThemeColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Business Networking'),
        ),
        body:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
            Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child:

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
                                                                        subsubcategoryModelselected=null;
                                                                        productNameModelselected=null;
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
                                                                        productNameModelselected=null;

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
                                                                        productNameModelselected = null;
                                                                        setState(() {
                                                                          subsubcategoryModelselected = subsubCategory;
                                                                        });
                                                                      })),
                                                            ),
                                                          ));
                                                    })),
                                            const SizedBox(height: 15,),

                                            //Product Category DropDown
                                            const Align(alignment: Alignment.topLeft,
                                                child: Text("Product Category:", textAlign: TextAlign.start,)),
                                            // const SizedBox(height: 30,),
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
                                                                      hint: Text('Select Sub sub Category',
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
                                            const SizedBox(height: 15,),

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


            )

        )


    );
  }

}


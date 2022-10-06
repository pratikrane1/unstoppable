import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unstoppable/Screens/search_page.dart';
import '../Blocs/manageAllBuyingRequirement/manageAllBuyingRequirement_block.dart';
import '../Blocs/manageAllBuyingRequirement/manageAllBuyingRequirement_state.dart';
import '../Blocs/manageAllBuyingRequirement/manageAllBuyingRequirements_event.dart';
import '../Models/category_model.dart';
import '../Models/subCategory_model.dart';
import '../Models/subSubCategory_model.dart';
import '../NetworkFunction/fetchCategory.dart';
import '../NetworkFunction/fetchSubCategory.dart';
import '../Utils/application.dart';
import '../constant/theme_colors.dart';
import '../widgets/bell_icon.dart';
import '../widgets/drawer.dart';
import 'package:group_radio_button/group_radio_button.dart';

import 'bottom_navbar.dart';


class BuyingRequirmentSubmit  extends StatefulWidget{
  @override
  State<BuyingRequirmentSubmit> createState() => _BuyingRequirmentSubmitState();
}

class _BuyingRequirmentSubmitState extends State<BuyingRequirmentSubmit> {
  ManageAllBuyingRequirementBloc? _allBuyingRequirementBloc;

  String radioBtnType = "Automatic";
  int typeId = 1;
  String useRadioBtn = "Agriculture";
  int useId = 1;
  String suppRadioBtn = "Domestic";
  int suppId = 1;
  String SuppWillRadioBtn = "Manufacturing";
  int suppWillId = 1;
  final _formKey = GlobalKey<FormState>();
  CategoryModel? categoryModelselected;
  SubSubCategoryModel? subsubcategoryModelselected;
  SubCategoryModel? subcategoryModelselected;
 final _ProdNameController = TextEditingController();
 final _discription = TextEditingController();
 String approxValue = "999 to 9999";
 List<String> appValue = ["999 to 9999", "10000 to 15999", "16000 to 19999", "20000 to 24999", "25000 to 50000", "50000 and more"];

  String typeValue = "Kilogram";
  List<String> typeList = ["Kilogram", "Gram", "Piece", "Rolls", "Short Ton", "Nos", "Tons", "Units", "20'Containers", "40'Container", "Bags", "Liters", "Barrel", "Bottles",
  "Boxes", "Bushel", "Packs", "Metric Tons", "Meter", "Dozens", "Watt", "Kilowatt", "Kilometer","Hectare", "Gallon","Ounce","Foot",
  "Square Feet", "Sets", "Pound", "Cartons", "Packets", "Pair", "Reams", "Sheets", "Square Meters"];

  String quantityValue = "1";
  List<String> quanList = ["1", "2", "3", "4","5"];


  void initState() {
    // TODO: implement initState
    super.initState();

    _allBuyingRequirementBloc = BlocProvider.of<ManageAllBuyingRequirementBloc>(context);

  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _ProdNameController.clear();
    _discription.clear();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Buying Requirements"),

                myAppBarIcon(),
              ],
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),

     body:Container(
        decoration: new BoxDecoration(
          //borderRadius: new BorderRadius.circular(16.0),
          color: Colors.black12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrange),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        //Category
                        // DropdownButtonFormField<String>(
                        //   decoration: const InputDecoration(
                        //     contentPadding:
                        //     EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        //     hintStyle: TextStyle(fontSize: 12),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        //       borderSide:
                        //       BorderSide(width: 0.8, color:Colors.black),
                        //     ),
                        //     focusedBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        //       borderSide:
                        //       BorderSide(width: 0.8, color:Colors.black),
                        //     ),
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        //         borderSide:
                        //         BorderSide(width: 0.8, color:Colors.black)),
                        //     hintText: "Select Category",
                        //   ),
                        //   // value: selectedValue,
                        //   items: ['A', 'B', 'C']
                        //       .map(
                        //         (String item) => DropdownMenuItem<String>(
                        //       child: Text(item),
                        //       value: item,
                        //     ),
                        //   )
                        //       .toList(),
                        //   onChanged: (String? value) {
                        //     // setState(() {
                        //     //   selectedValue = value;
                        //     // });
                        //   },
                        // ),
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
                                                    // subsubcategoryModelselected=null;
                                                    setState(() {
                                                      categoryModelselected = category;
                                                    });
                                                  })),
                                        ),
                                      ));
                                })),
                        SizedBox(height: 8,),

                        //Sub-Category
                  Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
                      //to hide underline
                      child: FutureBuilder<List<SubCategoryModel>>(
                          future: fetchSubCategory(categoryModelselected!=null?categoryModelselected!.catId.toString():"No Sub Category Available"),
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
                        SizedBox(height: 8,),


                        //Product Name
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            controller: _ProdNameController,
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
                        SizedBox(height: 8,),

                        //Type
                        Container(
                          child: Column(
                            children: [
                              Align(alignment: Alignment.topLeft, child: Text('Type:')),
                              SizedBox(
                                height: 0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [

                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            // _atomaticManualOther(),
                                            // _semiatomaticMultiporpose(),
                                            Radio(
                                              value: 1,
                                              groupValue: typeId,
                                              onChanged: (val) {
                                                setState(() {
                                                  radioBtnType = 'Automatic';
                                                  typeId = 1;
                                                });
                                              },
                                            ),
                                            Text(
                                              'Automatic',
                                              style: new TextStyle(fontSize: 13.0),
                                            ),
                                            SizedBox(width: 10,),
                                                    Radio(
                                                      value: 2,
                                                      groupValue: typeId,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          radioBtnType = 'Semi Automatic';
                                                          typeId = 2;
                                                        });
                                                      },
                                                    ),
                                                      Text(
                                                        'Semi Automatic',
                                                        style: new TextStyle(
                                                          fontSize: 13.0,
                                                        ),
                                                      ),

                                          ],
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Radio(
                                              value: 3,
                                              groupValue: typeId,
                                              onChanged: (val) {
                                                setState(() {
                                                  radioBtnType = 'Manual';
                                                  typeId = 3;
                                                });
                                              },
                                            ),
                                            Text(
                                              'Manual',
                                              style: new TextStyle(fontSize: 13.0),
                                            ),
                                            SizedBox(
                                              width: 24,
                                            ),

                                            Radio(
                                              value: 4,
                                              groupValue: typeId,
                                              onChanged: (val) {
                                                setState(() {
                                                  radioBtnType = 'Multipurpose';
                                                  typeId = 4;
                                                });
                                              },
                                            ),
                                            Text(
                                              'Multipurpose',
                                              style: new TextStyle(
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Radio(
                                              value: 5,
                                              groupValue: typeId,
                                              onChanged: (val) {
                                                setState(() {
                                                  radioBtnType = 'Other';
                                                  typeId = 5;
                                                });
                                              },
                                            ),
                                            Text(
                                              'Other',
                                              style: new TextStyle(fontSize: 13.0),
                                            ),


                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 5,),

                        //Use
                        Column(
                          children: [
                            Align(alignment: Alignment.topLeft, child: Text('Use:')),
                            SizedBox(
                              height: 0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [

                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Radio(
                                            value: 1,
                                            groupValue: useId,
                                            onChanged: (val) {
                                              setState(() {
                                                useRadioBtn = 'Agriculture';
                                                useId = 1;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Agriculture',
                                            style: new TextStyle(fontSize: 13.0),
                                          ),
                                          SizedBox(width: 23,),
                                          Radio(
                                            value: 2,
                                            groupValue: useId,
                                            onChanged: (val) {
                                              setState(() {
                                                useRadioBtn = 'Commercial';
                                                useId = 2;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Commercial',
                                            style: new TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Radio(
                                            value: 3,
                                            groupValue: useId,
                                            onChanged: (val) {
                                              setState(() {
                                                useRadioBtn = 'End Use';
                                                useId = 3;
                                              });
                                            },
                                          ),
                                          Text(
                                            'End Use',
                                            style: new TextStyle(fontSize: 13.0),
                                          ),
                                          SizedBox(
                                            width: 40,
                                          ),

                                          Radio(
                                            value: 4,
                                            groupValue: useId,
                                            onChanged: (val) {
                                              setState(() {
                                                useRadioBtn = 'Industrial';
                                                useId = 4;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Industrial',
                                            style: new TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Radio(
                                            value: 5,
                                            groupValue: useId,
                                            onChanged: (val) {
                                              setState(() {
                                                useRadioBtn = 'Other';
                                                useId = 5;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Other',
                                            style: new TextStyle(fontSize: 13.0),
                                          ),


                                        ],
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),


                        //Approx value

                        Column(
                          children: [
                            Align(alignment: Alignment.topLeft, child: Text('Approximate Other Value (Rs.) :')),
                            SizedBox(
                              height: 5,
                            ),
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
                                hintText: "Approximate other value (Rs)",
                              ),
                              value: approxValue,
                              items: appValue
                                  .map(
                                    (String item) => DropdownMenuItem<String>(
                                  child: Text(item),
                                  value: item,
                                ),
                              )
                                  .toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  approxValue = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 8,),

                        //Unit Type & Quantity
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // width: MediaQuery.of(context).size.width * 0.35,
                              width: 130,
                              child: Column(
                                children: [
                                  //Unit Type
                                  Align(alignment: Alignment.topLeft, child: Text('Unit Type:')),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  DropdownButtonFormField<String>(
                                    isExpanded: true,
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
                                      hintText: "Unit Type",
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
                                ],
                              ),
                            ),
                            //SizedBox(height: 8,),

                            //Quantity
                            Container(
                              // width: MediaQuery.of(context).size.width * 0.3,
                              width: 130,
                              child: Column(
                                children: [

                                  Align(alignment: Alignment.topLeft, child: Text('Quantity:')),
                                  SizedBox(
                                    height: 5,
                                  ),
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
                                      hintText: "Quantity",
                                    ),
                                    value: quantityValue,
                                    items: quanList
                                        .map(
                                          (String item) => DropdownMenuItem<String>(
                                        child: Text(item),
                                        value: item,
                                      ),
                                    )
                                        .toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        quantityValue = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8,),
                          ],
                        ),

                        SizedBox(height: 8,),

                        //Supplier From
                        Column(
                          children: [
                            Align(alignment: Alignment.topLeft, child: Text('Supplier From:')),
                            SizedBox(
                              height: 0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:Padding(
                                    padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 8.0,),
                                    child: Column(
                                      children: [
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Radio(
                                              value: 1,
                                              groupValue: suppId,
                                              onChanged: (val) {
                                                setState(() {
                                                  suppRadioBtn = 'Domestic';
                                                  suppId = 1;
                                                });
                                              },
                                            ),
                                            Text(
                                              'Domestic',
                                              style: new TextStyle(fontSize: 13.0),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            Radio(
                                              value: 2,
                                              groupValue: suppId,
                                              onChanged: (val) {
                                                setState(() {
                                                  suppRadioBtn = 'State';
                                                  suppId = 2;
                                                });
                                              },
                                            ),
                                            Text(
                                              'State',
                                              style: new TextStyle(fontSize: 13.0),
                                            ),


                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                              value: 3,
                                              groupValue: suppId,
                                              onChanged: (val) {
                                                setState(() {
                                                  suppRadioBtn = 'National';
                                                  suppId = 3;
                                                });
                                              },
                                            ),
                                            Text(
                                              'National',
                                              style: new TextStyle(fontSize: 13.0),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),

                        //Supplier Will Be
                        Column(
                          children: [
                            Align(alignment: Alignment.topLeft, child: Text('Supplier Will Be:')),
                            SizedBox(
                              height: 0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [

                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Radio(
                                            value: 1,
                                            groupValue: suppWillId,
                                            onChanged: (val) {
                                              setState(() {
                                                SuppWillRadioBtn = 'Manufacturing';
                                                suppWillId = 1;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Manufacturing',
                                            style: new TextStyle(fontSize: 13.0),
                                          ),
                                          SizedBox(width: 23,),
                                          Radio(
                                            value: 2,
                                            groupValue: suppWillId,
                                            onChanged: (val) {
                                              setState(() {
                                                SuppWillRadioBtn = 'Exporter';
                                                suppWillId = 2;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Exporter',
                                            style: new TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Radio(
                                            value: 3,
                                            groupValue: suppWillId,
                                            onChanged: (val) {
                                              setState(() {
                                                SuppWillRadioBtn = 'Wholesaler';
                                                suppWillId = 3;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Wholesaler',
                                            style: new TextStyle(fontSize: 13.0),
                                          ),
                                          SizedBox(
                                            width: 43,
                                          ),

                                          Radio(
                                            value: 4,
                                            groupValue: suppWillId,
                                            onChanged: (val) {
                                              setState(() {
                                                SuppWillRadioBtn = 'Retailer';
                                                suppWillId = 4;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Retailer',
                                            style: new TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Radio(
                                            value: 5,
                                            groupValue: suppWillId,
                                            onChanged: (val) {
                                              setState(() {
                                                SuppWillRadioBtn = 'Consultant';
                                                suppWillId = 5;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Consultant',
                                            style: new TextStyle(fontSize: 13.0),
                                          ),
                                          SizedBox(
                                            width: 45,
                                          ),
                                          Radio(
                                            value: 6,
                                            groupValue: suppWillId,
                                            onChanged: (val) {
                                              setState(() {
                                                SuppWillRadioBtn = 'Freelancer';
                                                suppWillId = 6;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Freelancer',
                                            style: new TextStyle(fontSize: 13.0),
                                          ),


                                        ],
                                      ),

                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Radio(
                                            value: 7,
                                            groupValue: suppWillId,
                                            onChanged: (val) {
                                              setState(() {
                                                SuppWillRadioBtn = 'Service Provider';
                                                suppWillId = 7;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Service Provider',
                                            style: new TextStyle(fontSize: 13.0),
                                          ),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),

                        //Discription
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child:TextFormField(
                            controller: _discription,
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
                              hintText: "Discription",
                            ),
                            validator: (value) {
                              if(value==null || value.isEmpty){
                                return 'Please enter Description';
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

                        SizedBox(height: 5,),
                        BlocBuilder<ManageAllBuyingRequirementBloc, ManageAllBuyingRequirementState>(builder: (context, state) {
                          if (state is SaveBuyingRequiementFormSuccess) {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            BottomNavigation(index: 0,)));
                            Fluttertoast.showToast(msg:state.message);

                          }

                          if (state is SaveBuyingRequiementFormFailed) {
                            Fluttertoast.showToast(msg:state.message);

                          }


                          return
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
                                        _allBuyingRequirementBloc!.add(SaveBuyingRequirementForm(
                                          userid: Application.vendorLogin!.userId.toString(),
                                          categoryId: categoryModelselected!.catId.toString(),
                                          subCateId: subcategoryModelselected!.subcatId.toString(),
                                          prodName: _ProdNameController.text,
                                          type: radioBtnType,
                                          use: useRadioBtn,
                                          approx: approxValue,
                                          unitType: typeValue,
                                          quantity: quantityValue,
                                          suppFrom: suppRadioBtn,
                                          suppWill: SuppWillRadioBtn,
                                          descrip: _discription.text, other: '', other1: '',




                                        ));
                                      }else {
                                        Fluttertoast.showToast(msg: "Please fill the data");
                                      }
                                    },
                                    child: Text(
                                      'Submit',
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
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

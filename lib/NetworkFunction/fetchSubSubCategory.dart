import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Models/category_model.dart';
import 'package:unstoppable/Models/subCategory_model.dart';

import '../Models/subSubCategory_model.dart';


Future<List<SubSubCategoryModel>> fetchSubSubCategory(String subcatId) async{

  Map<String, String> params;
  params = {
    // 'category_id': categoryData==null?"":categoryData.catId.toString(),
    'sub_category_id': subcatId.toString(),
  };

  var response = await http.post(
      Uri.parse(Api.SubSubCategory),
      body: params
  );

  try{
    final resp = json.decode(response.body);
    List<SubSubCategoryModel> listOfsubsubCategory=[];
    SubSubCategoryModel subsubcategory;
    if( resp['result']=='Success') {
      listOfsubsubCategory = resp['data'].map<SubSubCategoryModel>((item) {
        return SubSubCategoryModel.fromJson(item);
      }).toList();

    }else{
      subsubcategory=SubSubCategoryModel();
      subsubcategory.ssCatName='';
      listOfsubsubCategory.add(subsubcategory);
    }
    return listOfsubsubCategory;
  }catch(e){
    print(e);
    rethrow;
  }
}
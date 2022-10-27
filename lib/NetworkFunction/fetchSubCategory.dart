import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Models/category_model.dart';
import 'package:unstoppable/Models/subCategory_model.dart';


Future<List<SubCategoryModel>> fetchSubCategory(String categoryId) async{

  Map<String, String> params;
  params = {
    // 'category_id': categoryData==null?"":categoryData.catId.toString(),
    'category_id': categoryId.toString(),
  };

  var response = await http.post(
    Uri.parse(Api.SubCategory),
     body: params
  );

  try{
    final resp = json.decode(response.body);
    List<SubCategoryModel> listOfsubCategory=[];
    SubCategoryModel subcategory;
    if( resp['result']=='Success') {
      listOfsubCategory = resp['data'].map<SubCategoryModel>((item) {
        return SubCategoryModel.fromJson(item);
      }).toList();

    }else{
      subcategory=SubCategoryModel();
      subcategory.subCatName='Select Category';
      listOfsubCategory.add(subcategory);
    }
    return listOfsubCategory;
  }catch(e){
    print(e);
    rethrow;
  }
}
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Models/category_model.dart';
import 'package:unstoppable/Models/productName_model.dart';
import 'package:unstoppable/Models/subCategory_model.dart';

import '../Models/subSubCategory_model.dart';


Future<List<ProductNameModel>> fetchProductName(String subsubcatId) async{

  Map<String, String> params;
  params = {
    // 'category_id': categoryData==null?"":categoryData.catId.toString(),
    'sscat_id': subsubcatId.toString(),
  };

  var response = await http.post(
      Uri.parse(Api.ProductName),
      body: params
  );

  try{
    final resp = json.decode(response.body);
    List<ProductNameModel> listOfproductName=[];
    ProductNameModel productName;
    if( resp['result']=='Success') {
      listOfproductName = resp['data'].map<ProductNameModel>((item) {
        return ProductNameModel.fromJson(item);
      }).toList();

    }else{
      productName=ProductNameModel();
      productName.prodName='Select sub sub category';
      listOfproductName.add(productName);
    }
    return listOfproductName;
  }catch(e){
    print(e);
    rethrow;
  }
}
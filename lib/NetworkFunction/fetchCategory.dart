import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Models/category_model.dart';


Future<List<CategoryModel>> fetchCategory() async{



  var response = await http.get(
      Uri.parse(Api.Category),
     // body: params
  );

  try{
    final resp = json.decode(response.body);
    List<CategoryModel> listOfCategory=[];
    if( response.statusCode==200) {
      listOfCategory = resp['data'].map<CategoryModel>((item) {
        return CategoryModel.fromJson(item);
      }).toList();

    }
    return listOfCategory;
  }catch(e){
    print(e);
    rethrow;
  }
}
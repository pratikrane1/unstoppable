import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Models/user_profile_model.dart';

import '../../Utils/application.dart';

Future<UserProfileModel> getUserProfile() async {
  var data =[];
  var list;
  var listdata={};
  String? userId;

  final response = await http.post(
    Uri.parse(Api.USER_PROFILE),
    body: {"user_id":Application.vendorLogin!.userId.toString()},
  );
  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body)["data"];
    // // print(responseJson);
    data = responseJson;
    list = data[0];
    print(list);
    listdata = list[0];
    // userId = listdata["3"];
    print(listdata);
    // print("DATA $data");
    // print("DATA ${userData}");
    // final Iterable refactorProduct = data ?? [];
    // final userProfileData = refactorProduct.map((item) {
    //   return UserProfileModel.fromJson(item);
    // }).toList();
    // // print("Data $userProfileData");
    // return UserProfileRepo.fromJson(responseJson);


  }
  return UserProfileModel.fromJson(list);

}
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Models/user_profile_model.dart';

import '../../Utils/application.dart';

class ApiService {
  static Future<dynamic> getUserProfile() async {

    final response = await http.post(
      Uri.parse(Api.USER_PROFILE),
      body: {"user_id":Application.vendorLogin!.userId.toString()},
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      var data = responseJson["data"];
      return UserProfileRepo.fromJson(data);
    }
    // final Iterable refactorProduct = data ?? [];
    // final userProfileData = refactorProduct.map((item) {
    //   return UserProfileModel.fromJson(item);
    // }).toList();
    // print(userProfileData);

  }
}
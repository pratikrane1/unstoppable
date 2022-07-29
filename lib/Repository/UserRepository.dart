import 'dart:convert';

import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Models/vendor_login.dart';
import 'package:unstoppable/Utils/preferences.dart';
import 'package:unstoppable/Utils/util_preferences.dart';



class UserRepository {

  ///Fetch api login
  Future<dynamic> login({String? email,String? password}) async {
    final params = {"user_email":email,"password":password};
    return await Api.login(params);
  }


  ///Save Storage
  Future<dynamic> saveUser(VendorLogin user) async {
    return await UtilPreferences.setString(
      Preferences.user,
      jsonEncode(user.toJson()),
    );
  }

  // //save image
  // Future<dynamic> saveImage(String image) async {
  //   return await UtilPreferences.setString(
  //     Preferences.profilePic,image);
  // }
  //
  //


  ///Get from Storage
  dynamic getUser() {
    return UtilPreferences.getString(Preferences.user);
  }

  // dynamic getProfile() {
  //   return UtilPreferences.getString(Preferences.profilePic);
  // }



  ///Delete Storage
  Future<dynamic> deleteUser() async {
    return await UtilPreferences.remove(Preferences.user);
  }

  Future<dynamic> fetchDashboardCount({String? userId}) async {
    final params = {"userid":userId};
    return await Api.getDashBoardCount(params);
  }
  Future<dynamic> fetchProduct({String? userId}) async {
    final params = {"user_id":userId};
    return await Api.getProduct(params);
  }

  Future<dynamic> fetchProductDetail({String? productId}) async {
    final params = {"product_id":productId};
    return await Api.getProductDetail(params);
  }


}


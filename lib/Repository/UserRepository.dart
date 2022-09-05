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
    final params = {"user_id":userId};
    return await Api.getDashBoardCount(params);
  }

  Future<dynamic> fetchProduct({String? userId,String? offset}) async {
    final params = {"user_id":userId,
      "offset":offset};
    return await Api.getProduct(params);
  }
  Future<dynamic> fetchProductBuying({String? userId,String? offset}) async {
    final params = {"user_id":userId,
      "offset":offset};
    return await Api.getProductBuying(params);
  }

  Future<dynamic> fetchProductImage({String? productId,String? offset}) async {
    final params = {"product_id":productId,
      "offset":offset};
    return await Api.getProductImage(params);
  }

  Future<dynamic> fetchSubCategory({String? catId}) async {
    final params = {"cat_id":catId,
      };
    return await Api.getProduct(params);
  }

  Future<dynamic> fetchProductDetail({String? productId}) async {
    final params = {"product_id":productId};
    return await Api.getProductDetail(params);
  }

  Future<dynamic> fetchOrders({String? userId}) async {
    final params = {"user_id":userId};
    return await Api.getOrders(params);
  }

  Future<dynamic> fetchCSR({String? userid}) async {
    final params = {"user_id":userid};
    return await Api.getCSR(params);
  }

  Future<dynamic> getBNCLead({String? userId, String?  rowId}) async {
    final params = {"user_id":userId,
                      "row_id":rowId};
    return await Api.getbncLeads(params);
  }

  Future<dynamic> fetchCustomerEnquiries({String? userId}) async {
    final params = {"user_id":userId};
    return await Api.getCustomerEnquiry(params);
  }

  Future<dynamic> fetchLeads({String? userId}) async {
    final params = {"user_id":userId};
    return await Api.getLeads(params);
  }

  Future<dynamic> fetchManageAllBuying({String? userId}) async {
    final params = {"user_id":userId};
    return await Api.getManageAllBuying(params);
  }

  Future<dynamic> fetchCompanyProfile({String? userId}) async {
    final params = {"user_id":userId};
    return await Api.getCompanyProfile(params);
  }

  Future<dynamic> fetchUserProfile({String? userId}) async {
    final params = {"user_id":userId};
    return await Api.getUserProfile(params);
  }

  Future<dynamic> fetchBusinessNetworking({String? userId,String? offset}) async {
    final params = {"user_id":userId,
      "offset":offset};
    return await Api.getBusinessNetworkingList(params);
  }

  Future<dynamic> fetchPaymentHistory({String? userId}) async {
    final params = {"user_id":userId};
    return await Api.getPaymentHistory(params);
  }

}


import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:unstoppable/Models/product_detail_model.dart';

import 'dart:convert';
import 'package:unstoppable/Models/vendor_login.dart';

import '../Models/customerEnquiries_model.dart';
import '../Models/home_model.dart';
import '../Models/product_model.dart';


class Api {

  // static const String HOST_URL="http://93.188.162.210:3000/";//updated on 23/12/2020
  //static const String HOST_URL="https://unstoppabletrade.in/App_details/";
  static const String HOST_URL="http://unstoppabletrade.ezii.live/App_details/";
  static const String VENDOR_LOGIN="app_login";
  static const String Vendor_Dashboard_Count ="get_dashboard_data";
  static const String Product ="get_products";
  static const String Product_Detail ="get_product_details";
  static const String Customer_Enquiries ="get_customer_enquiry";

  ///Login api
  static Future<dynamic> login(params) async {
    final response = await http.post(
      Uri.parse(HOST_URL+VENDOR_LOGIN),
      body: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return VendorLoginResp.fromJson(responseJson);
    }
  }

  static Future<dynamic> getDashBoardCount(params) async {
    final response = await http.post(
      Uri.parse(HOST_URL+Vendor_Dashboard_Count),
      body: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      return DashBoardCountResp.fromJson(responseJson);
    }
  }

  static Future<dynamic> getProduct(params) async {
    final response = await http.post(
      Uri.parse(HOST_URL+Product),
      body: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ProductRepo.fromJson(responseJson);
    }
  }

  static Future<dynamic> getProductDetail(params) async {
    final response = await http.post(
      Uri.parse(HOST_URL+Product_Detail),
      body: params,
    );
    print(response);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      return ProductDetailRepo.fromJson(responseJson);
    }
  }

  static Future<dynamic> getCustomerEnquiry(params) async {
    final response = await http.post(
      Uri.parse(HOST_URL+Customer_Enquiries),
      body: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return CustomerEnquiriesModelRepo.fromJson(responseJson);
    }
  }
  // //get prod list api
  // static Future<dynamic> getProducerList(params) async {
  //   // final response = await http.get(Uri.parse(GET_PRODUCER_LIST));
  //   final response = await http.post(Uri.parse(GET_PRODUCER_LIST),
  //     body: params);
  //   if (response.statusCode == 200) {
  //     final responseJson = json.decode(response.body);
  //     return ProducerListResp.fromJson(responseJson);
  //   }
  // }


}
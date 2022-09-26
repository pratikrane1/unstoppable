import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:unstoppable/Models/businessNetworking_model.dart';
import 'package:unstoppable/Models/category_model.dart';
import 'package:unstoppable/Models/payment_history_model.dart';
import 'package:unstoppable/Models/productIamBuying_model.dart';
import 'package:unstoppable/Models/product_detail_model.dart';
import 'package:unstoppable/Models/user_profile_model.dart';

import 'dart:convert';
import 'package:unstoppable/Models/vendor_login.dart';

import '../Models/company_profile_model.dart';
import '../Models/csr_model.dart';
import '../Models/customerEnquiries_model.dart';
import '../Models/get_BNC_model.dart';
import '../Models/home_model.dart';
import '../Models/leads_model.dart';
import '../Models/manageAllBuyingRequirements_model.dart';
import '../Models/productImage_model.dart';
import '../Models/product_model.dart';


class Api {

  // static const String HOST_URL="http://93.188.162.210:3000/";//updated on 23/12/2020
  static const String HOST_URL="https://unstoppabletrade.in/App_details/";
  // static const String HOST_URL="http://unstoppabletrade.ezii.live/App_details/";
  static const String VENDOR_LOGIN="app_login";
  static const String VENDOR_Registration=HOST_URL+"register_vendor";
  static const String Vendor_Dashboard_Count ="get_dashboard_data";
  static const String Product ="get_products";
  static const String ProductBuying ="get_product_buying";
  static const String AddProductBuying =HOST_URL+"save_product_buying";
  static const String ProductImage ="get_product_images";
  static const String Product_Detail ="get_product_details";
  static const String Customer_Enquiries ="get_customer_enquiry";
  static const String Category = HOST_URL+"get_category";
  static const String SubCategory = HOST_URL+"get_sub_category";
  static const String SubSubCategory = HOST_URL+"get_sub_sub_category";
  static const String ProductName = HOST_URL+"get_products_by_sscat";
  static const String addProduct = HOST_URL+"save_product";
  static const String delProduct = HOST_URL+"delete_product";
  static const String delEnquiry = HOST_URL+"delete_customer_enquiry";
  static const String delProductBuying = HOST_URL+"delete_product_buying";
  static const String updateProduct = HOST_URL+"update_product";
  static const String updateBNC = HOST_URL+"update_bnc";
  static const String uploadImage = HOST_URL+"upload_product_images";
  static const String removeImage = HOST_URL+"remove_product_images";
  static const String Leads ="get_leads";
  static const String ManageAllBuyingRequirement ="get_all_buying_requirement";
  static const String PaymentHistory ="get_payment_history";
  static const String BuyingRequirementForm =HOST_URL+"save_buying_requirement";
  static const String delAllBuyingRequirement = HOST_URL+"delete_buying_requirement";
  static const String COMPANY_PROFILE ="get_company_profile";
  static const String USER_PROFILE =HOST_URL+"get_user_profile";
  static const String updateCompanyProfile =HOST_URL+"update_company_profile";
  static const String updateOrderData =HOST_URL+"update_leads";
  static const String BUSI_NET_LIST =HOST_URL+"get_business_networking_leads";
  static const String CHANGE_PASS=HOST_URL+"update_password";
  static const String CSR=HOST_URL+"get_csr_details";
  static const String GetBNC=HOST_URL+"get_bnc";
  static const String Getorders=HOST_URL+"my_unstoppable_orders";
  static const String UPDATE_LEAD_STATUS=HOST_URL+"vendor_update_lead_status";
  static const String GENERATE_TOKEN="https://unstoppabletrade.in/Paytmtoken/";


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

  static Future<dynamic> getProductBuying(params) async {
    final response = await http.post(
      Uri.parse(HOST_URL+ProductBuying),
      body: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ProductBuyingRepo.fromJson(responseJson);
    }
  }

  static Future<dynamic> getProductImage(params) async {
    final response = await http.post(
      Uri.parse(HOST_URL+ProductImage),
      body: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ProductImageRepo.fromJson(responseJson);
    }
  }

  static Future<dynamic> getLeads(params) async {
    final response = await http.post(
      Uri.parse(HOST_URL+Leads),
      body: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return LeadsRepo.fromJson(responseJson);
    }
  }
  static Future<dynamic> getbncLeads(params) async {
    final response = await http.post(
      Uri.parse(GetBNC),
      body: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return GetBNCRepo.fromJson(responseJson);
    }
  }

  static Future<dynamic> getManageAllBuying(params) async {
    final response = await http.post(
      Uri.parse(HOST_URL+ManageAllBuyingRequirement),
      body: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ManageAllBuyingRequirementRepo.fromJson(responseJson);
    }
  }

  static Future<dynamic> getPaymentHistory(params) async {
    final response = await http.get(
      Uri.parse(HOST_URL+PaymentHistory),
      headers: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return PaymentHistoryRepo.fromJson(responseJson);
    }
  }

  static Future<dynamic> getCompanyProfile(params) async {
    final response = await http.post(
      Uri.parse(HOST_URL+COMPANY_PROFILE),
      body: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return CompanyProfileRepo.fromJson(responseJson);
    }
  }

  static Future<dynamic> getUserProfile(params) async {
    final response = await http.post(
      Uri.parse(USER_PROFILE),
      body: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return UserProfileRepo.fromJson(responseJson);
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

  static Future<dynamic> getOrders(params) async {
    final response = await http.post(
      Uri.parse(Getorders),
      body: params,
    );
    print(response);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      return ProductBuyingRepo.fromJson(responseJson);
    }
  }

  static Future<dynamic> getCSR(params) async {
    final response = await http.post(
      Uri.parse(CSR),
      body: params,
    );
    print(response);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      return CSRRepo.fromJson(responseJson);
    }
  }

  static Future<dynamic> getCustomerEnquiry(params) async {
    final response = await http.post(
      Uri.parse(HOST_URL + Customer_Enquiries),
      body: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return CustomerEnquiriesModelRepo.fromJson(responseJson);
    }
  }

  static Future<dynamic> getBusinessNetworkingList(params) async {
    final response = await http.post(
      Uri.parse(BUSI_NET_LIST),
      body: params,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return BusinessNetworkingRepo.fromJson(responseJson);
    }
  }

}
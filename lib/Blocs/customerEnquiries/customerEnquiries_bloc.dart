import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Blocs/authentication/authentication_event.dart';
import 'package:unstoppable/Blocs/login/login_event.dart';
import 'package:unstoppable/Blocs/login/login_state.dart';
import 'package:unstoppable/Models/customerEnquiries_model.dart';
import 'package:unstoppable/Models/customerEnquiries_model.dart';
import 'package:unstoppable/Models/customerEnquiries_model.dart';
import 'package:unstoppable/Models/customerEnquiries_model.dart';
import 'package:unstoppable/Models/home_model.dart';
import 'package:unstoppable/Models/product_model.dart';
import 'package:unstoppable/Models/vendor_login.dart';
import 'package:unstoppable/Repository/UserRepository.dart';
import 'package:unstoppable/app_bloc.dart';

import '../../Models/customerEnquiries_model.dart';
import '../../Models/product_detail_model.dart';
import '../../Utils/application.dart';
import 'customerEnquiries_event.dart';
import 'customerEnquiries_state.dart';


class CustomerEnquiriesBloc extends Bloc<CustomerEnquiriesEvent, CustomerEnquiriesState> {
  CustomerEnquiriesBloc({this.customerEnquiriesModelRepo})
      : super(InitialCustomerEnquiriesListState());
  final UserRepository? customerEnquiriesModelRepo;


  @override
  Stream<CustomerEnquiriesState> mapEventToState(event) async* {


    ///Event for login
    if (event is OnLoadingCustomerEnquiriesList) {
      ///Notify loading to UI
      yield CustomerEnquiriesLoading();

      ///Fetch API via repository
      final CustomerEnquiriesModelRepo response = await customerEnquiriesModelRepo!
          .fetchCustomerEnquiries(
          userId: event.userid
      );

      final Iterable refactorCustomerEnquiries = response.data ?? [];
      final listCustomerEnquiries = refactorCustomerEnquiries.map((item) {
        return CustomerEnquiriesModel.fromJson(item);
      }).toList();

      yield CustomerEnquiriesListSuccess(
          CustomerEnquiriesList: listCustomerEnquiries);
    }


    //Delete Customer Enquiries
    if (event is DeleteCustomerEnquiries) {
      yield DeleteCustomerEnquiriesLoading();
      Map<String, String> params;
      params = {
        'enq_id': event.enqid
      };

      var response = await http.post(
          Uri.parse(Api.delEnquiry),
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp['result'] == 'Success') {
          yield DeleteCustomerEnquiriesSuccess();
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }
  }

}


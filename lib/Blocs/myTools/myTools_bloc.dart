import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import 'package:unstoppable/Api/api.dart';
import 'package:unstoppable/Blocs/authentication/authentication_event.dart';
import 'package:unstoppable/Blocs/login/login_event.dart';
import 'package:unstoppable/Blocs/login/login_state.dart';
import 'package:unstoppable/Models/home_model.dart';
import 'package:unstoppable/Models/product_model.dart';
import 'package:unstoppable/Models/untoppable_order_model.dart';
import 'package:unstoppable/Models/vendor_login.dart';
import 'package:unstoppable/Repository/UserRepository.dart';
import 'package:unstoppable/app_bloc.dart';

import '../../Models/productIamBuying_model.dart';
import '../../Models/product_detail_model.dart';
import '../../Utils/application.dart';
import 'myTools_event.dart';
import 'myTools_state.dart';

//for multipart
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mime/mime.dart';


class MytoolsBloc extends Bloc<MytoolsEvent, MytoolsState> {
  MytoolsBloc({this.productBuyingRepo,}) : super(InitialMytoolsState());
  final UserRepository? productBuyingRepo;




  @override
  Stream<MytoolsState> mapEventToState(event) async* {
    if (event is OnLoadingProductIamBuyingList) {
      ///Notify loading to UI
      yield ProductIamBuyingLoading();

      ///Fetch API via repository
      final ProductBuyingRepo response = await productBuyingRepo!
          .fetchProductBuying(
          userId: event.userid,
          offset:
          event.offset.toString()
      );

      final Iterable refactorProductBuying = response.data ?? [];
      final listproductBuying = refactorProductBuying.map((item) {
        return ProductBuyingModel.fromJson(item);
      }).toList();
      if (refactorProductBuying.length > 0) {
        yield ProductIamBuyingListSuccess(productBuyingList: listproductBuying);
      } else {
        yield ProductIamBuyingListLoadFail();
      }
    }

    if (event is AddProductBuying) {
      yield AddProductBuyingLoading();


      Map<String, String> params;
      params = {
        'cat_id': event.catId,
        'subcat_id':event.subCatId,
        'sscat_id':event.sscatId,
        'prod_name':event.prodName,
        'user_id':Application.vendorLogin!.userId.toString()
      };

      var response = await http.post(
          Uri.parse(Api.AddProductBuying),
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp['result'] == 'Success') {
          yield AddProductBuyingSuccess();
        }else{
          yield AddProductBuyingLoadFail(message: resp['message']);
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }

   // remove productBuying
    if (event is DeleteProductBuying) {
      yield DeleteProductBuyingLoading();
      Map<String, String> params;
      params = {
        'ord_id': event.ordid
      };

      var response = await http.post(
          Uri.parse(Api.delProductBuying),
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp['result'] == 'Success') {
          yield DeleteProductBuyingSuccess();
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }

    // List for unstoppable orders
    if (event is OnLoadingUnstoppableOrderList) {
      ///Notify loading to UI
      yield UnstoppableOrdersLoading();

      ///Fetch API via repository
      final ProductBuyingRepo response = await productBuyingRepo!
          .fetchOrders(
          userId: event.userid,
          // offset:
          // event.offset.toString()
      );

      final Iterable refactorOrders = response.data ?? [];
      final listorders = refactorOrders.map((item) {
        return UnstoppableOrderModel.fromJson(item);
      }).toList();
      if (refactorOrders.length > 0) {
        yield UnstoppableOrdersListSuccess(ordersList: listorders);
      } else {
        yield UnstoppableOrdersListLoadFail();
      }
    }

    // Update Order Data
    if (event is UpdateOrderData) {
      yield UpdateOrderDataLoading();
      Map<String, String> params;
      params = {
        'qty':event.qty,
        'amount':event.amount,
      };

      var response = await http.post(
          Uri.parse(Api.updateCompanyProfile),
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp['result'] == 'Success') {
          yield UpdateOrderDataSuccess();
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }

  }
}




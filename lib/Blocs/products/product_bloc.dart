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
import 'package:unstoppable/Models/vendor_login.dart';
import 'package:unstoppable/Repository/UserRepository.dart';
import 'package:unstoppable/app_bloc.dart';

import '../../Models/product_detail_model.dart';
import '../../Utils/application.dart';
import 'product_event.dart';
import 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({this.productRepo}) : super(InitialProductListState());
  final UserRepository? productRepo;


  @override
  Stream<ProductState> mapEventToState(event) async* {
    if (event is OnLoadingProductList) {
      ///Notify loading to UI
      yield ProductLoading();

      ///Fetch API via repository
      final ProductRepo response = await productRepo!
          .fetchProduct(
          userId: event.userid,
          offset:
          event.offset.toString()
      );

      final Iterable refactorProduct = response.data ?? [];
      final listproduct = refactorProduct.map((item) {
        return ProductModel.fromJson(item);
      }).toList();
      if (refactorProduct.length > 0) {
        yield ProductListSuccess(productList: listproduct);
      } else {
        yield ProductListLoadFail();
      }
    }

/////////////
    if (event is OnLoadingProductDetail) {
      ///Notify loading to UI
      yield ProductDetailLoading();

      ///Fetch API via repository
      final ProductDetailRepo result = await productRepo!
          .fetchProductDetail(
          productId: event.prodId
      );

      ///Case API fail but not have token
      if (result.result == "Success") {
        ProductDetail productDetail = new ProductDetail();
        productDetail = result.data;

        yield ProductDetailSuccess(data: productDetail);
      }
    }


    //remove product image
    if (event is DeleteProduct) {
      yield DeleteProductLoading();
      Map<String, String> params;
      params = {
        'product_id': event.productid
      };

      var response = await http.post(
          Uri.parse(Api.delProduct),
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp['result'] == 'Success') {
          yield DeleteProductSuccess();
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }

    // For Product Update
    if (event is UpdateProduct) {
      yield UpdateProductLoading();
      Map<String, String> params;
      params = {
        'cat_id': event.catid,
        'subcat_id':event.subcatid,
        'sscat_id':event.sscatid,
        'prod_name':event.prodname,
        'price':event.price,
        'description':event.description,
        'product_id':event.productid,
      };

      var response = await http.post(
          Uri.parse(Api.updateProduct),
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp['result'] == 'Success') {
          yield UpdateProductSuccess();
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }
  }
}




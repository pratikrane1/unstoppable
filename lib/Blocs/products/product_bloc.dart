import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
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


    ///Event for login
    if (event is OnLoadingProductList) {
      ///Notify loading to UI
      yield ProductLoading();

      ///Fetch API via repository
      final ProductRepo response = await productRepo!
          .fetchProduct(
          userId: event.userid,
               offset:
          event.offset
      );

      final Iterable refactorProduct = response.data ?? [];
      final listproduct = refactorProduct.map((item) {
        return ProductModel.fromJson(item);
      }).toList();

      yield ProductListSuccess(productList: listproduct);
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
  }

}
